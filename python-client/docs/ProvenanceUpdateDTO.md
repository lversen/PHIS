# ProvenanceUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | uri of the provenance being updated | 
**name** | **str** | provenance uri manually entered | 
**description** | **str** | provenance description | [optional] 
**prov_activity** | [**List[ActivityCreationDTO]**](ActivityCreationDTO.md) |  | [optional] 
**prov_agent** | [**List[AgentModel]**](AgentModel.md) |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**issued** | **datetime** |  | [optional] 
**modified** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.provenance_update_dto import ProvenanceUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ProvenanceUpdateDTO from a JSON string
provenance_update_dto_instance = ProvenanceUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(ProvenanceUpdateDTO.to_json())

# convert the object into a dict
provenance_update_dto_dict = provenance_update_dto_instance.to_dict()
# create an instance of ProvenanceUpdateDTO from a dict
provenance_update_dto_from_dict = ProvenanceUpdateDTO.from_dict(provenance_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


