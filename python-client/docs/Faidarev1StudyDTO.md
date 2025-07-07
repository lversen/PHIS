# Faidarev1StudyDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**active** | **str** |  | [optional] 
**additional_info** | **Dict[str, str]** |  | [optional] 
**documentation_url** | **str** |  | [optional] 
**end_date** | **str** |  | [optional] 
**location_db_id** | **str** |  | [optional] 
**location_name** | **str** |  | [optional] 
**last_update** | [**Faidarev1LastUpdateDTO**](Faidarev1LastUpdateDTO.md) |  | [optional] 
**name** | **str** |  | [optional] 
**program_db_id** | **str** |  | [optional] 
**program_name** | **str** |  | [optional] 
**start_date** | **str** |  | [optional] 
**study_type** | **str** |  | [optional] 
**study_db_id** | **str** |  | [optional] 
**study_name** | **str** |  | [optional] 
**trial_db_id** | **str** |  | [optional] 
**trial_name** | **str** |  | [optional] 
**trial_db_ids** | **List[str]** |  | [optional] 
**contacts** | [**List[Faidarev1ContactDTO]**](Faidarev1ContactDTO.md) |  | [optional] 
**data_links** | [**List[Faidarev1DataLinkDTO]**](Faidarev1DataLinkDTO.md) |  | [optional] 
**study_description** | **str** |  | [optional] 
**seasons** | **List[str]** |  | [optional] 
**observation_variable_db_ids** | **List[str]** |  | [optional] 
**germplasm_db_ids** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.faidarev1_study_dto import Faidarev1StudyDTO

# TODO update the JSON string below
json = "{}"
# create an instance of Faidarev1StudyDTO from a JSON string
faidarev1_study_dto_instance = Faidarev1StudyDTO.from_json(json)
# print the JSON string representation of the object
print(Faidarev1StudyDTO.to_json())

# convert the object into a dict
faidarev1_study_dto_dict = faidarev1_study_dto_instance.to_dict()
# create an instance of Faidarev1StudyDTO from a dict
faidarev1_study_dto_from_dict = Faidarev1StudyDTO.from_dict(faidarev1_study_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


