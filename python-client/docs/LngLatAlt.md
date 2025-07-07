# LngLatAlt


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**longitude** | **float** |  | [optional] 
**latitude** | **float** |  | [optional] 
**altitude** | **float** |  | [optional] 
**additional_elements** | **List[float]** |  | [optional] 

## Example

```python
from openapi_client.models.lng_lat_alt import LngLatAlt

# TODO update the JSON string below
json = "{}"
# create an instance of LngLatAlt from a JSON string
lng_lat_alt_instance = LngLatAlt.from_json(json)
# print the JSON string representation of the object
print(LngLatAlt.to_json())

# convert the object into a dict
lng_lat_alt_dict = lng_lat_alt_instance.to_dict()
# create an instance of LngLatAlt from a dict
lng_lat_alt_from_dict = LngLatAlt.from_dict(lng_lat_alt_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


