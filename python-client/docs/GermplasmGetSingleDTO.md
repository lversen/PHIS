# GermplasmGetSingleDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**synonyms** | **List[str]** |  | [optional] 
**code** | **str** |  | [optional] 
**production_year** | **int** |  | [optional] 
**description** | **str** |  | [optional] 
**species** | **str** |  | [optional] 
**species_name** | **str** |  | [optional] 
**variety** | **str** |  | [optional] 
**variety_name** | **str** |  | [optional] 
**accession** | **str** |  | [optional] 
**accession_name** | **str** |  | [optional] 
**institute** | **str** |  | [optional] 
**website** | **str** |  | [optional] 
**has_parent_germplasm** | [**List[GermplasmGetAllDTO]**](GermplasmGetAllDTO.md) |  | [optional] 
**has_parent_germplasm_m** | [**List[GermplasmGetAllDTO]**](GermplasmGetAllDTO.md) |  | [optional] 
**has_parent_germplasm_f** | [**List[GermplasmGetAllDTO]**](GermplasmGetAllDTO.md) |  | [optional] 
**metadata** | **Dict[str, str]** |  | [optional] 

## Example

```python
from openapi_client.models.germplasm_get_single_dto import GermplasmGetSingleDTO

# TODO update the JSON string below
json = "{}"
# create an instance of GermplasmGetSingleDTO from a JSON string
germplasm_get_single_dto_instance = GermplasmGetSingleDTO.from_json(json)
# print the JSON string representation of the object
print(GermplasmGetSingleDTO.to_json())

# convert the object into a dict
germplasm_get_single_dto_dict = germplasm_get_single_dto_instance.to_dict()
# create an instance of GermplasmGetSingleDTO from a dict
germplasm_get_single_dto_from_dict = GermplasmGetSingleDTO.from_dict(germplasm_get_single_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


