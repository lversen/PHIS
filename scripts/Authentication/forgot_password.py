"""
This script demonstrates how to use the forgot password functionality.
"""
import sys
import os

# Add the project root to the python path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..')))

import swagger_client
from authenticate import get_unauthenticated_client

def main():
    """
    Main function to demonstrate forgot password.
    """
    # We don't need to be authenticated for this, so we get an unauthenticated client.
    api_client = get_unauthenticated_client()

    if not api_client:
        print("Could not create an API client.")
        return

    auth_api = swagger_client.AuthenticationApi(api_client)

    identifier = "seb@test.no" # The user to send a password reset to

    try:
        auth_api.forgot_password(identifier)
        print(f"Password reset email sent to {identifier}")
    except swagger_client.rest.ApiException as e:
        print(f"Exception when calling AuthenticationApi->forgot_password: {e}")

if __name__ == "__main__":
    main()
