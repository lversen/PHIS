# GermplasmGetAllDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**species** | **str** |  | [optional] 
**species_name** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.germplasm_get_all_dto import GermplasmGetAllDTO

# TODO update the JSON string below
json = "{}"
# create an instance of GermplasmGetAllDTO from a JSON string
germplasm_get_all_dto_instance = GermplasmGetAllDTO.from_json(json)
# print the JSON string representation of the object
print(GermplasmGetAllDTO.to_json())

# convert the object into a dict
germplasm_get_all_dto_dict = germplasm_get_all_dto_instance.to_dict()
# create an instance of GermplasmGetAllDTO from a dict
germplasm_get_all_dto_from_dict = GermplasmGetAllDTO.from_dict(germplasm_get_all_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


