# CSVDuplicateURIError


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**row_index** | **int** |  | [optional] 
**col_index** | **int** |  | [optional] 
**header** | **str** |  | [optional] 
**value** | **str** |  | [optional] 
**previous_row** | **int** |  | [optional] 
**message** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.csv_duplicate_uri_error import CSVDuplicateURIError

# TODO update the JSON string below
json = "{}"
# create an instance of CSVDuplicateURIError from a JSON string
csv_duplicate_uri_error_instance = CSVDuplicateURIError.from_json(json)
# print the JSON string representation of the object
print(CSVDuplicateURIError.to_json())

# convert the object into a dict
csv_duplicate_uri_error_dict = csv_duplicate_uri_error_instance.to_dict()
# create an instance of CSVDuplicateURIError from a dict
csv_duplicate_uri_error_from_dict = CSVDuplicateURIError.from_dict(csv_duplicate_uri_error_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


