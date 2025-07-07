# AgentModel


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Agent uri | [optional] 
**rdf_type** | **str** | Agent type defined in the ontology | [optional] 
**settings** | **Dict[str, object]** | a key value system to store parameters | [optional] 

## Example

```python
from openapi_client.models.agent_model import AgentModel

# TODO update the JSON string below
json = "{}"
# create an instance of AgentModel from a JSON string
agent_model_instance = AgentModel.from_json(json)
# print the JSON string representation of the object
print(AgentModel.to_json())

# convert the object into a dict
agent_model_dict = agent_model_instance.to_dict()
# create an instance of AgentModel from a dict
agent_model_from_dict = AgentModel.from_dict(agent_model_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


