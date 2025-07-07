# VueObjectTypeDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**short_uri** | **str** |  | [optional] [readonly] 
**input_component** | **str** |  | [optional] 
**input_components_by_property** | **Dict[str, str]** |  | [optional] 
**view_component** | **str** |  | [optional] 
**rdf_type** | [**RDFTypeTranslatedDTO**](RDFTypeTranslatedDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.vue_object_type_dto import VueObjectTypeDTO

# TODO update the JSON string below
json = "{}"
# create an instance of VueObjectTypeDTO from a JSON string
vue_object_type_dto_instance = VueObjectTypeDTO.from_json(json)
# print the JSON string representation of the object
print(VueObjectTypeDTO.to_json())

# convert the object into a dict
vue_object_type_dto_dict = vue_object_type_dto_instance.to_dict()
# create an instance of VueObjectTypeDTO from a dict
vue_object_type_dto_from_dict = VueObjectTypeDTO.from_dict(vue_object_type_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


