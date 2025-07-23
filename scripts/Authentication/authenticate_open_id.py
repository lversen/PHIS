'''
This script demonstrates how to authenticate using OpenID.

Since OpenID requires browser-based authentication, this script will
print a URL for the user to open in their browser. After the user
authenticates, they will be redirected to a URL containing a code.
This code can then be used to get an access token.
'''

import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..')))
import swagger_client
from authenticate import authenticate_and_get_client

def main():
    """
    Main function to demonstrate OpenID authentication.
    """
    api_client, _ = authenticate_and_get_client()

    if not api_client:
        print("Could not create an API client.")
        return

    # The base URL for OpenID authentication.
    # This will likely need to be adjusted for your specific OpenID provider.
    openid_url = f"{api_client.configuration.host}/security/openid"

    print("Please open the following URL in your browser to authenticate:")
    print(openid_url)
    print("\nAfter authenticating, you will be redirected to a URL with a 'code' parameter.")
    print("Please paste that code here:")

    code = input("Code: ")

    auth_api = swagger_client.AuthenticationApi(api_client)

    try:
        token_dto = auth_api.authenticate_open_id(code=code)
        print(f"Successfully authenticated with OpenID. Your token is: {token_dto.token}")
    except swagger_client.rest.ApiException as e:
        print(f"Exception when calling AuthenticationApi->authenticate_open_id: {e}")

if __name__ == "__main__":
    main()
