# VariablesGroupGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**name** | **str** |  | 
**description** | **str** |  | [optional] 
**variables** | [**List[NamedResourceDTOVariableModel]**](NamedResourceDTOVariableModel.md) |  | [optional] 

## Example

```python
from openapi_client.models.variables_group_get_dto import VariablesGroupGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of VariablesGroupGetDTO from a JSON string
variables_group_get_dto_instance = VariablesGroupGetDTO.from_json(json)
# print the JSON string representation of the object
print(VariablesGroupGetDTO.to_json())

# convert the object into a dict
variables_group_get_dto_dict = variables_group_get_dto_instance.to_dict()
# create an instance of VariablesGroupGetDTO from a dict
variables_group_get_dto_from_dict = VariablesGroupGetDTO.from_dict(variables_group_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


