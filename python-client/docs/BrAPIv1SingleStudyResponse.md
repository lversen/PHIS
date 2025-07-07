# BrAPIv1SingleStudyResponse


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**metadata** | [**MetadataDTO**](MetadataDTO.md) |  | [optional] 
**result** | [**BrAPIv1SuperStudyDTO**](BrAPIv1SuperStudyDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_single_study_response import BrAPIv1SingleStudyResponse

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1SingleStudyResponse from a JSON string
br_apiv1_single_study_response_instance = BrAPIv1SingleStudyResponse.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1SingleStudyResponse.to_json())

# convert the object into a dict
br_apiv1_single_study_response_dict = br_apiv1_single_study_response_instance.to_dict()
# create an instance of BrAPIv1SingleStudyResponse from a dict
br_apiv1_single_study_response_from_dict = BrAPIv1SingleStudyResponse.from_dict(br_apiv1_single_study_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


