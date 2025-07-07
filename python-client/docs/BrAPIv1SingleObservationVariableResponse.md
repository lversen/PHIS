# BrAPIv1SingleObservationVariableResponse


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**metadata** | [**MetadataDTO**](MetadataDTO.md) |  | [optional] 
**result** | [**BrAPIv1ObservationVariableDTO**](BrAPIv1ObservationVariableDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_single_observation_variable_response import BrAPIv1SingleObservationVariableResponse

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1SingleObservationVariableResponse from a JSON string
br_apiv1_single_observation_variable_response_instance = BrAPIv1SingleObservationVariableResponse.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1SingleObservationVariableResponse.to_json())

# convert the object into a dict
br_apiv1_single_observation_variable_response_dict = br_apiv1_single_observation_variable_response_instance.to_dict()
# create an instance of BrAPIv1SingleObservationVariableResponse from a dict
br_apiv1_single_observation_variable_response_from_dict = BrAPIv1SingleObservationVariableResponse.from_dict(br_apiv1_single_observation_variable_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


