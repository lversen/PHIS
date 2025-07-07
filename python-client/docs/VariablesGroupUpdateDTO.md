# VariablesGroupUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | 
**name** | **str** |  | 
**description** | **str** |  | [optional] 
**variables** | **List[str]** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.variables_group_update_dto import VariablesGroupUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of VariablesGroupUpdateDTO from a JSON string
variables_group_update_dto_instance = VariablesGroupUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(VariablesGroupUpdateDTO.to_json())

# convert the object into a dict
variables_group_update_dto_dict = variables_group_update_dto_instance.to_dict()
# create an instance of VariablesGroupUpdateDTO from a dict
variables_group_update_dto_from_dict = VariablesGroupUpdateDTO.from_dict(variables_group_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


