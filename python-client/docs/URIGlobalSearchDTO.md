# URIGlobalSearchDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**context** | **str** |  | [optional] 
**var_property** | **bool** |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**rdfs_comment** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **str** |  | [optional] 
**last_updated_date** | **str** |  | [optional] 
**super_types** | [**URITypesDTO**](URITypesDTO.md) |  | [optional] 
**data_dto** | [**DataGetSearchDTO**](DataGetSearchDTO.md) |  | [optional] 
**datafile_dto** | [**DataFileGetDTO**](DataFileGetDTO.md) |  | [optional] 
**root_class** | **str** |  | [optional] 
**is_property** | **bool** |  | [optional] 
**factor_uri** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.uri_global_search_dto import URIGlobalSearchDTO

# TODO update the JSON string below
json = "{}"
# create an instance of URIGlobalSearchDTO from a JSON string
uri_global_search_dto_instance = URIGlobalSearchDTO.from_json(json)
# print the JSON string representation of the object
print(URIGlobalSearchDTO.to_json())

# convert the object into a dict
uri_global_search_dto_dict = uri_global_search_dto_instance.to_dict()
# create an instance of URIGlobalSearchDTO from a dict
uri_global_search_dto_from_dict = URIGlobalSearchDTO.from_dict(uri_global_search_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


