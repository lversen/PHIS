# CSVDatatypeError


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**row_index** | **int** |  | [optional] 
**col_index** | **int** |  | [optional] 
**header** | **str** |  | [optional] 
**value** | **str** |  | [optional] 
**datatype** | **str** |  | [optional] 
**message** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.csv_datatype_error import CSVDatatypeError

# TODO update the JSON string below
json = "{}"
# create an instance of CSVDatatypeError from a JSON string
csv_datatype_error_instance = CSVDatatypeError.from_json(json)
# print the JSON string representation of the object
print(CSVDatatypeError.to_json())

# convert the object into a dict
csv_datatype_error_dict = csv_datatype_error_instance.to_dict()
# create an instance of CSVDatatypeError from a dict
csv_datatype_error_from_dict = CSVDatatypeError.from_dict(csv_datatype_error_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


