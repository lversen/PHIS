# OrderBy


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**field_name** | **str** |  | [optional] 
**order** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.order_by import OrderBy

# TODO update the JSON string below
json = "{}"
# create an instance of OrderBy from a JSON string
order_by_instance = OrderBy.from_json(json)
# print the JSON string representation of the object
print(OrderBy.to_json())

# convert the object into a dict
order_by_dict = order_by_instance.to_dict()
# create an instance of OrderBy from a dict
order_by_from_dict = OrderBy.from_dict(order_by_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


