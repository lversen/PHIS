# VariableCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | 
**alternative_name** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**entity** | **str** |  | 
**entity_of_interest** | **str** |  | [optional] 
**characteristic** | **str** |  | 
**trait** | **str** |  | [optional] 
**trait_name** | **str** |  | [optional] 
**method** | **str** |  | 
**unit** | **str** |  | 
**species** | **List[str]** |  | [optional] 
**datatype** | **str** |  | 
**time_interval** | **str** |  | [optional] 
**sampling_interval** | **str** |  | [optional] 
**exact_match** | **List[str]** |  | [optional] 
**close_match** | **List[str]** |  | [optional] 
**broad_match** | **List[str]** |  | [optional] 
**narrow_match** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.variable_creation_dto import VariableCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of VariableCreationDTO from a JSON string
variable_creation_dto_instance = VariableCreationDTO.from_json(json)
# print the JSON string representation of the object
print(VariableCreationDTO.to_json())

# convert the object into a dict
variable_creation_dto_dict = variable_creation_dto_instance.to_dict()
# create an instance of VariableCreationDTO from a dict
variable_creation_dto_from_dict = VariableCreationDTO.from_dict(variable_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


