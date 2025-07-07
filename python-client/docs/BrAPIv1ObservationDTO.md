# BrAPIv1ObservationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**germplasm_db_id** | **str** |  | [optional] 
**germplasm_name** | **str** |  | [optional] 
**observation_db_id** | **str** |  | [optional] 
**observation_level** | **str** |  | [optional] 
**observation_time_stamp** | **str** |  | [optional] 
**observation_unit_db_id** | **str** |  | [optional] 
**observation_unit_name** | **str** |  | [optional] 
**observation_variable_db_id** | **str** |  | [optional] 
**observation_variable_name** | **str** |  | [optional] 
**operator** | **str** |  | [optional] 
**season** | [**BrAPIv1SeasonDTO**](BrAPIv1SeasonDTO.md) |  | [optional] 
**study_db_id** | **str** |  | [optional] 
**uploaded_by** | **str** |  | [optional] 
**value** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_observation_dto import BrAPIv1ObservationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1ObservationDTO from a JSON string
br_apiv1_observation_dto_instance = BrAPIv1ObservationDTO.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1ObservationDTO.to_json())

# convert the object into a dict
br_apiv1_observation_dto_dict = br_apiv1_observation_dto_instance.to_dict()
# create an instance of BrAPIv1ObservationDTO from a dict
br_apiv1_observation_dto_from_dict = BrAPIv1ObservationDTO.from_dict(br_apiv1_observation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


