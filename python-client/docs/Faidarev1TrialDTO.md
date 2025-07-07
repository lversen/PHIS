# Faidarev1TrialDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**active** | **bool** |  | [optional] 
**additional_info** | [**Faidarev1TrialAdditionalInfoDTO**](Faidarev1TrialAdditionalInfoDTO.md) |  | [optional] 
**documentation_url** | **str** |  | [optional] 
**end_date** | **str** |  | [optional] 
**start_date** | **str** |  | [optional] 
**trial_name** | **str** |  | [optional] 
**trial_db_id** | **str** |  | [optional] 
**trial_type** | **str** |  | [optional] 
**dataset_authorship** | [**Faidarev1DatasetAuthorshipDTO**](Faidarev1DatasetAuthorshipDTO.md) |  | [optional] 
**studies** | [**List[Faidarev1StudySummaryDTO]**](Faidarev1StudySummaryDTO.md) |  | [optional] 
**contacts** | [**List[Faidarev1ContactDTO]**](Faidarev1ContactDTO.md) |  | [optional] 
**program_db_id** | **str** |  | [optional] 
**program_name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.faidarev1_trial_dto import Faidarev1TrialDTO

# TODO update the JSON string below
json = "{}"
# create an instance of Faidarev1TrialDTO from a JSON string
faidarev1_trial_dto_instance = Faidarev1TrialDTO.from_json(json)
# print the JSON string representation of the object
print(Faidarev1TrialDTO.to_json())

# convert the object into a dict
faidarev1_trial_dto_dict = faidarev1_trial_dto_instance.to_dict()
# create an instance of Faidarev1TrialDTO from a dict
faidarev1_trial_dto_from_dict = Faidarev1TrialDTO.from_dict(faidarev1_trial_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


