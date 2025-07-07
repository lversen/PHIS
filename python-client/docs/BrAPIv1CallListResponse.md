# BrAPIv1CallListResponse


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**metadata** | [**MetadataDTO**](MetadataDTO.md) |  | [optional] 
**result** | [**BrapiDataResponsePartListBrAPIv1CallDTO**](BrapiDataResponsePartListBrAPIv1CallDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_call_list_response import BrAPIv1CallListResponse

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1CallListResponse from a JSON string
br_apiv1_call_list_response_instance = BrAPIv1CallListResponse.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1CallListResponse.to_json())

# convert the object into a dict
br_apiv1_call_list_response_dict = br_apiv1_call_list_response_instance.to_dict()
# create an instance of BrAPIv1CallListResponse from a dict
br_apiv1_call_list_response_from_dict = BrAPIv1CallListResponse.from_dict(br_apiv1_call_list_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


