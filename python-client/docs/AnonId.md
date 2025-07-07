# AnonId


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**blank_node_id** | [**BlankNodeId**](BlankNodeId.md) |  | [optional] 
**label_string** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.anon_id import AnonId

# TODO update the JSON string below
json = "{}"
# create an instance of AnonId from a JSON string
anon_id_instance = AnonId.from_json(json)
# print the JSON string representation of the object
print(AnonId.to_json())

# convert the object into a dict
anon_id_dict = anon_id_instance.to_dict()
# create an instance of AnonId from a dict
anon_id_from_dict = AnonId.from_dict(anon_id_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


