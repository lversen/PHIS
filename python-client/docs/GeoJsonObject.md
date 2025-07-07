# GeoJsonObject


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **str** |  | 
**bbox** | **List[float]** |  | [optional] 
**coordinates** | **List[float]** |  | [optional] 

## Example

```python
from openapi_client.models.geo_json_object import GeoJsonObject

# TODO update the JSON string below
json = "{}"
# create an instance of GeoJsonObject from a JSON string
geo_json_object_instance = GeoJsonObject.from_json(json)
# print the JSON string representation of the object
print(GeoJsonObject.to_json())

# convert the object into a dict
geo_json_object_dict = geo_json_object_instance.to_dict()
# create an instance of GeoJsonObject from a dict
geo_json_object_from_dict = GeoJsonObject.from_dict(geo_json_object_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


