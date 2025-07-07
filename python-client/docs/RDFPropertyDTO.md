# RDFPropertyDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | URI of property | 
**domain** | **str** | Domain of the property : the rdf:type of any concept concerned by this property. | 
**range** | **str** | Range of the property : the rdf:type of any value(can be a literal type or a concept type) concerned by this property. | 
**parent** | **str** | Parent of the property. | [optional] 
**rdf_type** | **str** | The type of property | 
**name_translations** | **Dict[str, str]** | Name by languages, at least one name/language is required. Use &#39;&#39; as language if no language is specified | 
**comment_translations** | **Dict[str, str]** | Description by languages, at least one description/language is required. Use &#39;&#39; as language if no language is specified | 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.rdf_property_dto import RDFPropertyDTO

# TODO update the JSON string below
json = "{}"
# create an instance of RDFPropertyDTO from a JSON string
rdf_property_dto_instance = RDFPropertyDTO.from_json(json)
# print the JSON string representation of the object
print(RDFPropertyDTO.to_json())

# convert the object into a dict
rdf_property_dto_dict = rdf_property_dto_instance.to_dict()
# create an instance of RDFPropertyDTO from a dict
rdf_property_dto_from_dict = RDFPropertyDTO.from_dict(rdf_property_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


