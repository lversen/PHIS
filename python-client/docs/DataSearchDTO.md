# DataSearchDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**start_date** | **str** | start date | [optional] 
**end_date** | **str** | end date | [optional] 
**timezone** | **str** | to specify if the offset is not in the date and if the timezone is different from the default one | [optional] 
**experiments** | **List[str]** |  | [optional] 
**targets** | **List[str]** |  | [optional] 
**variables** | **List[str]** |  | [optional] 
**devices** | **List[str]** |  | [optional] 
**provenances** | **List[str]** |  | [optional] 
**min_confidence** | **float** | confidence index | [optional] 
**max_confidence** | **float** | confidence index | [optional] 
**metadata** | **str** | key-value system to store additional information that can be used to query data | [optional] 
**mode** | **str** | format wide or long | [optional] 
**with_raw_data** | **bool** | export also raw_data | [optional] 

## Example

```python
from openapi_client.models.data_search_dto import DataSearchDTO

# TODO update the JSON string below
json = "{}"
# create an instance of DataSearchDTO from a JSON string
data_search_dto_instance = DataSearchDTO.from_json(json)
# print the JSON string representation of the object
print(DataSearchDTO.to_json())

# convert the object into a dict
data_search_dto_dict = data_search_dto_instance.to_dict()
# create an instance of DataSearchDTO from a dict
data_search_dto_from_dict = DataSearchDTO.from_dict(data_search_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


