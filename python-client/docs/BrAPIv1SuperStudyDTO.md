# BrAPIv1SuperStudyDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**active** | **str** |  | [optional] 
**additional_info** | **Dict[str, str]** |  | [optional] 
**common_crop_name** | **str** |  | [optional] 
**documentation_url** | **str** |  | [optional] 
**end_date** | **str** |  | [optional] 
**location_db_id** | **str** |  | [optional] 
**location_name** | **str** |  | [optional] 
**program_db_id** | **str** |  | [optional] 
**program_name** | **str** |  | [optional] 
**start_date** | **str** |  | [optional] 
**study_db_id** | **str** |  | [optional] 
**study_name** | **str** |  | [optional] 
**study_type_db_id** | **str** |  | [optional] 
**study_type_name** | **str** |  | [optional] 
**trial_db_id** | **str** |  | [optional] 
**trial_name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_super_study_dto import BrAPIv1SuperStudyDTO

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1SuperStudyDTO from a JSON string
br_apiv1_super_study_dto_instance = BrAPIv1SuperStudyDTO.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1SuperStudyDTO.to_json())

# convert the object into a dict
br_apiv1_super_study_dto_dict = br_apiv1_super_study_dto_instance.to_dict()
# create an instance of BrAPIv1SuperStudyDTO from a dict
br_apiv1_super_study_dto_from_dict = BrAPIv1SuperStudyDTO.from_dict(br_apiv1_super_study_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


