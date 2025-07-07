# BrAPIv1ObservationUnitListResponse


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**metadata** | [**MetadataDTO**](MetadataDTO.md) |  | [optional] 
**result** | [**BrapiDataResponsePartListBrAPIv1ObservationUnitDTO**](BrapiDataResponsePartListBrAPIv1ObservationUnitDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_observation_unit_list_response import BrAPIv1ObservationUnitListResponse

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1ObservationUnitListResponse from a JSON string
br_apiv1_observation_unit_list_response_instance = BrAPIv1ObservationUnitListResponse.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1ObservationUnitListResponse.to_json())

# convert the object into a dict
br_apiv1_observation_unit_list_response_dict = br_apiv1_observation_unit_list_response_instance.to_dict()
# create an instance of BrAPIv1ObservationUnitListResponse from a dict
br_apiv1_observation_unit_list_response_from_dict = BrAPIv1ObservationUnitListResponse.from_dict(br_apiv1_observation_unit_list_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


