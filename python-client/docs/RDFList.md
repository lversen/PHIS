# RDFList


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**empty** | **bool** |  | [optional] 
**strict** | **bool** |  | [optional] 
**valid** | **bool** |  | [optional] 
**validity_error_message** | **str** |  | [optional] 
**head** | [**RDFNode**](RDFNode.md) |  | [optional] 
**tail** | [**RDFList**](RDFList.md) |  | [optional] 
**id** | [**AnonId**](AnonId.md) |  | [optional] 
**uri** | **str** |  | [optional] 
**local_name** | **str** |  | [optional] 
**name_space** | **str** |  | [optional] 
**stmt_term** | [**Statement**](Statement.md) |  | [optional] 
**resource** | **bool** |  | [optional] 
**model** | [**Model**](Model.md) |  | [optional] 
**literal** | **bool** |  | [optional] 
**anon** | **bool** |  | [optional] 
**uriresource** | **bool** |  | [optional] 
**stmt_resource** | **bool** |  | [optional] 

## Example

```python
from openapi_client.models.rdf_list import RDFList

# TODO update the JSON string below
json = "{}"
# create an instance of RDFList from a JSON string
rdf_list_instance = RDFList.from_json(json)
# print the JSON string representation of the object
print(RDFList.to_json())

# convert the object into a dict
rdf_list_dict = rdf_list_instance.to_dict()
# create an instance of RDFList from a dict
rdf_list_from_dict = RDFList.from_dict(rdf_list_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


