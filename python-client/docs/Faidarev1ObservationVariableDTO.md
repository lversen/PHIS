# Faidarev1ObservationVariableDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**context_of_use** | **List[str]** |  | [optional] 
**crop** | **str** |  | [optional] 
**default_value** | **str** |  | [optional] 
**documentation_url** | **str** |  | [optional] 
**growth_stage** | **str** |  | [optional] 
**institution** | **str** |  | [optional] 
**language** | **str** |  | [optional] 
**method** | [**Faidarev1MethodDTO**](Faidarev1MethodDTO.md) |  | [optional] 
**scale** | [**Faidarev1ScaleDTO**](Faidarev1ScaleDTO.md) |  | [optional] 
**scientist** | **str** |  | [optional] 
**status** | **str** |  | [optional] 
**synonyms** | **List[str]** |  | [optional] 
**trait** | [**Faidarev1TraitDTO**](Faidarev1TraitDTO.md) |  | [optional] 
**xref** | **str** |  | [optional] 
**observation_variable_db_id** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**var_date** | **str** |  | [optional] 
**ontology_db_id** | **str** |  | [optional] 
**ontology_name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.faidarev1_observation_variable_dto import Faidarev1ObservationVariableDTO

# TODO update the JSON string below
json = "{}"
# create an instance of Faidarev1ObservationVariableDTO from a JSON string
faidarev1_observation_variable_dto_instance = Faidarev1ObservationVariableDTO.from_json(json)
# print the JSON string representation of the object
print(Faidarev1ObservationVariableDTO.to_json())

# convert the object into a dict
faidarev1_observation_variable_dto_dict = faidarev1_observation_variable_dto_instance.to_dict()
# create an instance of Faidarev1ObservationVariableDTO from a dict
faidarev1_observation_variable_dto_from_dict = Faidarev1ObservationVariableDTO.from_dict(faidarev1_observation_variable_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


