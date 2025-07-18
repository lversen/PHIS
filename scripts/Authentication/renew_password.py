"""
This script demonstrates how to renew a user's password using a renew token.
"""
import sys
import os

# Add the project root to the python path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..')))

import swagger_client
from authenticate import get_unauthenticated_client

def main():
    """
    Main function to demonstrate password renewal.
    """
    # We don't need to be authenticated for this, so we get an unauthenticated client.
    api_client = get_unauthenticated_client()

    if not api_client:
        print("Could not create an API client.")
        return

    auth_api = swagger_client.AuthenticationApi(api_client)

    # This token would typically be received by the user via email after
    # initiating the forgot password process.
    renew_token = "your_renew_token_here"  # Replace with a valid token
    new_password = "your_new_password_here"  # Replace with the new password

    try:
        # First, check if the token is valid.
        auth_api.renew_password(renew_token, check_only=True)
        print("Renew token is valid.")

        # If the token is valid, proceed to change the password.
        response = auth_api.renew_password(renew_token, password=new_password)
        print(f"Successfully changed password. New token: {response.token}")

    except swagger_client.rest.ApiException as e:
        print(f"Exception when calling AuthenticationApi->renew_password: {e}")

if __name__ == "__main__":
    main()
