# RDFNode


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**resource** | **bool** |  | [optional] 
**model** | [**Model**](Model.md) |  | [optional] 
**literal** | **bool** |  | [optional] 
**anon** | **bool** |  | [optional] 
**uriresource** | **bool** |  | [optional] 
**stmt_resource** | **bool** |  | [optional] 

## Example

```python
from openapi_client.models.rdf_node import RDFNode

# TODO update the JSON string below
json = "{}"
# create an instance of RDFNode from a JSON string
rdf_node_instance = RDFNode.from_json(json)
# print the JSON string representation of the object
print(RDFNode.to_json())

# convert the object into a dict
rdf_node_dict = rdf_node_instance.to_dict()
# create an instance of RDFNode from a dict
rdf_node_from_dict = RDFNode.from_dict(rdf_node_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


