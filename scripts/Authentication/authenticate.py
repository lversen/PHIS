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

# Add the project root to the python path for imports
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..')))


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


def get_unauthenticated_client(host=None):
    """
    Creates and returns a basic, unauthenticated API client.

    This client is configured with the API host but does not include any
    authentication credentials. It is suitable for calling public endpoints
    or endpoints that do not require a user to be logged in, such as
    `forgot_password`.

    Args:
        host (str, optional): The API host URL. If not provided, it will
                              use the default from this module or prompt
                              for interactive selection.

    Returns:
        swagger_client.ApiClient: An unauthenticated API client, or None if
                                  the host cannot be determined.
    """
    host_to_use = host if host else get_api_host_url(interactive_host_selection=True)
    if not host_to_use:
        print("API host not specified and could not be determined.")
        return None

    config = swagger_client.Configuration()
    config.host = host_to_use
    return swagger_client.ApiClient(config)

def authenticate_and_get_client(host=None, username=None, password=None):
    """
    Authenticates with the API and returns a fully configured client.

    This function handles the entire authentication flow, including fetching
    an access token and configuring the client with it. It can use provided
    credentials or fall back to default values.

    Args:
        host (str, optional): The API host URL. Defaults to `API_HOST`.
        username (str, optional): The user's email or identifier. Defaults to `API_USER`.
        password (str, optional): The user's password. Defaults to `API_PASSWORD`.

    Returns:
        tuple: A tuple of (authenticated_client, access_token), or (None, None)
               if authentication fails.
    """
    user_to_use = username or API_USER
    password_to_use = password or API_PASSWORD

    # Get a basic client to make the authentication call
    unauthenticated_client = get_unauthenticated_client(host=host)
    if not unauthenticated_client:
        return None, None

    host_used = unauthenticated_client.configuration.host
    auth_api = AuthenticationApi(unauthenticated_client)
    
    print(f"Attempting to authenticate user '{API_USER}' at host: {host_used}")

    try:
        # Step 2: Call the authenticate endpoint with user credentials.
        auth_dto = AuthenticationDTO(identifier=API_USER, password=API_PASSWORD)
        # The authenticate method returns a TokenGetDTO
        token_dto = auth_api.authenticate(body=auth_dto)
        access_token = token_dto.token
        print(access_token)
        print("Successfully authenticated and received access token.")

        # Step 3: Create a new configuration with the received bearer token.
        authenticated_config = swagger_client.Configuration()
        authenticated_config.host = host_used
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

if __name__ == "__main__":
    # Example usage of the authenticate_and_get_client function
    client, token = authenticate_and_get_client()
    if client:
        print("Authenticated client created successfully.")
    else:
        print("Failed to create authenticated client.")