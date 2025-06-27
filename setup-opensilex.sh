#!/bin/bash
# OpenSILEX Installation Script for Azure VM
# Run this script on your Debian 12 VM after SSH connection
# Modified to use default user instead of creating opensilex user

set -e

echo "=== OpenSILEX Installation Script ==="

# Get current user
CURRENT_USER=$(whoami)
USER_HOME=$(eval echo ~$CURRENT_USER)

echo "Installing for user: $CURRENT_USER"
echo "User home directory: $USER_HOME"

# Update system
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install Java JDK (17 is available in Debian 12 and compatible with OpenSILEX)
echo "Installing Java JDK 17..."
sudo apt install -y openjdk-17-jdk openjdk-17-jre

# Note: Java 17 requires additional flags for compatibility with older Tomcat versions
# These flags are included in the opensilex.sh script and systemd service

# Verify Java installation
echo "Java version:"
java --version

# Install Docker for MongoDB and RDF4J
echo "Installing Docker..."
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Add user to docker group
sudo usermod -aG docker $CURRENT_USER

# Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install other useful tools
sudo apt install -y wget unzip nano nginx

echo "=== Setting up MongoDB ==="

# Create MongoDB network and start container
sudo docker network create mongoCluster 2>/dev/null || true
sudo docker run -d --restart unless-stopped -p 27017:27017 --name mongo_opensilex --network mongoCluster mongo:5 mongod --replSet opensilex --bind_ip localhost,mongo_opensilex

# Wait for MongoDB to start
echo "Waiting for MongoDB to start..."
sleep 10

# Initialize replica set
sudo docker exec mongo_opensilex mongosh --eval "rs.initiate({_id: 'opensilex', members: [{_id: 0, host: 'mongo_opensilex:27017'}]})"

echo "=== Setting up RDF4J ==="

# Start RDF4J container
sudo docker run -d --restart unless-stopped -p 8080:8080 --name rdf4j_opensilex \
    -e JAVA_OPTS="-Xms2g -Xmx2g" \
    -v rdf4j_data:/var/rdf4j \
    -v rdf4j_logs:/usr/local/tomcat/logs \
    eclipse/rdf4j-workbench:5.0.3

echo "=== Setting up OpenSILEX directories ==="

# Create directories in current user's home
mkdir -p $USER_HOME/opensilex/bin
mkdir -p $USER_HOME/opensilex/config
mkdir -p $USER_HOME/opensilex/data
mkdir -p $USER_HOME/opensilex/logs

echo "=== Downloading OpenSILEX ==="

# Get latest version info and download
LATEST_VERSION=$(curl -s https://api.github.com/repos/OpenSILEX/opensilex/releases/latest | grep tag_name | cut -d '"' -f 4)
echo "Downloading OpenSILEX version: $LATEST_VERSION"

cd $USER_HOME/opensilex/bin
wget "https://github.com/OpenSILEX/opensilex/releases/download/$LATEST_VERSION/opensilex-release-$LATEST_VERSION.zip"
unzip "opensilex-release-$LATEST_VERSION.zip"

# Remove the zip file
rm "opensilex-release-$LATEST_VERSION.zip"

echo "=== Creating OpenSILEX configuration ==="

# Create configuration file
tee $USER_HOME/opensilex/config/opensilex.yml > /dev/null <<EOF
ontologies:
  baseURI: http://www.opensilex.org/
  baseURIAlias: os
  sparql:
    config:
      serverURI: http://localhost:8080/rdf4j-server/
      repository: opensilex

file-system:
  fs:
    config:
      basePath: $USER_HOME/opensilex/data

big-data:
  mongodb:
    config:
      host: localhost
      port: 27017
      database: opensilex

server:
  host: 0.0.0.0
  port: 28081
  adminPort: 24081
EOF

# Update logback.xml (files are extracted directly into the bin directory)
sed -i "s|<property name=\"log.path\" value=\".*\"/>|<property name=\"log.path\" value=\"$USER_HOME/opensilex/logs\"/>|" "$USER_HOME/opensilex/bin/logback.xml"

# Create OpenSILEX script with Java 17 compatibility flags
tee "$USER_HOME/opensilex/bin/opensilex.sh" > /dev/null <<EOF
#!/bin/bash

SCRIPT_DIR="\$(dirname "\$(readlink -f "\$0")")"
CONFIG_FILE="$USER_HOME/opensilex/config/opensilex.yml"

cd \$SCRIPT_DIR

# Java 17 compatibility flags for Tomcat
java --add-opens java.base/java.lang=ALL-UNNAMED \\
     --add-opens java.base/java.io=ALL-UNNAMED \\
     --add-opens java.base/java.util=ALL-UNNAMED \\
     --add-opens java.base/java.util.concurrent=ALL-UNNAMED \\
     --add-opens java.rmi/sun.rmi.transport=ALL-UNNAMED \\
     -jar \$SCRIPT_DIR/opensilex.jar --BASE_DIRECTORY=\$SCRIPT_DIR --CONFIG_FILE=\$CONFIG_FILE "\$@"
EOF

chmod +x "$USER_HOME/opensilex/bin/opensilex.sh"

# Create alias for current user
if ! grep -q "alias opensilex=" $USER_HOME/.bash_aliases 2>/dev/null; then
    echo "alias opensilex=\"$USER_HOME/opensilex/bin/opensilex.sh\"" >> $USER_HOME/.bash_aliases
fi

# Also add to .bashrc if .bash_aliases doesn't exist or isn't sourced
if ! grep -q "source.*\.bash_aliases" $USER_HOME/.bashrc 2>/dev/null; then
    echo "" >> $USER_HOME/.bashrc
    echo "# Source aliases if file exists" >> $USER_HOME/.bashrc
    echo "if [ -f ~/.bash_aliases ]; then" >> $USER_HOME/.bashrc
    echo "    . ~/.bash_aliases" >> $USER_HOME/.bashrc
    echo "fi" >> $USER_HOME/.bashrc
fi

echo "=== Setting up Nginx reverse proxy ==="

# Configure Nginx
sudo tee /etc/nginx/sites-enabled/default > /dev/null <<'EOF'
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        # Comment the following line to avoid an error and enable proxy
        # try_files $uri $uri/ =404;
        # Add proxy settings
        proxy_pass http://127.0.0.1:28081;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
EOF

sudo systemctl restart nginx

echo "=== Creating systemd service ==="

# Create systemd service for OpenSILEX with Java 17 compatibility
sudo tee /etc/systemd/system/opensilex.service > /dev/null <<EOF
[Unit]
Description=OpenSILEX Application
After=network.target docker.service
Requires=docker.service

[Service]
Type=simple
User=$CURRENT_USER
WorkingDirectory=$USER_HOME/opensilex/bin
ExecStart=/usr/bin/java --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.io=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.util.concurrent=ALL-UNNAMED --add-opens java.rmi/sun.rmi.transport=ALL-UNNAMED -jar $USER_HOME/opensilex/bin/opensilex.jar --BASE_DIRECTORY=$USER_HOME/opensilex/bin --CONFIG_FILE=$USER_HOME/opensilex/config/opensilex.yml server start --host=0.0.0.0 --port=28081 --adminPort=24081
ExecStop=$USER_HOME/opensilex/bin/opensilex.sh server stop --host=0.0.0.0 --adminPort=24081
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable opensilex

echo "=== Installation completed! ==="
echo ""
echo "Next steps:"
echo "1. Logout and login again (or run 'newgrp docker' and 'source ~/.bashrc')"
echo "2. Initialize the system: opensilex system install"
echo "3. Create admin user: opensilex user add --admin"
echo "4. Start OpenSILEX service: sudo systemctl start opensilex"
echo ""
echo "OpenSILEX files are located in: $USER_HOME/opensilex/"
echo "OpenSILEX will be available at: http://\$(curl -s http://checkip.amazonaws.com/)"
echo "Direct access (if needed): http://\$(curl -s http://checkip.amazonaws.com/):28081"
echo ""
echo "Note: This installation is configured for Java 17 compatibility"