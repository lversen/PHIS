# CountItemPeriodDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**difference_count** | **int** |  | [optional] 
**uri** | **str** |  | [optional] 
**type** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**count** | **int** |  | [optional] 

## Example

```python
from openapi_client.models.count_item_period_dto import CountItemPeriodDTO

# TODO update the JSON string below
json = "{}"
# create an instance of CountItemPeriodDTO from a JSON string
count_item_period_dto_instance = CountItemPeriodDTO.from_json(json)
# print the JSON string representation of the object
print(CountItemPeriodDTO.to_json())

# convert the object into a dict
count_item_period_dto_dict = count_item_period_dto_instance.to_dict()
# create an instance of CountItemPeriodDTO from a dict
count_item_period_dto_from_dict = CountItemPeriodDTO.from_dict(count_item_period_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


