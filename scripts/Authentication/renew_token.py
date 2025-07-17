"""
This script demonstrates how to renew an access token.
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
    Main function to renew an access token.
    """
    api_client, access_token = authenticate_and_get_client()

    if not (api_client and access_token):
        print("Authentication failed, cannot renew token.")
        return

    auth_api = swagger_client.AuthenticationApi(api_client)

    try:
        # The token is passed in the header, which is handled by the api_client
        new_token_dto = auth_api.renew_token(authorization=f"Bearer {access_token}")
        print(f"Successfully renewed token. New token: {new_token_dto.token}")
    except swagger_client.rest.ApiException as e:
        print(f"Exception when calling AuthenticationApi->renew_token: {e}")

if __name__ == "__main__":
    main()
