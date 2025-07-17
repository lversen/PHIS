"""
This script demonstrates how to authenticate a user and get an access token.
"""
import sys
import os

# Add the project root to the python path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..')))
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'utils')))

from utils.api_connection import authenticate_and_get_client

def main():
    """
    Main function to authenticate and print the token.
    """
    api_client, access_token = authenticate_and_get_client()
    if api_client and access_token:
        print(f"Authentication successful!")
        print(f"Access Token: {access_token}")
    else:
        print("Authentication failed.")

if __name__ == "__main__":
    main()
