# CountListItemPeriodDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**total_difference_item_count** | **int** |  | [optional] 
**difference_items** | [**List[CountItemPeriodDTO]**](CountItemPeriodDTO.md) |  | [optional] 
**name** | **str** |  | [optional] 
**type** | **str** |  | [optional] 
**total_items_count** | **int** |  | [optional] 
**items** | [**List[CountItemDTO]**](CountItemDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.count_list_item_period_dto import CountListItemPeriodDTO

# TODO update the JSON string below
json = "{}"
# create an instance of CountListItemPeriodDTO from a JSON string
count_list_item_period_dto_instance = CountListItemPeriodDTO.from_json(json)
# print the JSON string representation of the object
print(CountListItemPeriodDTO.to_json())

# convert the object into a dict
count_list_item_period_dto_dict = count_list_item_period_dto_instance.to_dict()
# create an instance of CountListItemPeriodDTO from a dict
count_list_item_period_dto_from_dict = CountListItemPeriodDTO.from_dict(count_list_item_period_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


