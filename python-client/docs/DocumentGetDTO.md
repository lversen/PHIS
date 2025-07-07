# DocumentGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**identifier** | **str** |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**title** | **str** |  | [optional] 
**var_date** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**targets** | **List[str]** |  | [optional] 
**authors** | **List[str]** |  | [optional] 
**language** | **str** |  | [optional] 
**format** | **str** |  | [optional] 
**keywords** | **List[str]** |  | [optional] 
**deprecated** | **bool** |  | [optional] 
**source** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.document_get_dto import DocumentGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of DocumentGetDTO from a JSON string
document_get_dto_instance = DocumentGetDTO.from_json(json)
# print the JSON string representation of the object
print(DocumentGetDTO.to_json())

# convert the object into a dict
document_get_dto_dict = document_get_dto_instance.to_dict()
# create an instance of DocumentGetDTO from a dict
document_get_dto_from_dict = DocumentGetDTO.from_dict(document_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


