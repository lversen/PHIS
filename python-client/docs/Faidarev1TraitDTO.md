# Faidarev1TraitDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**trait_db_id** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**synonyms** | **List[str]** |  | [optional] 
**main_abbreviation** | **str** |  | [optional] 
**alternative_abbreviations** | **List[str]** |  | [optional] 
**entity** | **str** |  | [optional] 
**attribute** | **str** |  | [optional] 
**status** | **str** |  | [optional] 
**xref** | **str** |  | [optional] 
**var_class** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.faidarev1_trait_dto import Faidarev1TraitDTO

# TODO update the JSON string below
json = "{}"
# create an instance of Faidarev1TraitDTO from a JSON string
faidarev1_trait_dto_instance = Faidarev1TraitDTO.from_json(json)
# print the JSON string representation of the object
print(Faidarev1TraitDTO.to_json())

# convert the object into a dict
faidarev1_trait_dto_dict = faidarev1_trait_dto_instance.to_dict()
# create an instance of Faidarev1TraitDTO from a dict
faidarev1_trait_dto_from_dict = Faidarev1TraitDTO.from_dict(faidarev1_trait_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


