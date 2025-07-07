# BrAPIv1TraitDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**alternative_abbreviations** | **List[str]** |  | [optional] 
**attribute** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**entity** | **str** |  | [optional] 
**main_abbreviation** | **str** |  | [optional] 
**ontology_reference** | [**BrAPIv1OntologyReferenceDTO**](BrAPIv1OntologyReferenceDTO.md) |  | [optional] 
**status** | **str** |  | [optional] 
**synonyms** | **List[str]** |  | [optional] 
**trait_db_id** | **str** |  | [optional] 
**trait_name** | **str** |  | [optional] 
**xref** | **str** |  | [optional] 
**var_class** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_trait_dto import BrAPIv1TraitDTO

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1TraitDTO from a JSON string
br_apiv1_trait_dto_instance = BrAPIv1TraitDTO.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1TraitDTO.to_json())

# convert the object into a dict
br_apiv1_trait_dto_dict = br_apiv1_trait_dto_instance.to_dict()
# create an instance of BrAPIv1TraitDTO from a dict
br_apiv1_trait_dto_from_dict = BrAPIv1TraitDTO.from_dict(br_apiv1_trait_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


