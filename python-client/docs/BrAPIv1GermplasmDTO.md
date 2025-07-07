# BrAPIv1GermplasmDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accession_number** | **str** |  | [optional] 
**acquisition_date** | **str** |  | [optional] 
**biological_status_of_accession_code** | **int** |  | [optional] 
**breeding_method_db_id** | **str** |  | [optional] 
**common_crop_name** | **str** |  | [optional] 
**country_of_origin_code** | **str** |  | [optional] 
**default_display_name** | **str** |  | [optional] 
**documentation_url** | **str** |  | [optional] 
**donors** | **List[object]** |  | [optional] 
**germplasm_db_id** | **str** |  | [optional] 
**germplasm_genus** | **str** |  | [optional] 
**germplasm_name** | **str** |  | [optional] 
**germplasm_pui** | **str** |  | [optional] 
**germplasm_species** | **str** |  | [optional] 
**institute_code** | **str** |  | [optional] 
**institute_name** | **str** |  | [optional] 
**pedigree** | **str** |  | [optional] 
**seed_source** | **str** |  | [optional] 
**species_authority** | **str** |  | [optional] 
**subtaxa** | **str** |  | [optional] 
**subtaxa_authority** | **str** |  | [optional] 
**synonyms** | **List[str]** |  | [optional] 
**taxon_ids** | **List[object]** |  | [optional] 
**source_name** | **str** |  | [optional] 
**taxon_id** | **str** |  | [optional] 
**type_of_germplasm_storage_code** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_germplasm_dto import BrAPIv1GermplasmDTO

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1GermplasmDTO from a JSON string
br_apiv1_germplasm_dto_instance = BrAPIv1GermplasmDTO.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1GermplasmDTO.to_json())

# convert the object into a dict
br_apiv1_germplasm_dto_dict = br_apiv1_germplasm_dto_instance.to_dict()
# create an instance of BrAPIv1GermplasmDTO from a dict
br_apiv1_germplasm_dto_from_dict = BrAPIv1GermplasmDTO.from_dict(br_apiv1_germplasm_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


