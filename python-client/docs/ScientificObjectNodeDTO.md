# ScientificObjectNodeDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**geometry** | [**GeoJsonObject**](GeoJsonObject.md) |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**creation_date** | **date** | Scientific object creation date | [optional] 
**destruction_date** | **date** | Scientific object creation date | [optional] 

## Example

```python
from openapi_client.models.scientific_object_node_dto import ScientificObjectNodeDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ScientificObjectNodeDTO from a JSON string
scientific_object_node_dto_instance = ScientificObjectNodeDTO.from_json(json)
# print the JSON string representation of the object
print(ScientificObjectNodeDTO.to_json())

# convert the object into a dict
scientific_object_node_dto_dict = scientific_object_node_dto_instance.to_dict()
# create an instance of ScientificObjectNodeDTO from a dict
scientific_object_node_dto_from_dict = ScientificObjectNodeDTO.from_dict(scientific_object_node_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


