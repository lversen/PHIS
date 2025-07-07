# ScientificObjectUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Scientific object URI | 
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
from openapi_client.models.scientific_object_update_dto import ScientificObjectUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ScientificObjectUpdateDTO from a JSON string
scientific_object_update_dto_instance = ScientificObjectUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(ScientificObjectUpdateDTO.to_json())

# convert the object into a dict
scientific_object_update_dto_dict = scientific_object_update_dto_instance.to_dict()
# create an instance of ScientificObjectUpdateDTO from a dict
scientific_object_update_dto_from_dict = ScientificObjectUpdateDTO.from_dict(scientific_object_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


