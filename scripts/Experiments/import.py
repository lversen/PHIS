# --------------------------------------------------------------------------
# 1. Imports
# --------------------------------------------------------------------------
import argparse
import json
import os
import sys

# Add parent directory to path to allow imports from 'utils'
sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..'))

# Import shared utilities
from utils.api_connection import authenticate_and_get_client
import swagger_client
from swagger_client.rest import ApiException

# --------------------------------------------------------------------------
# 2. Helper Functions
# --------------------------------------------------------------------------
def read_data_from_file(file_path):
    """Reads and parses data from the input file."""
    try:
        with open(file_path, 'r') as f:
            # Assuming JSON file for this example
            return json.load(f)
    except (IOError, json.JSONDecodeError) as e:
        print(f"Error reading or parsing file {file_path}: {e}")
        return None

def format_data_for_api(record):
    """Transforms a single data record into the required API format."""
    # This is an example, you will need to adjust it to your needs
    # from swagger_client.models import ExperimentCreationDTO
    #
    # formatted_record = ExperimentCreationDTO(
    #     name=record.get("experiment_name"),
    #     start_date=record.get("start"),
    #     # ... other fields
    # )
    # return formatted_record
    return record # Placeholder

# --------------------------------------------------------------------------
# 3. Main Execution Logic
# --------------------------------------------------------------------------
def main():
    """Main function to orchestrate the import process."""
    # --- Argument Parsing ---
    parser = argparse.ArgumentParser(description="Import script for Experiments.")
    parser.add_argument("input_file", help="Path to the input data file (e.g., data.json).")
    parser.add_argument("--interactive-host", action="store_true", help="Enable interactive host selection from SSH config.")
    args = parser.parse_args()

    # --- API Connection ---
    api_client, token = authenticate_and_get_client(interactive_host_selection=args.interactive_host)
    if not api_client:
        return

    experiments_api = swagger_client.ExperimentsApi(api_client)

    # --- Data Processing ---
    data_to_import = read_data_from_file(args.input_file)
    if not data_to_import:
        return

    print(f"Found {len(data_to_import)} records to import.")

    # --- API Interaction ---
    for record in data_to_import:
        try:
            formatted_record = format_data_for_api(record)
            # --- Make the API call ---
            # api_response = experiments_api.create_experiment(body=formatted_record, authorization=token)
            # print(f"Successfully imported record: {api_response.uri}")
            print(f"Simulating import for record: {record.get('name')}") # Placeholder
        except ApiException as e:
            print(f"API Error importing record {record.get('name')}: {e.body}")
        except Exception as e:
            print(f"An unexpected error occurred for record {record.get('name')}: {e}")

    print("Import process finished.")

# --------------------------------------------------------------------------
# 4. Script Entry Point
# --------------------------------------------------------------------------
if __name__ == "__main__":
    main()
