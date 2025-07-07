# ListItemDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.list_item_dto import ListItemDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ListItemDTO from a JSON string
list_item_dto_instance = ListItemDTO.from_json(json)
# print the JSON string representation of the object
print(ListItemDTO.to_json())

# convert the object into a dict
list_item_dto_dict = list_item_dto_instance.to_dict()
# create an instance of ListItemDTO from a dict
list_item_dto_from_dict = ListItemDTO.from_dict(list_item_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


