# VariableGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**entity** | [**EntityGetDTO**](EntityGetDTO.md) |  | [optional] 
**entity_of_interest** | [**NamedResourceDTO**](NamedResourceDTO.md) |  | [optional] 
**characteristic** | [**CharacteristicGetDTO**](CharacteristicGetDTO.md) |  | [optional] 
**method** | [**MethodGetDTO**](MethodGetDTO.md) |  | [optional] 
**unit** | [**UnitGetDTO**](UnitGetDTO.md) |  | [optional] 
**on_local** | **bool** |  | [optional] 
**shared_resource_instance** | [**SharedResourceInstanceDTO**](SharedResourceInstanceDTO.md) |  | [optional] 
**alternative_name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.variable_get_dto import VariableGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of VariableGetDTO from a JSON string
variable_get_dto_instance = VariableGetDTO.from_json(json)
# print the JSON string representation of the object
print(VariableGetDTO.to_json())

# convert the object into a dict
variable_get_dto_dict = variable_get_dto_instance.to_dict()
# create an instance of VariableGetDTO from a dict
variable_get_dto_from_dict = VariableGetDTO.from_dict(variable_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


