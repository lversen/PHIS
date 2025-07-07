# DataGetDetailsDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | data URI | 
**var_date** | **str** | date or datetime | 
**target** | **str** | target URI on which the data have been collected (e.g. a scientific object) | [optional] 
**variable** | **str** | variable URI | 
**value** | **object** | can be decimal, integer, boolean, string or date | 
**confidence** | **float** | confidence index | [optional] 
**provenance** | [**DataProvenanceModel**](DataProvenanceModel.md) |  | 
**metadata** | **Dict[str, object]** | key-value system to store additional information that can be used to query data | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**raw_data** | **List[object]** | list of repetition values | [optional] 
**issued** | **datetime** |  | [optional] 
**modified** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.data_get_details_dto import DataGetDetailsDTO

# TODO update the JSON string below
json = "{}"
# create an instance of DataGetDetailsDTO from a JSON string
data_get_details_dto_instance = DataGetDetailsDTO.from_json(json)
# print the JSON string representation of the object
print(DataGetDetailsDTO.to_json())

# convert the object into a dict
data_get_details_dto_dict = data_get_details_dto_instance.to_dict()
# create an instance of DataGetDetailsDTO from a dict
data_get_details_dto_from_dict = DataGetDetailsDTO.from_dict(data_get_details_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


