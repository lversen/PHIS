"""
This script demonstrates how to get the list of existing credentials groups.
"""
import sys
import os

# Add the project root to the python path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..')))

import swagger_client
from authenticate import authenticate_and_get_client

def main():
    """
    Main function to get credentials groups.
    """
    api_client, _ = authenticate_and_get_client()

    if not api_client:
        print("Authentication failed, cannot get credentials groups.")
        return

    auth_api = swagger_client.AuthenticationApi(api_client)

    try:
        credentials_groups = auth_api.get_credentials_groups()
        print("Successfully retrieved credentials groups:")
        for group in credentials_groups:
            print(group)
    except swagger_client.rest.ApiException as e:
        print(f"Exception when calling AuthenticationApi->get_credentials_groups: {e}")

if __name__ == "__main__":
    main()
