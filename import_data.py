
import csv
import argparse
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), './generated-python-client')))
import swagger_client
from swagger_client.rest import ApiException

def import_csv_data(client: swagger_client.ApiClient, file_path: str):
    # Create API instances
    data_api = swagger_client.DataApi(client)
    variables_api = swagger_client.VariablesApi(client)
    scientific_objects_api = swagger_client.ScientificObjectsApi(client)

    try:
        # Fetch a valid scientific object URI
        scientific_objects_response = scientific_objects_api.search_scientific_objects(page_size=1)
        if not scientific_objects_response or not scientific_objects_response.result:
            print("Could not fetch a scientific object.")
            return
        valid_target_uri = scientific_objects_response.result[0].uri
        print(f"Using scientific object URI: {valid_target_uri}")

        # Search for an existing "Leaf Width Manual"
        mock_variable_name = "Leaf Width Manual"
        search_mock_var_response = variables_api.search_variables(name=mock_variable_name)
        valid_variable_uri = None
        if search_mock_var_response and search_mock_var_response.result:
            for var in search_mock_var_response.result:
                if var.name == mock_variable_name:
                    valid_variable_uri = var.uri
                    print(f"Found existing mock variable: {valid_variable_uri}")
                    break
        
        if not valid_variable_uri:
            print("Could not obtain a valid variable URI.")
            return
        
        print(f"Using variable URI: {valid_variable_uri}")

        # Create a default provenance
        provenance_data = swagger_client.ProvenanceCreationDTO(
            uri="http://www.opensilex.org/id/provenance/importer",
            name="Data Importer",
            description="Provenance for data imported from a CSV file"
        )
        try:
            provenance_response = data_api.create_provenance(provenance_data)
            provenance_uri = provenance_response.result[0]
        except ApiException as e:
            if e.status == 409: # Conflict, already exists
                search_provenance_response = data_api.search_provenances(name="Data Importer")
                if search_provenance_response and search_provenance_response.result:
                    provenance_uri = search_provenance_response.result[0].uri
                else:
                    print(f"Failed to find provenance: {e}")
                    return
            else:
                print(f"Failed to create provenance: {e}")
                return

        data_points = []
        with open(file_path, 'r') as csvfile:
            reader = csv.reader(csvfile)
            for _ in range(3):
                next(reader)
            
            for row in reader:
                if not row:
                    continue
                
                try:
                    data_points.append(swagger_client.DataCreationDTO(
                        target=valid_target_uri,
                        variable=valid_variable_uri,
                        date=row[3],
                        value=float(row[4]),
                        provenance=provenance_uri
                    ))
                except (IndexError, ValueError) as e:
                    print(f"Error parsing row: {row} - {e}")
                    continue

        if not data_points:
            print("No data points to import.")
            return

        print(f"Attempting to import {len(data_points)} data points...")
        try:
            data_api.add_data_list(data_points)
            print("Data imported successfully!")
        except ApiException as e:
            if "DUPLICATE_DATA_KEY" in e.body:
                print("Data already exists, skipping import.")
            else:
                print(f"Data import failed: {e.body}")

    except ApiException as e:
        print(f"An API error occurred: {e.body}")

def main():
    parser = argparse.ArgumentParser(description="Import data from a CSV file into OpenSILEX.")
    parser.add_argument("file_path", help="The full path to the CSV file to import.")
    args = parser.parse_args()

    configuration.host = "http://localhost:8080"
    client = swagger_client.ApiClient(configuration)

    # Authenticate
    auth_api = swagger_client.AuthenticationApi(client)
    try:
        auth_response = auth_api.authenticate("admin@opensilex.org", "admin")
        client.configuration.api_key['Authorization'] = auth_response.result.token
        client.configuration.api_key_prefix['Authorization'] = 'Bearer'
        print("Authentication successful.")
    except ApiException as e:
        print(f"Authentication failed: {e.body}")
        return

    import_csv_data(client, args.file_path)

    # No explicit logout in swagger client, token will expire

if __name__ == "__main__":
    main()
