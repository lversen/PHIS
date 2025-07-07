# Faidarev1LocationListResponse


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**metadata** | [**MetadataDTO**](MetadataDTO.md) |  | [optional] 
**result** | [**BrapiDataResponsePartListFaidarev1LocationDTO**](BrapiDataResponsePartListFaidarev1LocationDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.faidarev1_location_list_response import Faidarev1LocationListResponse

# TODO update the JSON string below
json = "{}"
# create an instance of Faidarev1LocationListResponse from a JSON string
faidarev1_location_list_response_instance = Faidarev1LocationListResponse.from_json(json)
# print the JSON string representation of the object
print(Faidarev1LocationListResponse.to_json())

# convert the object into a dict
faidarev1_location_list_response_dict = faidarev1_location_list_response_instance.to_dict()
# create an instance of Faidarev1LocationListResponse from a dict
faidarev1_location_list_response_from_dict = Faidarev1LocationListResponse.from_dict(faidarev1_location_list_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


