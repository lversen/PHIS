# AreaUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Area URI | 
**is_structural_area** | **bool** | Area type ( true &#x3D; structural | false &#x3D; temporal) | 
**rdf_type** | **str** | Area rdf_type | 
**name** | **str** | Area name | 
**description** | **str** | Description of the area | [optional] 
**geometry** | [**GeoJsonObject**](GeoJsonObject.md) |  | 
**event** | [**EventCreationDTO**](EventCreationDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.area_update_dto import AreaUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of AreaUpdateDTO from a JSON string
area_update_dto_instance = AreaUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(AreaUpdateDTO.to_json())

# convert the object into a dict
area_update_dto_dict = area_update_dto_instance.to_dict()
# create an instance of AreaUpdateDTO from a dict
area_update_dto_from_dict = AreaUpdateDTO.from_dict(area_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


