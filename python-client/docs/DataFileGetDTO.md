# DataFileGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | 
**rdf_type** | **str** | file type | 
**var_date** | **str** | date or datetime | [optional] 
**timezone** | **str** | to specify if the offset is not in the date and if the timezone is different from the default one | [optional] 
**target** | **str** | target URI on which the data have been collected | [optional] 
**provenance** | [**DataProvenanceModel**](DataProvenanceModel.md) |  | 
**metadata** | **Dict[str, object]** | key-value system to store additional information that can be used to query data | [optional] 
**archive** | **str** | archive file URI if file is inside | [optional] 
**filename** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**issued** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.data_file_get_dto import DataFileGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of DataFileGetDTO from a JSON string
data_file_get_dto_instance = DataFileGetDTO.from_json(json)
# print the JSON string representation of the object
print(DataFileGetDTO.to_json())

# convert the object into a dict
data_file_get_dto_dict = data_file_get_dto_instance.to_dict()
# create an instance of DataFileGetDTO from a dict
data_file_get_dto_from_dict = DataFileGetDTO.from_dict(data_file_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


