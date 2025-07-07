# Resource


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
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
from openapi_client.models.resource import Resource

# TODO update the JSON string below
json = "{}"
# create an instance of Resource from a JSON string
resource_instance = Resource.from_json(json)
# print the JSON string representation of the object
print(Resource.to_json())

# convert the object into a dict
resource_dict = resource_instance.to_dict()
# create an instance of Resource from a dict
resource_from_dict = Resource.from_dict(resource_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


