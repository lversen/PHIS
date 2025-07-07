# VariablesGroupCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | 
**description** | **str** |  | [optional] 
**variables** | **List[str]** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.variables_group_creation_dto import VariablesGroupCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of VariablesGroupCreationDTO from a JSON string
variables_group_creation_dto_instance = VariablesGroupCreationDTO.from_json(json)
# print the JSON string representation of the object
print(VariablesGroupCreationDTO.to_json())

# convert the object into a dict
variables_group_creation_dto_dict = variables_group_creation_dto_instance.to_dict()
# create an instance of VariablesGroupCreationDTO from a dict
variables_group_creation_dto_from_dict = VariablesGroupCreationDTO.from_dict(variables_group_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


