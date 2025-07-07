# BrAPIv1StudyListResponse


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**metadata** | [**MetadataDTO**](MetadataDTO.md) |  | [optional] 
**result** | [**BrapiDataResponsePartListBrAPIv1StudyDTO**](BrapiDataResponsePartListBrAPIv1StudyDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_study_list_response import BrAPIv1StudyListResponse

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1StudyListResponse from a JSON string
br_apiv1_study_list_response_instance = BrAPIv1StudyListResponse.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1StudyListResponse.to_json())

# convert the object into a dict
br_apiv1_study_list_response_dict = br_apiv1_study_list_response_instance.to_dict()
# create an instance of BrAPIv1StudyListResponse from a dict
br_apiv1_study_list_response_from_dict = BrAPIv1StudyListResponse.from_dict(br_apiv1_study_list_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


