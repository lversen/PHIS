# Seq


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**alt** | **bool** |  | [optional] 
**seq** | **bool** |  | [optional] 
**bag** | **bool** |  | [optional] 
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
from openapi_client.models.seq import Seq

# TODO update the JSON string below
json = "{}"
# create an instance of Seq from a JSON string
seq_instance = Seq.from_json(json)
# print the JSON string representation of the object
print(Seq.to_json())

# convert the object into a dict
seq_dict = seq_instance.to_dict()
# create an instance of Seq from a dict
seq_from_dict = Seq.from_dict(seq_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


