# CSVURINotFoundError


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**row_index** | **int** |  | [optional] 
**col_index** | **int** |  | [optional] 
**header** | **str** |  | [optional] 
**value** | **str** |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**object_uri** | **str** |  | [optional] 
**message** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.csvuri_not_found_error import CSVURINotFoundError

# TODO update the JSON string below
json = "{}"
# create an instance of CSVURINotFoundError from a JSON string
csvuri_not_found_error_instance = CSVURINotFoundError.from_json(json)
# print the JSON string representation of the object
print(CSVURINotFoundError.to_json())

# convert the object into a dict
csvuri_not_found_error_dict = csvuri_not_found_error_instance.to_dict()
# create an instance of CSVURINotFoundError from a dict
csvuri_not_found_error_from_dict = CSVURINotFoundError.from_dict(csvuri_not_found_error_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


