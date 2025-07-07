# ScientificObjectDetailDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**rdf_type** | **str** | Scientific object type | [optional] 
**rdf_type_name** | **str** | Scientific object type | [optional] 
**name** | **str** |  | [optional] 
**parent** | **str** | Scientific object parent URI | [optional] 
**parent_name** | **str** | Scientific object parent name | [optional] 
**factor_level** | [**List[NamedResourceDTOFactorLevelModel]**](NamedResourceDTOFactorLevelModel.md) | Scientific object factor levels | [optional] 
**relations** | [**List[RDFObjectRelationDTO]**](RDFObjectRelationDTO.md) |  | [optional] 
**geometry** | [**GeoJsonObject**](GeoJsonObject.md) |  | [optional] 

## Example

```python
from openapi_client.models.scientific_object_detail_dto import ScientificObjectDetailDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ScientificObjectDetailDTO from a JSON string
scientific_object_detail_dto_instance = ScientificObjectDetailDTO.from_json(json)
# print the JSON string representation of the object
print(ScientificObjectDetailDTO.to_json())

# convert the object into a dict
scientific_object_detail_dto_dict = scientific_object_detail_dto_instance.to_dict()
# create an instance of ScientificObjectDetailDTO from a dict
scientific_object_detail_dto_from_dict = ScientificObjectDetailDTO.from_dict(scientific_object_detail_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


