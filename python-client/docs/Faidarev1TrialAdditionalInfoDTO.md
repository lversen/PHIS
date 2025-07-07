# Faidarev1TrialAdditionalInfoDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**short_name** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**financial_funding** | **str** |  | [optional] 
**related_projects** | **List[str]** |  | [optional] 
**coordinators** | [**List[Faidarev1ContactDTO]**](Faidarev1ContactDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.faidarev1_trial_additional_info_dto import Faidarev1TrialAdditionalInfoDTO

# TODO update the JSON string below
json = "{}"
# create an instance of Faidarev1TrialAdditionalInfoDTO from a JSON string
faidarev1_trial_additional_info_dto_instance = Faidarev1TrialAdditionalInfoDTO.from_json(json)
# print the JSON string representation of the object
print(Faidarev1TrialAdditionalInfoDTO.to_json())

# convert the object into a dict
faidarev1_trial_additional_info_dto_dict = faidarev1_trial_additional_info_dto_instance.to_dict()
# create an instance of Faidarev1TrialAdditionalInfoDTO from a dict
faidarev1_trial_additional_info_dto_from_dict = Faidarev1TrialAdditionalInfoDTO.from_dict(faidarev1_trial_additional_info_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


