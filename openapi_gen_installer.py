#!/usr/bin/env python3
"""
Cross-platform OpenAPI Generator Python Client Setup Script
Works on Windows, macOS, and Linux
"""

import os
import sys
import json
import platform
import subprocess
import argparse
import urllib.request
import shutil
from pathlib import Path
from typing import Optional, Dict, Any


class Colors:
    """Terminal colors for pretty output"""
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    BLUE = '\033[94m'
    ENDC = '\033[0m'
    
    @staticmethod
    def disable():
        Colors.GREEN = ''
        Colors.YELLOW = ''
        Colors.RED = ''
        Colors.BLUE = ''
        Colors.ENDC = ''


# Disable colors on Windows if not in modern terminal
if platform.system() == 'Windows' and not os.environ.get('WT_SESSION'):
    Colors.disable()


def print_success(message: str):
    """Print success message in green"""
    print(f"{Colors.GREEN}✓ {message}{Colors.ENDC}")


def print_error(message: str):
    """Print error message in red"""
    print(f"{Colors.RED}✗ {message}{Colors.ENDC}")


def print_info(message: str):
    """Print info message in yellow"""
    print(f"{Colors.YELLOW}→ {message}{Colors.ENDC}")


def print_header(message: str):
    """Print header in blue"""
    print(f"\n{Colors.BLUE}=== {message} ==={Colors.ENDC}")


class OpenAPISetup:
    """Main class for OpenAPI Generator setup and code generation"""
    
    def __init__(self, version: str = "7.14.0"):
        self.version = version
        self.jar_file = "openapi-generator-cli.jar"
        self.jar_url = f"https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/{version}/openapi-generator-cli-{version}.jar"
        
    def check_java(self) -> bool:
        """Check if Java is installed and has correct version"""
        try:
            result = subprocess.run(['java', '-version'], 
                                  capture_output=True, 
                                  text=True)
            output = result.stderr or result.stdout
            
            # Parse Java version
            for line in output.split('\n'):
                if 'version' in line:
                    # Extract version number
                    import re
                    match = re.search(r'"(\d+)\.?(\d+)?', line)
                    if match:
                        major_version = int(match.group(1))
                        if major_version >= 11 or (major_version == 1 and int(match.group(2) or 0) >= 11):
                            print_success(f"Java {major_version} is installed")
                            return True
                        else:
                            print_error(f"Java 11 or higher is required. Found version: {major_version}")
                            return False
            
            print_error("Could not determine Java version")
            return False
            
        except FileNotFoundError:
            print_error("Java is not installed or not in PATH")
            print_info("Please install Java 11 or higher from: https://adoptium.net/")
            return False
    
    def install_jar(self) -> bool:
        """Download OpenAPI Generator JAR file"""
        print_info(f"Downloading OpenAPI Generator {self.version}...")
        
        try:
            # Download with progress
            def download_progress(block_num, block_size, total_size):
                downloaded = block_num * block_size
                percent = min(downloaded * 100 / total_size, 100)
                sys.stdout.write(f'\rProgress: {percent:.1f}%')
                sys.stdout.flush()
            
            urllib.request.urlretrieve(self.jar_url, self.jar_file, download_progress)
            print()  # New line after progress
            print_success("OpenAPI Generator JAR downloaded successfully")
            return True
            
        except Exception as e:
            print_error(f"Failed to download JAR: {e}")
            return False
    
    def install_pip(self) -> bool:
        """Install via pip"""
        print_info("Installing OpenAPI Generator via pip...")
        
        try:
            subprocess.run([sys.executable, '-m', 'pip', '--version'], 
                         check=True, capture_output=True)
        except:
            print_error("pip is not installed")
            return False
        
        try:
            subprocess.run([sys.executable, '-m', 'pip', 'install', 
                          f'openapi-generator-cli=={self.version}'], 
                         check=True)
            print_success("OpenAPI Generator installed via pip")
            return True
        except subprocess.CalledProcessError as e:
            print_error(f"Failed to install via pip: {e}")
            return False
    
    def install_npm(self) -> bool:
        """Install via npm"""
        print_info("Installing OpenAPI Generator via npm...")
        
        try:
            subprocess.run(['npm', '--version'], check=True, capture_output=True)
        except:
            print_error("npm is not installed. Please install Node.js first.")
            return False
        
        try:
            subprocess.run(['npm', 'install', '-g', 
                          '@openapitools/openapi-generator-cli'], 
                         check=True)
            subprocess.run(['openapi-generator-cli', 'version-manager', 
                          'set', self.version], 
                         check=True)
            print_success("OpenAPI Generator installed via npm")
            return True
        except subprocess.CalledProcessError as e:
            print_error(f"Failed to install via npm: {e}")
            return False
    
    def check_docker(self) -> bool:
        """Check if Docker is available"""
        try:
            subprocess.run(['docker', '--version'], 
                         check=True, capture_output=True)
            print_info("Docker is installed")
            return True
        except:
            print_error("Docker is not installed or not running")
            print_info("Download Docker Desktop from: https://www.docker.com/products/docker-desktop")
            return False
    
    def pull_docker_image(self) -> bool:
        """Pull OpenAPI Generator Docker image"""
        print_info("Pulling OpenAPI Generator Docker image...")
        
        try:
            subprocess.run(['docker', 'pull', 
                          f'openapitools/openapi-generator-cli:v{self.version}'], 
                         check=True)
            print_success("Docker image pulled successfully")
            return True
        except subprocess.CalledProcessError as e:
            print_error(f"Failed to pull Docker image: {e}")
            return False
    
    def generate_client(self, method: str, spec_file: str, output_dir: str, 
                    package_name: Optional[str] = None,
                    config_file: Optional[str] = None,
                    skip_validation: bool = False) -> bool:
        """Generate Python client code"""
        print_info("Generating Python API client...")
        
        # Prepare base command
        if method == 'jar':
            base_cmd = ['java', '-jar', self.jar_file]
        elif method == 'pip':
            base_cmd = ['openapi-generator-cli']
        elif method == 'npm':
            # Check OS for proper npx command
            if platform.system() == 'Windows':
                base_cmd = ['npx.cmd', '@openapitools/openapi-generator-cli']
            else:
                base_cmd = ['npx', '@openapitools/openapi-generator-cli']
        elif method == 'docker':
            # Prepare Docker command with volume mounts
            spec_path = Path(spec_file).resolve()
            output_path = Path(output_dir).resolve()
            
            # Create output directory if it doesn't exist
            output_path.mkdir(parents=True, exist_ok=True)
            
            if platform.system() == 'Windows':
                # Windows Docker path conversion
                spec_mount = str(spec_path).replace('\\', '/')
                output_mount = str(output_path).replace('\\', '/')
            else:
                spec_mount = str(spec_path)
                output_mount = str(output_path)
            
            base_cmd = [
                'docker', 'run', '--rm',
                '-v', f'{spec_mount}:/spec/{spec_path.name}',
                '-v', f'{output_mount}:/output',
                f'openapitools/openapi-generator-cli:v{self.version}'
            ]
            
            # Adjust paths for Docker
            spec_file = f'/spec/{spec_path.name}'
            output_dir = '/output'
        
        # Build generation command
        cmd = base_cmd + [
            'generate',
            '-i', spec_file,
            '-g', 'python',
            '-o', output_dir
        ]
        
        # Add skip validation flag if requested
        if skip_validation:
            cmd.append('--skip-validate-spec')
        
        # Add optional parameters
        if package_name:
            cmd.extend(['--package-name', package_name])
        
        if config_file:
            cmd.extend(['-c', config_file])
        else:
            # Add default Python options
            cmd.extend([
                '--additional-properties=generateSourceCodeOnly=false',
                '--additional-properties=libraryPackage=urllib3'
            ])
        
        # Execute command
        print_info(f"Running: {' '.join(cmd)}")
        
        try:
            result = subprocess.run(cmd, check=True, capture_output=True, text=True)
            print_success(f"Python API client generated successfully in {output_dir}")
            return True
        except subprocess.CalledProcessError as e:
            print_error(f"Failed to generate client: {e}")
            if e.stderr:
                print_error(f"Error output: {e.stderr}")
            return False
    
    def create_config_file(self, filename: str = "openapi-config.json") -> bool:
        """Create sample configuration file"""
        config = {
            "packageName": "opensilex_python_client",
            "projectName": "phis",
            "packageVersion": "1.4.7",
            "packageUrl": "https://github.com/lversen/Phis-API-codegen",
            "libraryPackage": "urllib3",
            "generateSourceCodeOnly": False,
            "hideGenerationTimestamp": True,
            "pythonAttrNoneIfUnset": True
        }
        
        try:
            with open(filename, 'w') as f:
                json.dump(config, f, indent=2)
            print_success(f"Created sample configuration file: {filename}")
            return True
        except Exception as e:
            print_error(f"Failed to create config file: {e}")
            return False


def main():
    """Main entry point"""
    parser = argparse.ArgumentParser(
        description='Cross-platform OpenAPI Generator Python Client Setup',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Install via JAR and generate client
  python openapi-setup.py -m jar -i api.yaml -o ./my-python-client
  
  # Install via pip
  python openapi-setup.py -m pip --install-only
  
  # Generate with custom package name
  python openapi-setup.py --generate-only -i swagger.json -o ./client -p my_api_client
  
  # Use Docker (no Java required)
  python openapi-setup.py -m docker -i ./specs/api.yaml -o ./python-client
  
  # Skip validation for problematic specs
  python openapi-setup.py -i api.json --skip-validation
        """
    )
    
    parser.add_argument('-m', '--method', 
                       choices=['jar', 'pip', 'docker', 'npm'],
                       default='jar',
                       help='Installation method (default: jar)')
    parser.add_argument('-i', '--input',
                       help='OpenAPI specification file')
    parser.add_argument('-o', '--output',
                       default='./python-client',
                       help='Output directory (default: ./python-client)')
    parser.add_argument('-p', '--package',
                       help='Python package name')
    parser.add_argument('-c', '--config',
                       help='Configuration file')
    parser.add_argument('-v', '--version',
                       default='7.14.0',
                       help='OpenAPI Generator version (default: 7.14.0)')
    parser.add_argument('--install-only',
                       action='store_true',
                       help='Only install OpenAPI Generator')
    parser.add_argument('--generate-only',
                       action='store_true',
                       help='Only generate code (skip installation)')
    parser.add_argument('--create-config',
                       action='store_true',
                       help='Create sample configuration file')
    parser.add_argument('--skip-validation',
                       action='store_true',
                       help='Skip OpenAPI specification validation')
    
    args = parser.parse_args()
    
    # Print header
    print_header(f"OpenAPI Generator Python Setup ({platform.system()})")
    
    # Create setup instance
    setup = OpenAPISetup(args.version)
    
    # Handle config file creation
    if args.create_config:
        setup.create_config_file()
        return
    
    # Install if needed
    if not args.generate_only:
        if args.method == 'jar':
            if not setup.check_java():
                sys.exit(1)
            if not setup.install_jar():
                sys.exit(1)
        elif args.method == 'pip':
            if not setup.install_pip():
                sys.exit(1)
        elif args.method == 'npm':
            if not setup.install_npm():
                sys.exit(1)
        elif args.method == 'docker':
            if not setup.check_docker():
                sys.exit(1)
            if not setup.pull_docker_image():
                sys.exit(1)
    
    # Generate code if needed
    if not args.install_only:
        if not args.input:
            print_error("OpenAPI specification file is required for code generation")
            print_info("Use -i or --input to specify the file")
            sys.exit(1)
        
        if not os.path.exists(args.input) and args.method != 'docker':
            print_error(f"Specification file not found: {args.input}")
            sys.exit(1)
        
        if not setup.generate_client(args.method, args.input, args.output, 
                                   args.package, args.config, args.skip_validation):
            sys.exit(1)
        
        # Show next steps
        print_header("Next Steps")
        print_info("1. Navigate to the generated client directory:")
        print(f"   cd {args.output}")
        print_info("2. Install the generated client:")
        print("   pip install -e .")
        print_info("3. Use the client in your Python code:")
        package_name = args.package or 'openapi_client'
        print(f"   from {package_name} import ApiClient, Configuration")
    
    print_success("\nSetup completed successfully!")


if __name__ == '__main__':
    main()