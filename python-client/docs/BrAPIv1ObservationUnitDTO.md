# BrAPIv1ObservationUnitDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**block_number** | **str** |  | [optional] 
**entry_number** | **str** |  | [optional] 
**entry_type** | **str** |  | [optional] 
**germplasm_db_id** | **str** |  | [optional] 
**germplasm_name** | **str** |  | [optional] 
**location_db_id** | **str** |  | [optional] 
**location_name** | **str** |  | [optional] 
**observation_level** | **str** |  | [optional] 
**observation_unit_db_id** | **str** |  | [optional] 
**observation_unit_xref** | [**List[BrAPIv1ObservationUnitXrefDTO]**](BrAPIv1ObservationUnitXrefDTO.md) |  | [optional] 
**observations** | [**List[BrAPIv1ObservationSummaryDTO]**](BrAPIv1ObservationSummaryDTO.md) |  | [optional] 
**pedigree** | **str** |  | [optional] 
**plant_number** | **str** |  | [optional] 
**plot_number** | **str** |  | [optional] 
**position_coordinate_x** | **str** |  | [optional] 
**position_coordinate_x_type** | **str** |  | [optional] 
**position_coordinate_y** | **str** |  | [optional] 
**position_coordinate_y_type** | **str** |  | [optional] 
**program_db_id** | **str** |  | [optional] 
**program_name** | **str** |  | [optional] 
**replicate** | **str** |  | [optional] 
**study_db_id** | **str** |  | [optional] 
**study_name** | **str** |  | [optional] 
**treatments** | [**List[BrAPIv1ObservationUnitTreatmentDTO]**](BrAPIv1ObservationUnitTreatmentDTO.md) |  | [optional] 
**trial_db_id** | **str** |  | [optional] 
**trial_name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_observation_unit_dto import BrAPIv1ObservationUnitDTO

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1ObservationUnitDTO from a JSON string
br_apiv1_observation_unit_dto_instance = BrAPIv1ObservationUnitDTO.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1ObservationUnitDTO.to_json())

# convert the object into a dict
br_apiv1_observation_unit_dto_dict = br_apiv1_observation_unit_dto_instance.to_dict()
# create an instance of BrAPIv1ObservationUnitDTO from a dict
br_apiv1_observation_unit_dto_from_dict = BrAPIv1ObservationUnitDTO.from_dict(br_apiv1_observation_unit_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


