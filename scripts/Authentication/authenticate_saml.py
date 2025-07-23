'''
This script demonstrates how to authenticate using SAML.

Since SAML requires browser-based authentication, this script will
print a URL for the user to open in their browser. After the user
authenticates, the SAML response will be sent to the redirect URI,
and the server will handle the authentication.
'''
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..')))
import swagger_client
from authenticate import authenticate_and_get_client

def main():
    """
    Main function to demonstrate SAML authentication.
    """
    api_client, _ = authenticate_and_get_client()

    if not api_client:
        print("Could not create an API client.")
        return

    # The base URL for SAML authentication.
    # This will likely need to be adjusted for your specific SAML identity provider.
    saml_url = f"{api_client.configuration.host}/security/saml"

    print("Please open the following URL in your browser to authenticate with SAML:")
    print(saml_url)
    print("\nAfter successful authentication, you should be logged in.")

if __name__ == "__main__":
    main()
