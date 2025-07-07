# RDFObjectRelationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**var_property** | **str** |  | [optional] 
**value** | **str** |  | [optional] 
**inverse** | **bool** |  | [optional] 

## Example

```python
from openapi_client.models.rdf_object_relation_dto import RDFObjectRelationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of RDFObjectRelationDTO from a JSON string
rdf_object_relation_dto_instance = RDFObjectRelationDTO.from_json(json)
# print the JSON string representation of the object
print(RDFObjectRelationDTO.to_json())

# convert the object into a dict
rdf_object_relation_dto_dict = rdf_object_relation_dto_instance.to_dict()
# create an instance of RDFObjectRelationDTO from a dict
rdf_object_relation_dto_from_dict = RDFObjectRelationDTO.from_dict(rdf_object_relation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


