# SiteGetWithGeometryDTO


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
**facilities** | **List[str]** |  | [optional] 
**geometry** | [**GeoJsonObject**](GeoJsonObject.md) |  | [optional] 

## Example

```python
from openapi_client.models.site_get_with_geometry_dto import SiteGetWithGeometryDTO

# TODO update the JSON string below
json = "{}"
# create an instance of SiteGetWithGeometryDTO from a JSON string
site_get_with_geometry_dto_instance = SiteGetWithGeometryDTO.from_json(json)
# print the JSON string representation of the object
print(SiteGetWithGeometryDTO.to_json())

# convert the object into a dict
site_get_with_geometry_dto_dict = site_get_with_geometry_dto_instance.to_dict()
# create an instance of SiteGetWithGeometryDTO from a dict
site_get_with_geometry_dto_from_dict = SiteGetWithGeometryDTO.from_dict(site_get_with_geometry_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


