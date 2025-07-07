# ProvenanceCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | provenance name | [optional] 
**name** | **str** | provenance uri manually entered | 
**description** | **str** | provenance description | [optional] 
**prov_activity** | [**List[ActivityCreationDTO]**](ActivityCreationDTO.md) |  | [optional] 
**prov_agent** | [**List[AgentModel]**](AgentModel.md) |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**issued** | **datetime** |  | [optional] 
**modified** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.provenance_creation_dto import ProvenanceCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ProvenanceCreationDTO from a JSON string
provenance_creation_dto_instance = ProvenanceCreationDTO.from_json(json)
# print the JSON string representation of the object
print(ProvenanceCreationDTO.to_json())

# convert the object into a dict
provenance_creation_dto_dict = provenance_creation_dto_instance.to_dict()
# create an instance of ProvenanceCreationDTO from a dict
provenance_creation_dto_from_dict = ProvenanceCreationDTO.from_dict(provenance_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


