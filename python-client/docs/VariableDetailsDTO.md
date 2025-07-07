# VariableDetailsDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**alternative_name** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**entity** | [**EntityGetDTO**](EntityGetDTO.md) |  | [optional] 
**entity_of_interest** | [**InterestEntityGetDTO**](InterestEntityGetDTO.md) |  | [optional] 
**characteristic** | [**CharacteristicGetDTO**](CharacteristicGetDTO.md) |  | [optional] 
**trait** | **str** |  | [optional] 
**trait_name** | **str** |  | [optional] 
**method** | [**MethodGetDTO**](MethodGetDTO.md) |  | [optional] 
**unit** | [**UnitDetailsDTO**](UnitDetailsDTO.md) |  | [optional] 
**species** | [**List[SpeciesDTO]**](SpeciesDTO.md) |  | [optional] 
**time_interval** | **str** |  | [optional] 
**sampling_interval** | **str** |  | [optional] 
**datatype** | **str** |  | [optional] 
**exact_match** | **List[str]** |  | [optional] 
**close_match** | **List[str]** |  | [optional] 
**broad_match** | **List[str]** |  | [optional] 
**narrow_match** | **List[str]** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**from_shared_resource_instance** | [**SharedResourceInstanceDTO**](SharedResourceInstanceDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.variable_details_dto import VariableDetailsDTO

# TODO update the JSON string below
json = "{}"
# create an instance of VariableDetailsDTO from a JSON string
variable_details_dto_instance = VariableDetailsDTO.from_json(json)
# print the JSON string representation of the object
print(VariableDetailsDTO.to_json())

# convert the object into a dict
variable_details_dto_dict = variable_details_dto_instance.to_dict()
# create an instance of VariableDetailsDTO from a dict
variable_details_dto_from_dict = VariableDetailsDTO.from_dict(variable_details_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


