# RDFTypeDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**comment** | **str** |  | [optional] 
**parent** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.rdf_type_dto import RDFTypeDTO

# TODO update the JSON string below
json = "{}"
# create an instance of RDFTypeDTO from a JSON string
rdf_type_dto_instance = RDFTypeDTO.from_json(json)
# print the JSON string representation of the object
print(RDFTypeDTO.to_json())

# convert the object into a dict
rdf_type_dto_dict = rdf_type_dto_instance.to_dict()
# create an instance of RDFTypeDTO from a dict
rdf_type_dto_from_dict = RDFTypeDTO.from_dict(rdf_type_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


