#!/usr/bin/env python3
"""
PHIS Variable Creation Script
This script demonstrates how to create variables in PHIS/OpenSILEX
"""

import csv
import argparse
import os
import sys
import swagger_client
from swagger_client.rest import ApiException

def create_variables_from_csv(client: swagger_client.ApiClient, csv_file_path: str):
    """
    Create variables in PHIS from a CSV file
    
    CSV Format:
    variable_name,trait,method,unit,datatype,entity,characteristic
    """
    variables_api = swagger_client.VariablesApi(client)
    
    created_variables = []
    failed_variables = []
    
    with open(csv_file_path, 'r') as csvfile:
        reader = csv.DictReader(csvfile)
        
        for row in reader:
            try:
                # Create the variable using the API
                variable_data = swagger_client.VariableCreationDTO(
                    name=row['variable_name'],
                    entity=row['entity'],
                    characteristic=row['characteristic'],
                    method=row['method'],
                    unit=row['unit'],
                    datatype=row['datatype'],
                    trait=row.get('trait', None),  # Optional field
                    description=row.get('description', None),  # Optional field
                    alternative_name=row.get('alternative_name', None),  # Optional field
                )
                
                # Create the variable
                response = variables_api.create_variable(
                    authorization=client.configuration.api_key['Authorization'],
                    body=variable_data
                )
                
                created_variables.append({
                    'name': row['variable_name'],
                    'uri': response
                })
                print(f"✓ Created variable: {row['variable_name']} - URI: {response}")
                
            except ApiException as e:
                failed_variables.append({
                    'name': row['variable_name'],
                    'error': str(e)
                })
                print(f"✗ Failed to create variable: {row['variable_name']} - Error: {e}")
            except Exception as e:
                failed_variables.append({
                    'name': row['variable_name'],
                    'error': str(e)
                })
                print(f"✗ Unexpected error for variable: {row['variable_name']} - Error: {e}")
    
    return created_variables, failed_variables

def create_single_variable(client: swagger_client.ApiClient, variable_info: dict):
    """
    Create a single variable in PHIS
    
    Args:
        client: Authenticated API client
        variable_info: Dictionary containing variable information
    """
    variables_api = swagger_client.VariablesApi(client)
    
    try:
        # Create the variable DTO
        variable_data = swagger_client.VariableCreationDTO(
            name=variable_info['name'],
            entity=variable_info['entity'],
            characteristic=variable_info['characteristic'],
            method=variable_info['method'],
            unit=variable_info['unit'],
            datatype=variable_info['datatype'],
            trait=variable_info.get('trait'),
            trait_name=variable_info.get('trait_name'),
            description=variable_info.get('description'),
            alternative_name=variable_info.get('alternative_name'),
            entity_of_interest=variable_info.get('entity_of_interest'),
            species=variable_info.get('species', []),
            time_interval=variable_info.get('time_interval'),
            sampling_interval=variable_info.get('sampling_interval'),
            exact_match=variable_info.get('exact_match', []),
            close_match=variable_info.get('close_match', []),
            broad_match=variable_info.get('broad_match', []),
            narrow_match=variable_info.get('narrow_match', [])
        )
        
        # Create the variable
        response = variables_api.create_variable(
            authorization=client.configuration.api_key['Authorization'],
            body=variable_data
        )
        
        print(f"✓ Successfully created variable: {variable_info['name']}")
        print(f"  URI: {response}")
        return response
        
    except ApiException as e:
        print(f"✗ Failed to create variable: {variable_info['name']}")
        print(f"  Error: {e}")
        raise

def list_existing_variables(client: swagger_client.ApiClient, name_pattern: str = None):
    """
    List existing variables in PHIS
    """
    variables_api = swagger_client.VariablesApi(client)
    
    try:
        # Search for variables
        response = variables_api.search_variables(
            authorization=client.configuration.api_key['Authorization'],
            name=name_pattern,
            page_size=100
        )
        
        print(f"\nFound {len(response.result)} variables:")
        for var in response.result:
            print(f"  - {var.name} ({var.uri})")
            print(f"    Entity: {var.entity.name}")
            print(f"    Characteristic: {var.characteristic.name}")
            print(f"    Method: {var.method.name}")
            print(f"    Unit: {var.unit.name}")
            print(f"    Datatype: {var.datatype}")
            print()
            
    except ApiException as e:
        print(f"Failed to list variables: {e}")

def generate_csv_template(output_file: str):
    """
    Generate a CSV template for variable import
    """
    headers = [
        'variable_name', 'entity', 'characteristic', 'method', 'unit', 
        'datatype', 'trait', 'trait_name', 'description', 'alternative_name',
        'entity_of_interest', 'species', 'time_interval', 'sampling_interval'
    ]
    
    example_rows = [
        {
            'variable_name': 'Leaf_Area_Index',
            'entity': 'http://www.opensilex.org/vocabulary/oeso#Plant',
            'characteristic': 'http://www.opensilex.org/vocabulary/oeso#Area',
            'method': 'http://www.opensilex.org/vocabulary/oeso#ImageAnalysis',
            'unit': 'http://www.opensilex.org/vocabulary/oeso#SquareMeter',
            'datatype': 'xsd:decimal',
            'trait': 'http://www.opensilex.org/vocabulary/oeso#LeafArea',
            'trait_name': 'Leaf Area',
            'description': 'Leaf area index measured by image analysis',
            'alternative_name': 'LAI',
            'entity_of_interest': '',
            'species': '',
            'time_interval': '',
            'sampling_interval': ''
        },
        {
            'variable_name': 'Plant_Height_Manual',
            'entity': 'http://www.opensilex.org/vocabulary/oeso#Plant',
            'characteristic': 'http://www.opensilex.org/vocabulary/oeso#Height',
            'method': 'http://www.opensilex.org/vocabulary/oeso#ManualMeasurement',
            'unit': 'http://www.opensilex.org/vocabulary/oeso#Centimeter',
            'datatype': 'xsd:decimal',
            'trait': 'http://www.opensilex.org/vocabulary/oeso#PlantHeight',
            'trait_name': 'Plant Height',
            'description': 'Plant height measured manually with ruler',
            'alternative_name': '',
            'entity_of_interest': '',
            'species': '',
            'time_interval': '',
            'sampling_interval': ''
        }
    ]
    
    with open(output_file, 'w', newline='') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=headers)
        writer.writeheader()
        writer.writerows(example_rows)
    
    print(f"✓ Created template file: {output_file}")
    print("  Edit this file to add your variables, then import using --import-csv")

def main():
    parser = argparse.ArgumentParser(
        description="Create and manage variables in PHIS/OpenSILEX",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Generate a CSV template
  python create_variables.py --generate-template variables.csv
  
  # Import variables from CSV
  python create_variables.py --import-csv variables.csv
  
  # List existing variables
  python create_variables.py --list
  
  # Create a single variable
  python create_variables.py --create \\
    --name "Soil_pH" \\
    --entity "http://www.opensilex.org/vocabulary/oeso#Soil" \\
    --characteristic "http://www.opensilex.org/vocabulary/oeso#pH" \\
    --method "http://www.opensilex.org/vocabulary/oeso#pHMeter" \\
    --unit "http://www.opensilex.org/vocabulary/oeso#Unitless" \\
    --datatype "xsd:decimal"
        """
    )
    
    # Authentication arguments
    parser.add_argument('--host', default='http://localhost:28081/phis',
                       help='PHIS host URL (default: http://localhost:28081/phis)')
    parser.add_argument('--username', default='admin@opensilex.org',
                       help='Username for authentication')
    parser.add_argument('--password', default='admin',
                       help='Password for authentication')
    
    # Action arguments
    parser.add_argument('--generate-template', metavar='FILE',
                       help='Generate a CSV template file')
    parser.add_argument('--import-csv', metavar='FILE',
                       help='Import variables from CSV file')
    parser.add_argument('--list', action='store_true',
                       help='List existing variables')
    parser.add_argument('--list-filter', metavar='PATTERN',
                       help='Filter pattern for listing variables')
    
    # Single variable creation arguments
    parser.add_argument('--create', action='store_true',
                       help='Create a single variable')
    parser.add_argument('--name', help='Variable name')
    parser.add_argument('--entity', help='Entity URI')
    parser.add_argument('--characteristic', help='Characteristic URI')
    parser.add_argument('--method', help='Method URI')
    parser.add_argument('--unit', help='Unit URI')
    parser.add_argument('--datatype', help='Data type (e.g., xsd:decimal, xsd:string)')
    parser.add_argument('--trait', help='Trait URI (optional)')
    parser.add_argument('--description', help='Variable description (optional)')
    
    args = parser.parse_args()
    
    # Validate arguments
    if not any([args.generate_template, args.import_csv, args.list, args.create]):
        parser.error('Please specify an action: --generate-template, --import-csv, --list, or --create')
    
    if args.create:
        required = ['name', 'entity', 'characteristic', 'method', 'unit', 'datatype']
        missing = [arg for arg in required if not getattr(args, arg)]
        if missing:
            parser.error(f"--create requires: {', '.join('--' + arg for arg in missing)}")
    
    # Generate template if requested
    if args.generate_template:
        generate_csv_template(args.generate_template)
        return
    
    # Setup API client
    configuration = swagger_client.Configuration()
    configuration.host = args.host + '/rest'
    client = swagger_client.ApiClient(configuration)
    
    # Authenticate
    auth_api = swagger_client.AuthenticationApi(client)
    try:
        auth_response = auth_api.authenticate(args.username, args.password)
        client.configuration.api_key['Authorization'] = auth_response.result.token
        client.configuration.api_key_prefix['Authorization'] = 'Bearer'
        print("✓ Authentication successful")
    except ApiException as e:
        print(f"✗ Authentication failed: {e}")
        return 1
    
    # Execute requested action
    if args.list:
        list_existing_variables(client, args.list_filter)
    
    elif args.import_csv:
        if not os.path.exists(args.import_csv):
            print(f"✗ File not found: {args.import_csv}")
            return 1
        
        created, failed = create_variables_from_csv(client, args.import_csv)
        
        print(f"\n=== Import Summary ===")
        print(f"✓ Successfully created: {len(created)} variables")
        print(f"✗ Failed: {len(failed)} variables")
        
        if failed:
            print("\nFailed variables:")
            for var in failed:
                print(f"  - {var['name']}: {var['error']}")
    
    elif args.create:
        variable_info = {
            'name': args.name,
            'entity': args.entity,
            'characteristic': args.characteristic,
            'method': args.method,
            'unit': args.unit,
            'datatype': args.datatype,
            'trait': args.trait,
            'description': args.description
        }
        create_single_variable(client, variable_info)

if __name__ == "__main__":
    sys.exit(main() or 0)