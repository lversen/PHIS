import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..')))
import swagger_client
from swagger_client.rest import ApiException
import argparse
import json
from scripts.Authentication import authenticate

# Parse command-line arguments
parser = argparse.ArgumentParser(
    description="""Import variables from a CSV file.

    The CSV file should have the following columns:
    - variable_name (string)
    - trait (string)
    - method (string)
    - unit (string)
    - datatype (string)
    - entity (string)
    - characteristic (string)
    """,
    formatter_class=argparse.RawTextHelpFormatter
)
parser.add_argument("file_path", help="Path to the CSV file")
parser.add_argument("--host", default="http://localhost/rest", help="Host of the PHIS API")
parser.add_argument("--user", default="admin@opensilex.org", help="Authentication user")
parser.add_argument("--password", default="admin", help="Authentication password")
args = parser.parse_args()

# Authenticate and get the API client
api_client, token = authenticate.authenticate_and_get_client(host=args.host, username=args.user, password=args.password)

if not api_client:
    print("Authentication failed. Please check your credentials and the API host.")
    exit(1)

# Create an instance of the VariablesApi
variables_api = swagger_client.api.VariablesApi(api_client)

# Import the variables
try:
    api_response = variables_api.import_variables_in_bulk_file(file=args.file_path)
    print("Variables imported successfully:")
    print(json.dumps(api_response, indent=2))
except ApiException as e:
    print(f"Error importing variables: {e}")