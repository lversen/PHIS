"""
This module provides a standardized way to authenticate with the OpenSilex API
and initialize a configured client.

It centralizes the authentication logic, making it easy to reuse the API client
across different parts of an application. This module uses a username and
password to fetch a temporary access token, which is the recommended and
more secure approach.

It also includes an optional interactive mode to select the API host from your
SSH config file.

General Usage Pattern:
1. Import the setup function from this module.
   `from api_connection import authenticate_and_get_client`
   `from swagger_client.api import YourApiClass`
   `from swagger_client.rest import ApiException`

2. Call `authenticate_and_get_client()` to get an authenticated ApiClient.
   For interactive host selection: `api_client, token = authenticate_and_get_client(interactive_host_selection=True)`
   `api_client, token = authenticate_and_get_client()`
   
3. If the client is successfully created, proceed with your API calls.
   `if api_client:`
   `    api_instance = YourApiClass(api_client)`
   `    # ... make your calls`
"""
import sys
import os

# Add the generated_python_client directory to the python path for imports
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'generated_python_client')))


import swagger_client
from swagger_client.api.authentication_api import AuthenticationApi
from swagger_client.models.authentication_dto import AuthenticationDTO
from swagger_client.models.token_get_dto import TokenGetDTO
from swagger_client.rest import ApiException
from utils.get_host import get_api_host_url # Import the interactive host selector

# --- Configuration ---
# TODO: Replace these placeholder values with your actual API host and credentials.
# This is the default host. It can be overridden with interactive selection.
API_HOST = "http://20.4.226.32:28081/rest"
API_USER = "admin@opensilex.org"
API_PASSWORD = "admin"


def authenticate_and_get_client():
    """
    Authenticates with the API using credentials and returns a configured client.

    This function performs a two-step process:
    1. Creates a temporary client to call the authentication endpoint.
    2. If authentication is successful, it uses the received token to create
       a second, fully authenticated client for subsequent API calls.

    Returns:
        tuple: A tuple containing the authenticated `ApiClient` and the access 
               token, or `(None, None)` if authentication fails.
    """
    
    host_to_use = API_HOST
    selected_host = get_api_host_url(interactive_host_selection=True)
    if selected_host:
        host_to_use = selected_host


    # Step 1: Create a basic, unauthenticated client for the login request.
    unauthenticated_config = swagger_client.Configuration()
    unauthenticated_config.host = host_to_use
    unauthenticated_client = swagger_client.ApiClient(unauthenticated_config)

    auth_api = AuthenticationApi(unauthenticated_client)
    
    print(f"Attempting to authenticate user '{API_USER}' at host: {host_to_use}")

    try:
        # Step 2: Call the authenticate endpoint with user credentials.
        auth_dto = AuthenticationDTO(identifier=API_USER, password=API_PASSWORD)
        print(TokenGetDTO(identifier=API_USER, password=API_PASSWORD))
        print(auth_dto)
        # The authenticate method returns a TokenGetDTO
        token_dto = auth_api.authenticate(body=auth_dto)
        access_token = token_dto.token
        print("Successfully authenticated and received access token.")

        # Step 3: Create a new configuration with the received bearer token.
        authenticated_config = swagger_client.Configuration()
        authenticated_config.host = host_to_use
        authenticated_config.api_key['Authorization'] = access_token
        authenticated_config.api_key_prefix['Authorization'] = 'Bearer'

        # Step 4: Create and return the fully authenticated client.
        authenticated_client = swagger_client.ApiClient(authenticated_config)
        return authenticated_client, access_token

    except ApiException as e:
        print(f"Authentication failed: {e.reason} (Status: {e.status})")
        if "not found" in str(e.body).lower():
            print("Hint: The API host might be incorrect or the service isn't running.")
        print(f"Body: {e.body}")
        return None, None
    except Exception as e:
        print(f"An unexpected error occurred during authentication: {e}")
        return None, None

def main():
    """
    An example demonstrating how to use the authenticate_and_get_client function
    to connect to the API and make a simple call.
    
    This example runs in interactive mode.
    """
    print("--- Running API Connection Example ---")
    
    # 1. Get the authenticated API client using interactive host selection.
    #    Set to False to use the default API_HOST from the config section.
    api_client, _ = authenticate_and_get_client()
    print("API Client created successfully." if api_client else "Failed to create API Client.")
    print("\n--- Example Finished ---")


if __name__ == "__main__":
    main()

