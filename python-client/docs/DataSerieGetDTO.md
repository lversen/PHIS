# DataSerieGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**provenance** | [**DataSimpleProvenanceGetDTO**](DataSimpleProvenanceGetDTO.md) |  | [optional] 
**data** | [**List[DataComputedGetDTO]**](DataComputedGetDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.data_serie_get_dto import DataSerieGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of DataSerieGetDTO from a JSON string
data_serie_get_dto_instance = DataSerieGetDTO.from_json(json)
# print the JSON string representation of the object
print(DataSerieGetDTO.to_json())

# convert the object into a dict
data_serie_get_dto_dict = data_serie_get_dto_instance.to_dict()
# create an instance of DataSerieGetDTO from a dict
data_serie_get_dto_from_dict = DataSerieGetDTO.from_dict(data_serie_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


