# GeometryDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Object URI | [optional] 
**geometry** | [**GeoJsonObject**](GeoJsonObject.md) |  | [optional] 

## Example

```python
from openapi_client.models.geometry_dto import GeometryDTO

# TODO update the JSON string below
json = "{}"
# create an instance of GeometryDTO from a JSON string
geometry_dto_instance = GeometryDTO.from_json(json)
# print the JSON string representation of the object
print(GeometryDTO.to_json())

# convert the object into a dict
geometry_dto_dict = geometry_dto_instance.to_dict()
# create an instance of GeometryDTO from a dict
geometry_dto_from_dict = GeometryDTO.from_dict(geometry_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


