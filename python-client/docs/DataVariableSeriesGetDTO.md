# DataVariableSeriesGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**variable** | [**VariableDetailsDTO**](VariableDetailsDTO.md) |  | [optional] 
**provenances** | [**List[DataSimpleProvenanceGetDTO]**](DataSimpleProvenanceGetDTO.md) |  | [optional] 
**devices** | [**List[DeviceGetDTO]**](DeviceGetDTO.md) |  | [optional] 
**data_series** | [**List[DataSerieGetDTO]**](DataSerieGetDTO.md) |  | [optional] 
**calculated_series** | [**List[DataSerieGetDTO]**](DataSerieGetDTO.md) |  | [optional] 
**last_data_stored** | [**DataComputedGetDTO**](DataComputedGetDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.data_variable_series_get_dto import DataVariableSeriesGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of DataVariableSeriesGetDTO from a JSON string
data_variable_series_get_dto_instance = DataVariableSeriesGetDTO.from_json(json)
# print the JSON string representation of the object
print(DataVariableSeriesGetDTO.to_json())

# convert the object into a dict
data_variable_series_get_dto_dict = data_variable_series_get_dto_instance.to_dict()
# create an instance of DataVariableSeriesGetDTO from a dict
data_variable_series_get_dto_from_dict = DataVariableSeriesGetDTO.from_dict(data_variable_series_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


