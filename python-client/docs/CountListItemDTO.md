# CountListItemDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**total_items_count** | **int** |  | [optional] 
**items** | [**List[CountItemDTO]**](CountItemDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.count_list_item_dto import CountListItemDTO

# TODO update the JSON string below
json = "{}"
# create an instance of CountListItemDTO from a JSON string
count_list_item_dto_instance = CountListItemDTO.from_json(json)
# print the JSON string representation of the object
print(CountListItemDTO.to_json())

# convert the object into a dict
count_list_item_dto_dict = count_list_item_dto_instance.to_dict()
# create an instance of CountListItemDTO from a dict
count_list_item_dto_from_dict = CountListItemDTO.from_dict(count_list_item_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


