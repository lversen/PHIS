# SiteGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**name** | **str** |  | [optional] 
**address** | [**SiteAddressDTO**](SiteAddressDTO.md) |  | [optional] 
**organizations** | [**List[NamedResourceDTOOrganizationModel]**](NamedResourceDTOOrganizationModel.md) |  | [optional] 
**facilities** | [**List[NamedResourceDTOFacilityModel]**](NamedResourceDTOFacilityModel.md) |  | [optional] 
**groups** | [**List[NamedResourceDTOGroupModel]**](NamedResourceDTOGroupModel.md) |  | [optional] 
**geometry** | [**GeoJsonObject**](GeoJsonObject.md) |  | [optional] 
**description** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.site_get_dto import SiteGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of SiteGetDTO from a JSON string
site_get_dto_instance = SiteGetDTO.from_json(json)
# print the JSON string representation of the object
print(SiteGetDTO.to_json())

# convert the object into a dict
site_get_dto_dict = site_get_dto_instance.to_dict()
# create an instance of SiteGetDTO from a dict
site_get_dto_from_dict = SiteGetDTO.from_dict(site_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


