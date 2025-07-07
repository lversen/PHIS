# VariableUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | 
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
from openapi_client.models.variable_update_dto import VariableUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of VariableUpdateDTO from a JSON string
variable_update_dto_instance = VariableUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(VariableUpdateDTO.to_json())

# convert the object into a dict
variable_update_dto_dict = variable_update_dto_instance.to_dict()
# create an instance of VariableUpdateDTO from a dict
variable_update_dto_from_dict = VariableUpdateDTO.from_dict(variable_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


