import csv

# Define the headers for the CSV file
headers = [
    "variable_name",  # string (e.g., 'Plant height')
    "trait",          # string (e.g., 'Height')
    "method",         # string (e.g., 'Measurement with a ruler')
    "unit",           # string (e.g., 'centimeter')
    "datatype",       # string (e.g., 'Numeric')
    "entity",         # string (e.g., 'Plant')
    "characteristic"  # string (e.g., 'Height')
]

# Create a new CSV file and write the headers
with open("variables_template.csv", "w", newline="") as f:
    f.write("# This is a template file for importing variables. Please fill in the data below the headers.\n")
    f.write("# The first row contains the headers, and the following rows should contain the variable data.\n")
    f.write("# The datatypes for each column are specified in the script that generated this file.\n")
    writer = csv.writer(f)
    writer.writerow(headers)

print("Created variables_template.csv with the required headers and comments.")