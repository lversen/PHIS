# MethodCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | 
**description** | **str** |  | [optional] 
**exact_match** | **List[str]** |  | [optional] 
**close_match** | **List[str]** |  | [optional] 
**broad_match** | **List[str]** |  | [optional] 
**narrow_match** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.method_creation_dto import MethodCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of MethodCreationDTO from a JSON string
method_creation_dto_instance = MethodCreationDTO.from_json(json)
# print the JSON string representation of the object
print(MethodCreationDTO.to_json())

# convert the object into a dict
method_creation_dto_dict = method_creation_dto_instance.to_dict()
# create an instance of MethodCreationDTO from a dict
method_creation_dto_from_dict = MethodCreationDTO.from_dict(method_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


