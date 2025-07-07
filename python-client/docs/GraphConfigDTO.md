# GraphConfigDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**variable** | **str** |  | [optional] 
**data_location_informations** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.graph_config_dto import GraphConfigDTO

# TODO update the JSON string below
json = "{}"
# create an instance of GraphConfigDTO from a JSON string
graph_config_dto_instance = GraphConfigDTO.from_json(json)
# print the JSON string representation of the object
print(GraphConfigDTO.to_json())

# convert the object into a dict
graph_config_dto_dict = graph_config_dto_instance.to_dict()
# create an instance of GraphConfigDTO from a dict
graph_config_dto_from_dict = GraphConfigDTO.from_dict(graph_config_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


