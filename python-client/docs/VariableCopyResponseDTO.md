# VariableCopyResponseDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**variable_uris** | **List[str]** |  | [optional] 
**entity_uris** | **List[str]** |  | [optional] 
**characteristic_uris** | **List[str]** |  | [optional] 
**method_uris** | **List[str]** |  | [optional] 
**unit_uris** | **List[str]** |  | [optional] 
**interest_entity_uris** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.variable_copy_response_dto import VariableCopyResponseDTO

# TODO update the JSON string below
json = "{}"
# create an instance of VariableCopyResponseDTO from a JSON string
variable_copy_response_dto_instance = VariableCopyResponseDTO.from_json(json)
# print the JSON string representation of the object
print(VariableCopyResponseDTO.to_json())

# convert the object into a dict
variable_copy_response_dto_dict = variable_copy_response_dto_instance.to_dict()
# create an instance of VariableCopyResponseDTO from a dict
variable_copy_response_dto_from_dict = VariableCopyResponseDTO.from_dict(variable_copy_response_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


