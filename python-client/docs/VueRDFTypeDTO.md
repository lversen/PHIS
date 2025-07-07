# VueRDFTypeDTO


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
**icon** | **str** |  | [optional] 
**name_translations** | **Dict[str, str]** |  | [optional] 
**comment_translations** | **Dict[str, str]** |  | [optional] 
**is_abstract** | **bool** |  | [optional] 
**data_properties** | [**List[VueRDFTypePropertyDTO]**](VueRDFTypePropertyDTO.md) |  | [optional] 
**object_properties** | [**List[VueRDFTypePropertyDTO]**](VueRDFTypePropertyDTO.md) |  | [optional] 
**properties_order** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.vue_rdf_type_dto import VueRDFTypeDTO

# TODO update the JSON string below
json = "{}"
# create an instance of VueRDFTypeDTO from a JSON string
vue_rdf_type_dto_instance = VueRDFTypeDTO.from_json(json)
# print the JSON string representation of the object
print(VueRDFTypeDTO.to_json())

# convert the object into a dict
vue_rdf_type_dto_dict = vue_rdf_type_dto_instance.to_dict()
# create an instance of VueRDFTypeDTO from a dict
vue_rdf_type_dto_from_dict = VueRDFTypeDTO.from_dict(vue_rdf_type_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


