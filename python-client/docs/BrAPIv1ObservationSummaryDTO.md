# BrAPIv1ObservationSummaryDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**collector** | **str** |  | [optional] 
**observation_db_id** | **str** |  | [optional] 
**observation_time_stamp** | **str** |  | [optional] 
**observation_variable_db_id** | **str** |  | [optional] 
**observation_variable_name** | **str** |  | [optional] 
**season** | [**BrAPIv1SeasonDTO**](BrAPIv1SeasonDTO.md) |  | [optional] 
**value** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_observation_summary_dto import BrAPIv1ObservationSummaryDTO

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1ObservationSummaryDTO from a JSON string
br_apiv1_observation_summary_dto_instance = BrAPIv1ObservationSummaryDTO.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1ObservationSummaryDTO.to_json())

# convert the object into a dict
br_apiv1_observation_summary_dto_dict = br_apiv1_observation_summary_dto_instance.to_dict()
# create an instance of BrAPIv1ObservationSummaryDTO from a dict
br_apiv1_observation_summary_dto_from_dict = BrAPIv1ObservationSummaryDTO.from_dict(br_apiv1_observation_summary_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


