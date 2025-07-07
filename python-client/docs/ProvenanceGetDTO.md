# ProvenanceGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | provenance name | [optional] 
**name** | **str** | provenance uri manually entered | 
**description** | **str** | provenance description | [optional] 
**prov_activity** | [**List[ActivityGetDTO]**](ActivityGetDTO.md) |  | [optional] 
**prov_agent** | [**List[AgentModel]**](AgentModel.md) |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**issued** | **datetime** |  | [optional] 
**modified** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.provenance_get_dto import ProvenanceGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ProvenanceGetDTO from a JSON string
provenance_get_dto_instance = ProvenanceGetDTO.from_json(json)
# print the JSON string representation of the object
print(ProvenanceGetDTO.to_json())

# convert the object into a dict
provenance_get_dto_dict = provenance_get_dto_instance.to_dict()
# create an instance of ProvenanceGetDTO from a dict
provenance_get_dto_from_dict = ProvenanceGetDTO.from_dict(provenance_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


