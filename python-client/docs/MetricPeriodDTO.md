# MetricPeriodDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**start_date** | **int** |  | [optional] 
**end_date** | **int** |  | [optional] 
**scientific_object_list** | [**CountListItemPeriodDTO**](CountListItemPeriodDTO.md) |  | [optional] 
**experiment_list** | [**CountListItemPeriodDTO**](CountListItemPeriodDTO.md) |  | [optional] 
**data_list** | [**CountListItemPeriodDTO**](CountListItemPeriodDTO.md) |  | [optional] 
**device_list** | [**CountListItemPeriodDTO**](CountListItemPeriodDTO.md) |  | [optional] 
**germplasm_list** | [**CountListItemPeriodDTO**](CountListItemPeriodDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.metric_period_dto import MetricPeriodDTO

# TODO update the JSON string below
json = "{}"
# create an instance of MetricPeriodDTO from a JSON string
metric_period_dto_instance = MetricPeriodDTO.from_json(json)
# print the JSON string representation of the object
print(MetricPeriodDTO.to_json())

# convert the object into a dict
metric_period_dto_dict = metric_period_dto_instance.to_dict()
# create an instance of MetricPeriodDTO from a dict
metric_period_dto_from_dict = MetricPeriodDTO.from_dict(metric_period_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


