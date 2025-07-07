# ModelProperty


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**local_name** | **str** |  | [optional] 
**name_space** | **str** |  | [optional] 
**var_property** | **bool** |  | [optional] 
**ordinal** | **int** |  | [optional] 
**id** | [**AnonId**](AnonId.md) |  | [optional] 
**uri** | **str** |  | [optional] 
**stmt_term** | [**Statement**](Statement.md) |  | [optional] 
**resource** | **bool** |  | [optional] 
**model** | [**Model**](Model.md) |  | [optional] 
**literal** | **bool** |  | [optional] 
**anon** | **bool** |  | [optional] 
**uriresource** | **bool** |  | [optional] 
**stmt_resource** | **bool** |  | [optional] 

## Example

```python
from openapi_client.models.model_property import ModelProperty

# TODO update the JSON string below
json = "{}"
# create an instance of ModelProperty from a JSON string
model_property_instance = ModelProperty.from_json(json)
# print the JSON string representation of the object
print(ModelProperty.to_json())

# convert the object into a dict
model_property_dict = model_property_instance.to_dict()
# create an instance of ModelProperty from a dict
model_property_from_dict = ModelProperty.from_dict(model_property_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


