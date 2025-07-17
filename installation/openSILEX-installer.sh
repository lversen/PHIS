
#!/bin/bash
# ===================================================================
# FIXED: openSILEX-installer.sh
# ===================================================================
# OpenSilex Quick Install Script with Phis Theme Configuration
quick_fix_opensilex() {
    cd ~/opensilex-docker-compose 2>/dev/null || {
        git clone --branch 1.4.7 https://forgemia.inra.fr/OpenSILEX/opensilex-docker-compose
        cd ~/opensilex-docker-compose
    }
    
    # Fix environment
    sed -i '/MONGO_DOCKER_NAME/d' opensilex.env
    echo "MONGO_DOCKER_NAME=opensilex-docker-mongodb" >> opensilex.env
    
    # Add Phis Theme Configuration
    echo "" >> opensilex.env
    echo "# Phis Theme Configuration" >> opensilex.env
    echo "OPENSILEX_PATH_PREFIX=phis" >> opensilex.env
    echo "OPENSILEX_CONFIG_APPLICATIONNAME=Phis" >> opensilex.env
    echo "OPENSILEX_CONFIG_THEME=opensilex-phis#phis" >> opensilex.env
    echo "OPENSILEX_CONFIG_HOMECOMPONENT=opensilex-HomeView" >> opensilex.env
    echo "OPENSILEX_CONFIG_LOGINCOMPONENT=opensilex-phis-PhisLoginComponent" >> opensilex.env
    echo "OPENSILEX_CONFIG_HEADERCOMPONENT=opensilex-phis-PhisHeaderComponent" >> opensilex.env
    echo "OPENSILEX_CONFIG_FOOTERCOMPONENT=opensilex-DefaultFooterComponent" >> opensilex.env
    echo "OPENSILEX_CONFIG_MENUCOMPONENT=opensilex-DefaultMenuComponent" >> opensilex.env
    
    # Fix permissions
    sudo chown -R 1001:1001 config/
    sudo chmod -R 755 config/
    
    # Restart everything with sudo
    sudo docker compose --env-file opensilex.env down
    sudo docker compose --env-file opensilex.env build --build-arg UID=1001 --build-arg GID=1001
    sudo docker compose --env-file opensilex.env up -d
    
    # Wait and check
    echo "Waiting for OpenSilex to start (up to 180s)..."
    for i in {1..36}; do  # 36 x 5s = 180s
        if sudo docker logs opensilex-docker-opensilexapp --tail=50 2>&1 | grep -q "Starting ProtocolHandler"; then
            echo "✅ OpenSilex with Phis theme is running at http://$(curl -s ifconfig.me):28081/phis/app"
            
            # Wait for service to be fully ready
            echo "Waiting 10 more seconds for service to be fully ready..."
            sleep 10
            
            # Check if user already exists (removed -it flags)
            echo "Checking for existing admin user..."
            if sudo docker exec opensilex-docker-opensilexapp ./bin/opensilex.sh user list 2>/dev/null | grep -q "admin@opensilex.org"; then
                echo "⚠️ User 'admin@opensilex.org' already exists. Skipping user creation."
            else
                echo "Creating admin user..."
                # Add admin user with correct syntax (no -it, --admin without =true)
                if sudo docker exec opensilex-docker-opensilexapp ./bin/opensilex.sh user add \
                    --admin \
                    --email=admin@opensilex.org \
                    --lang=en \
                    --firstName=Admin \
                    --lastName=User \
                    --password=admin 2>&1; then
                    echo "✅ Admin user 'admin@opensilex.org' created successfully."
                else
                    echo "❌ Failed to create admin user. Error details above."
                    echo "To create manually, run:"
                    echo "sudo docker exec opensilex-docker-opensilexapp ./bin/opensilex.sh user add --admin --email=admin@opensilex.org --lang=en --firstName=Admin --lastName=User --password=admin"
                fi
            fi
            
            echo ""
            echo "Default login: admin@opensilex.org / admin"
            echo "🎨 Theme: Phis (configured with custom components)"
            return
        fi
        sleep 5
    done
    echo "❌ Something went wrong. Check logs with:"
    echo "sudo docker logs opensilex-docker-opensilexapp --tail=50"
}

# Execute the function
quick_fix_opensilex