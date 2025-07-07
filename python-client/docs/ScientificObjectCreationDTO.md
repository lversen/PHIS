# ScientificObjectCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Scientific object URI | [optional] 
**rdf_type** | **str** | Scientific object type | 
**name** | **str** | Scientific object name | 
**experiment** | **str** | Scientific object experiment URI | [optional] 
**relations** | [**List[RDFObjectRelationDTO]**](RDFObjectRelationDTO.md) |  | [optional] 
**geometry** | [**GeoJsonObject**](GeoJsonObject.md) |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.scientific_object_creation_dto import ScientificObjectCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ScientificObjectCreationDTO from a JSON string
scientific_object_creation_dto_instance = ScientificObjectCreationDTO.from_json(json)
# print the JSON string representation of the object
print(ScientificObjectCreationDTO.to_json())

# convert the object into a dict
scientific_object_creation_dto_dict = scientific_object_creation_dto_instance.to_dict()
# create an instance of ScientificObjectCreationDTO from a dict
scientific_object_creation_dto_from_dict = ScientificObjectCreationDTO.from_dict(scientific_object_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


