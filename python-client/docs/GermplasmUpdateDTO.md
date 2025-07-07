# GermplasmUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Germplasm URI | 
**rdf_type** | **str** | Germplasm type | 
**name** | **str** | Germplasm name | 
**synonyms** | **List[str]** |  | [optional] 
**code** | **str** | Germplasm code (accessionNumber, varietyCode...) | [optional] 
**production_year** | **int** | production year | [optional] 
**description** | **str** | comment | [optional] 
**species** | **str** | species URI | [optional] 
**variety** | **str** | variety URI | [optional] 
**accession** | **str** | accession URI | [optional] 
**institute** | **str** | institute | [optional] 
**website** | **str** | website | [optional] 
**relations** | [**List[RDFObjectRelationDTO]**](RDFObjectRelationDTO.md) |  | [optional] 
**metadata** | **Dict[str, str]** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.germplasm_update_dto import GermplasmUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of GermplasmUpdateDTO from a JSON string
germplasm_update_dto_instance = GermplasmUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(GermplasmUpdateDTO.to_json())

# convert the object into a dict
germplasm_update_dto_dict = germplasm_update_dto_instance.to_dict()
# create an instance of GermplasmUpdateDTO from a dict
germplasm_update_dto_from_dict = GermplasmUpdateDTO.from_dict(germplasm_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


