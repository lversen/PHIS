# AreaGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**is_structural_area** | **bool** |  | [optional] 
**name** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**geometry** | [**GeoJsonObject**](GeoJsonObject.md) |  | [optional] 
**event** | [**EventGetDTO**](EventGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.area_get_dto import AreaGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of AreaGetDTO from a JSON string
area_get_dto_instance = AreaGetDTO.from_json(json)
# print the JSON string representation of the object
print(AreaGetDTO.to_json())

# convert the object into a dict
area_get_dto_dict = area_get_dto_instance.to_dict()
# create an instance of AreaGetDTO from a dict
area_get_dto_from_dict = AreaGetDTO.from_dict(area_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


