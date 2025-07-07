# SiteGetListDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**address** | [**SiteAddressDTO**](SiteAddressDTO.md) |  | [optional] 
**description** | **str** |  | [optional] 
**organizations** | **List[str]** |  | [optional] 
**facilities** | [**List[NamedResourceDTO]**](NamedResourceDTO.md) |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.site_get_list_dto import SiteGetListDTO

# TODO update the JSON string below
json = "{}"
# create an instance of SiteGetListDTO from a JSON string
site_get_list_dto_instance = SiteGetListDTO.from_json(json)
# print the JSON string representation of the object
print(SiteGetListDTO.to_json())

# convert the object into a dict
site_get_list_dto_dict = site_get_list_dto_instance.to_dict()
# create an instance of SiteGetListDTO from a dict
site_get_list_dto_from_dict = SiteGetListDTO.from_dict(site_get_list_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


