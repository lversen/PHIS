"""
This script demonstrates how to use the forgot password functionality.
"""
import sys
import os
import swagger_client

# Add the project root to the python path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..')))
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'utils')))

from utils.api_connection import authenticate_and_get_client

def main():
    """
    Main function to demonstrate forgot password.
    """
    # We don't need to be authenticated for this, but we need a client.
    unauthenticated_config = swagger_client.Configuration()
    unauthenticated_config.host = "http://20.4.226.32:28081/rest"
    unauthenticated_client = swagger_client.ApiClient(unauthenticated_config)
    
    auth_api = swagger_client.AuthenticationApi(unauthenticated_client)

    identifier = "admin@opensilex.org" # The user to send a password reset to

    try:
        auth_api.forgot_password(identifier)
        print(f"Password reset email sent to {identifier}")
    except swagger_client.rest.ApiException as e:
        print(f"Exception when calling AuthenticationApi->forgot_password: {e}")

if __name__ == "__main__":
    main()
