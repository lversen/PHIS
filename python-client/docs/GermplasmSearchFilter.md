# GermplasmSearchFilter


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**included_uris** | **List[str]** |  | [optional] 
**rdf_types** | **List[str]** |  | [optional] 
**page** | **int** | Page number | [optional] 
**lang** | **str** |  | [optional] 
**uri** | **str** | Regex pattern for filtering list by uri | [optional] 
**name** | **str** | Regex pattern for filtering list by name and synonyms | [optional] 
**code** | **str** | Regex pattern for filtering list by code | [optional] 
**species** | **str** | Search by species | [optional] 
**variety** | **str** | Search by variety | [optional] 
**accession** | **str** | Search by accession | [optional] 
**institute** | **str** | Search by institute | [optional] 
**experiment** | **str** | Search by experiment | [optional] 
**metadata** | **str** | Search by metadata | [optional] 
**uris** | **List[str]** | List of germplasm URI | [optional] 
**group** | **str** | Search by germplasm group | [optional] 
**parent_germplasms** | **List[str]** |  | [optional] 
**parent_m_germplasms** | **List[str]** |  | [optional] 
**parent_f_germplasms** | **List[str]** |  | [optional] 
**order_by** | [**List[OrderBy]**](OrderBy.md) | List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
**page_size** | **int** | Page size | [optional] 
**rdf_type** | **str** | Search by type | [optional] 
**production_year** | **int** | Search by production year | [optional] 

## Example

```python
from openapi_client.models.germplasm_search_filter import GermplasmSearchFilter

# TODO update the JSON string below
json = "{}"
# create an instance of GermplasmSearchFilter from a JSON string
germplasm_search_filter_instance = GermplasmSearchFilter.from_json(json)
# print the JSON string representation of the object
print(GermplasmSearchFilter.to_json())

# convert the object into a dict
germplasm_search_filter_dict = germplasm_search_filter_instance.to_dict()
# create an instance of GermplasmSearchFilter from a dict
germplasm_search_filter_from_dict = GermplasmSearchFilter.from_dict(germplasm_search_filter_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


