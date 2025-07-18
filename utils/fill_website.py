"""
Fill Website with Mock Data
"""

import os
import sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
import swagger_client
from swagger_client.rest import ApiException
from scripts.Authentication.authenticate import authenticate_and_get_client
from mock import MockClient

def main():
    """
    Main function to fill the website with mock data.
    """
    api_client, access_token = authenticate_and_get_client()

    if not api_client:
        print("Authentication failed. Exiting.")
        return

    mock_client = MockClient()

    # Create API instances
    organizations_api = swagger_client.OrganizationsApi(api_client)
    projects_api = swagger_client.ProjectsApi(api_client)
    experiments_api = swagger_client.ExperimentsApi(api_client)
    scientific_objects_api = swagger_client.ScientificObjectsApi(api_client)
    devices_api = swagger_client.DevicesApi(api_client)

    # The token needs to include the 'Bearer ' prefix for the API calls
    auth_token_with_prefix = f"Bearer {access_token}"

    # Create organizations
    print("\nCreating mock organizations...")
    mock_organizations = mock_client.create_mock_organizations(3)
    for org_data in mock_organizations:
        try:
            organizations_api.create_organization(authorization=auth_token_with_prefix, body=org_data)
            print(f"  - Created organization: {org_data.name}")
        except ApiException as e:
            print(f"  - Failed to create organization: {org_data.name} ({e.body})")

    # Create projects, experiments, and scientific objects
    print("\nCreating mock projects, experiments, and scientific objects...")
    mock_projects = mock_client.create_mock_projects(2)
    for project_data in mock_projects:
        try:
            project_response = projects_api.create_project(authorization=auth_token_with_prefix, body=project_data)
            project_uri = project_response.result[0]
            print(f"\n- Created project: {project_data.name}")

            # Create experiments for the project
            mock_experiments = mock_client.create_mock_experiments(2, project_uri)
            for exp_data in mock_experiments:
                try:
                    exp_response = experiments_api.create_experiment(authorization=auth_token_with_prefix, body=exp_data)
                    exp_uri = exp_response.result[0]
                    print(f"  - Created experiment: {exp_data.name}")

                    # Create scientific objects for the experiment
                    mock_objects = mock_client.create_mock_scientific_objects(5, exp_uri)
                    for obj_data in mock_objects:
                        try:
                            scientific_objects_api.create_scientific_object(authorization=auth_token_with_prefix, body=obj_data)
                            print(f"    - Created scientific object: {obj_data.name}")
                        except ApiException as e:
                            print(f"    - Failed to create scientific object: {obj_data.name} ({e.body})")
                except ApiException as e:
                    print(f"  - Failed to create experiment: {exp_data.name} ({e.body})")
        except ApiException as e:
            print(f"\n- Failed to create project: {project_data.name} ({e.body})")

    # Create devices
    print("\nCreating mock devices...")
    mock_devices = mock_client.create_mock_devices(4)
    for device_data in mock_devices:
        try:
            devices_api.create_device(authorization=auth_token_with_prefix, body=device_data)
            print(f"  - Created device: {device_data.name}")
        except ApiException as e:
            print(f"  - Failed to create device: {device_data.name} ({e.body})")

    print("\nDone.")

if __name__ == "__main__":
    main()