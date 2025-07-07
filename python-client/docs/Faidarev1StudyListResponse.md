# Faidarev1StudyListResponse


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**metadata** | [**MetadataDTO**](MetadataDTO.md) |  | [optional] 
**result** | [**BrapiDataResponsePartListFaidarev1StudyDTO**](BrapiDataResponsePartListFaidarev1StudyDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.faidarev1_study_list_response import Faidarev1StudyListResponse

# TODO update the JSON string below
json = "{}"
# create an instance of Faidarev1StudyListResponse from a JSON string
faidarev1_study_list_response_instance = Faidarev1StudyListResponse.from_json(json)
# print the JSON string representation of the object
print(Faidarev1StudyListResponse.to_json())

# convert the object into a dict
faidarev1_study_list_response_dict = faidarev1_study_list_response_instance.to_dict()
# create an instance of Faidarev1StudyListResponse from a dict
faidarev1_study_list_response_from_dict = Faidarev1StudyListResponse.from_dict(faidarev1_study_list_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


