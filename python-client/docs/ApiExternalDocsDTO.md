# ApiExternalDocsDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**description** | **str** | Opensilex api docs | [optional] 
**url** | **str** | https://github.com/OpenSILEX/opensilex/blob/master/opensilex-doc/src/main/resources/index.md | [optional] 

## Example

```python
from openapi_client.models.api_external_docs_dto import ApiExternalDocsDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ApiExternalDocsDTO from a JSON string
api_external_docs_dto_instance = ApiExternalDocsDTO.from_json(json)
# print the JSON string representation of the object
print(ApiExternalDocsDTO.to_json())

# convert the object into a dict
api_external_docs_dto_dict = api_external_docs_dto_instance.to_dict()
# create an instance of ApiExternalDocsDTO from a dict
api_external_docs_dto_from_dict = ApiExternalDocsDTO.from_dict(api_external_docs_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


