# DataComputedGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**var_date** | **datetime** | date or datetime | 
**value** | **object** | can be decimal, integer, boolean, string or date | 

## Example

```python
from openapi_client.models.data_computed_get_dto import DataComputedGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of DataComputedGetDTO from a JSON string
data_computed_get_dto_instance = DataComputedGetDTO.from_json(json)
# print the JSON string representation of the object
print(DataComputedGetDTO.to_json())

# convert the object into a dict
data_computed_get_dto_dict = data_computed_get_dto_instance.to_dict()
# create an instance of DataComputedGetDTO from a dict
data_computed_get_dto_from_dict = DataComputedGetDTO.from_dict(data_computed_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


