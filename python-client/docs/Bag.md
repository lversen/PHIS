# Bag


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
from openapi_client.models.bag import Bag

# TODO update the JSON string below
json = "{}"
# create an instance of Bag from a JSON string
bag_instance = Bag.from_json(json)
# print the JSON string representation of the object
print(Bag.to_json())

# convert the object into a dict
bag_dict = bag_instance.to_dict()
# create an instance of Bag from a dict
bag_from_dict = Bag.from_dict(bag_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


