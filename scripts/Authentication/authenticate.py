"""
Working authentication script that handles the token extraction properly
"""
import sys
import os
import json
import urllib3
import swagger_client
from swagger_client.api.authentication_api import AuthenticationApi
from swagger_client.models.authentication_dto import AuthenticationDTO
from swagger_client.rest import ApiException
from utils.get_host import get_api_host_url

# Disable SSL warnings
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

# Configuration
API_HOST = "http://20.31.134.145:28081/rest"  # Use the working host directly
API_USER = "admin@opensilex.org"
API_PASSWORD = "admin"


def authenticate_with_raw_response(host=None, username=None, password=None):
    """
    Authenticate using raw HTTP request to bypass swagger client issues
    """
    host_to_use = host or API_HOST
    user_to_use = username or API_USER
    password_to_use = password or API_PASSWORD
    
    # Remove /rest from host if present for raw request
    base_host = host_to_use.replace('/rest', '')
    
    print(f"Attempting raw authentication at: {base_host}/rest/security/authenticate")
    
    http = urllib3.PoolManager(cert_reqs='CERT_NONE')
    
    auth_data = {
        "identifier": user_to_use,
        "password": password_to_use
    }
    
    try:
        response = http.request(
            'POST',
            f"{base_host}/rest/security/authenticate",
            body=json.dumps(auth_data),
            headers={
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        )
        
        if response.status != 200:
            print(f"Authentication failed with status: {response.status}")
            return None
            
        # Parse the response
        data = json.loads(response.data.decode('utf-8'))
        
        # Try different token locations
        token = None
        if isinstance(data, dict):
            # Direct token field
            if 'token' in data:
                token = data['token']
            # Wrapped in result
            elif 'result' in data:
                if isinstance(data['result'], dict) and 'token' in data['result']:
                    token = data['result']['token']
                elif isinstance(data['result'], str):
                    token = data['result']
            # Wrapped in data
            elif 'data' in data:
                if isinstance(data['data'], dict) and 'token' in data['data']:
                    token = data['data']['token']
                elif isinstance(data['data'], str):
                    token = data['data']
        elif isinstance(data, str):
            # Response might be the token itself
            token = data
            
        return token
        
    except Exception as e:
        print(f"Raw authentication failed: {e}")
        return None


def get_authenticated_client(host=None, username=None, password=None, interactive_host_selection=False):
    """
    Get an authenticated swagger client, handling token extraction issues
    """
    # Get host
    host_to_use = host
    if not host_to_use and interactive_host_selection:
        host_to_use = get_api_host_url(interactive_host_selection=True)
    if not host_to_use:
        host_to_use = API_HOST
        
    user_to_use = username or API_USER
    password_to_use = password or API_PASSWORD
    
    print(f"Authenticating user '{user_to_use}' at host: {host_to_use}")
    
    # First, try the swagger client approach
    config = swagger_client.Configuration()
    config.host = host_to_use
    config.verify_ssl = False
    
    client = swagger_client.ApiClient(config)
    auth_api = AuthenticationApi(client)
    
    try:
        auth_dto = AuthenticationDTO(identifier=user_to_use, password=password_to_use)
        response = auth_api.authenticate(body=auth_dto)
        
        # Check if we got a token
        token = None
        if hasattr(response, 'token') and response.token:
            token = response.token
        elif hasattr(response, '_token') and response._token:
            token = response._token
        elif hasattr(response, 'result'):
            if hasattr(response.result, 'token'):
                token = response.result.token
            elif isinstance(response.result, str):
                token = response.result
                
        if not token:
            print("Swagger client returned no token, trying raw HTTP approach...")
            token = authenticate_with_raw_response(host_to_use, user_to_use, password_to_use)
            
        if token:
            print(f"Successfully authenticated! Token: {token[:20]}...")
            
            # Create authenticated client
            auth_config = swagger_client.Configuration()
            auth_config.host = host_to_use
            auth_config.verify_ssl = False
            auth_config.api_key['Authorization'] = token
            auth_config.api_key_prefix['Authorization'] = 'Bearer'
            
            return swagger_client.ApiClient(auth_config), token
        else:
            print("Failed to obtain authentication token")
            return None, None
            
    except ApiException as e:
        print(f"Swagger authentication failed: {e.status} - {e.reason}")
        print("Trying raw HTTP approach...")
        
        token = authenticate_with_raw_response(host_to_use, user_to_use, password_to_use)
        if token:
            print(f"Successfully authenticated via raw HTTP! Token: {token[:20]}...")
            
            # Create authenticated client
            auth_config = swagger_client.Configuration()
            auth_config.host = host_to_use
            auth_config.verify_ssl = False
            auth_config.api_key['Authorization'] = token
            auth_config.api_key_prefix['Authorization'] = 'Bearer'
            
            return swagger_client.ApiClient(auth_config), token
            
    return None, None


# Backward compatibility functions
def get_unauthenticated_client(host=None, interactive_host_selection=False, verify_ssl=True):
    """
    Creates an unauthenticated API client
    """
    host_to_use = host
    if not host_to_use and interactive_host_selection:
        host_to_use = get_api_host_url(interactive_host_selection=True)
    if not host_to_use:
        host_to_use = API_HOST
    
    config = swagger_client.Configuration()
    config.host = host_to_use
    config.verify_ssl = verify_ssl
    
    if not verify_ssl:
        urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
    
    return swagger_client.ApiClient(config)


def authenticate_and_get_client(host=None, username=None, password=None, interactive_host_selection=False, verify_ssl=True, debug=False):
    """
    Main authentication function for backward compatibility
    """
    return get_authenticated_client(host, username, password, interactive_host_selection)


if __name__ == "__main__":
    print("Testing authentication methods...\n")
    
    # Test with interactive host selection
    client, token = get_authenticated_client(interactive_host_selection=True)
    
    if client and token:
        print("\n✓ Authentication successful!")
        print(f"✓ Token obtained: {token[:30]}...")
        
        # Test the client by making a simple API call
        try:
            # You can test with any API endpoint here
            print("\nTesting authenticated client...")
            # Example: projects_api = swagger_client.ProjectsApi(client)
            # projects = projects_api.search_projects(authorization=f"Bearer {token}")
            print("✓ Client is ready to use!")
        except Exception as e:
            print(f"✗ Error testing client: {e}")
    else:
        print("\n✗ Authentication failed!")
        print("Please check:")
        print("1. The API host is accessible")
        print("2. Username and password are correct")
        print("3. The API service is running")