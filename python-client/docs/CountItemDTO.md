# CountItemDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**type** | **str** |  | [optional] 
**count** | **int** |  | [optional] 

## Example

```python
from openapi_client.models.count_item_dto import CountItemDTO

# TODO update the JSON string below
json = "{}"
# create an instance of CountItemDTO from a JSON string
count_item_dto_instance = CountItemDTO.from_json(json)
# print the JSON string representation of the object
print(CountItemDTO.to_json())

# convert the object into a dict
count_item_dto_dict = count_item_dto_instance.to_dict()
# create an instance of CountItemDTO from a dict
count_item_dto_from_dict = CountItemDTO.from_dict(count_item_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


