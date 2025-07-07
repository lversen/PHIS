# Faidarev1CallListResponse


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**metadata** | [**MetadataDTO**](MetadataDTO.md) |  | [optional] 
**result** | [**BrapiDataResponsePartListFaidarev1CallDTO**](BrapiDataResponsePartListFaidarev1CallDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.faidarev1_call_list_response import Faidarev1CallListResponse

# TODO update the JSON string below
json = "{}"
# create an instance of Faidarev1CallListResponse from a JSON string
faidarev1_call_list_response_instance = Faidarev1CallListResponse.from_json(json)
# print the JSON string representation of the object
print(Faidarev1CallListResponse.to_json())

# convert the object into a dict
faidarev1_call_list_response_dict = faidarev1_call_list_response_instance.to_dict()
# create an instance of Faidarev1CallListResponse from a dict
faidarev1_call_list_response_from_dict = Faidarev1CallListResponse.from_dict(faidarev1_call_list_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


