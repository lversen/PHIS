# BrAPIv1ObservationVariableDTO


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
**method** | [**BrAPIv1MethodDTO**](BrAPIv1MethodDTO.md) |  | [optional] 
**ontology_reference** | [**BrAPIv1OntologyReferenceDTO**](BrAPIv1OntologyReferenceDTO.md) |  | [optional] 
**scale** | [**BrAPIv1ScaleDTO**](BrAPIv1ScaleDTO.md) |  | [optional] 
**scientist** | **str** |  | [optional] 
**status** | **str** |  | [optional] 
**submission_timestamp** | **str** |  | [optional] 
**synonyms** | **List[str]** |  | [optional] 
**trait** | [**BrAPIv1TraitDTO**](BrAPIv1TraitDTO.md) |  | [optional] 
**xref** | **str** |  | [optional] 
**observation_variable_db_id** | **str** |  | [optional] 
**observation_variable_name** | **str** |  | [optional] 
**study_db_id** | **str** |  | [optional] 
**trial_name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_observation_variable_dto import BrAPIv1ObservationVariableDTO

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1ObservationVariableDTO from a JSON string
br_apiv1_observation_variable_dto_instance = BrAPIv1ObservationVariableDTO.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1ObservationVariableDTO.to_json())

# convert the object into a dict
br_apiv1_observation_variable_dto_dict = br_apiv1_observation_variable_dto_instance.to_dict()
# create an instance of BrAPIv1ObservationVariableDTO from a dict
br_apiv1_observation_variable_dto_from_dict = BrAPIv1ObservationVariableDTO.from_dict(br_apiv1_observation_variable_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


