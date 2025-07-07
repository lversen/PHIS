# URITypesDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**rdf_types** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.uri_types_dto import URITypesDTO

# TODO update the JSON string below
json = "{}"
# create an instance of URITypesDTO from a JSON string
uri_types_dto_instance = URITypesDTO.from_json(json)
# print the JSON string representation of the object
print(URITypesDTO.to_json())

# convert the object into a dict
uri_types_dto_dict = uri_types_dto_instance.to_dict()
# create an instance of URITypesDTO from a dict
uri_types_dto_from_dict = URITypesDTO.from_dict(uri_types_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


