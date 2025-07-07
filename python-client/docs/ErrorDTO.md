# ErrorDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**title** | **str** | Title of the error | [optional] 
**message** | **str** | Message of the error | [optional] 

## Example

```python
from openapi_client.models.error_dto import ErrorDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ErrorDTO from a JSON string
error_dto_instance = ErrorDTO.from_json(json)
# print the JSON string representation of the object
print(ErrorDTO.to_json())

# convert the object into a dict
error_dto_dict = error_dto_instance.to_dict()
# create an instance of ErrorDTO from a dict
error_dto_from_dict = ErrorDTO.from_dict(error_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


