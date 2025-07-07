# MetricDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**object_uri** | **str** |  | [optional] 
**created_date** | **str** | date or datetime | 
**items** | [**List[CountListItemDTO]**](CountListItemDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.metric_dto import MetricDTO

# TODO update the JSON string below
json = "{}"
# create an instance of MetricDTO from a JSON string
metric_dto_instance = MetricDTO.from_json(json)
# print the JSON string representation of the object
print(MetricDTO.to_json())

# convert the object into a dict
metric_dto_dict = metric_dto_instance.to_dict()
# create an instance of MetricDTO from a dict
metric_dto_from_dict = MetricDTO.from_dict(metric_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


