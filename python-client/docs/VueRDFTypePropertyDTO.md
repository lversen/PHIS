# VueRDFTypePropertyDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**comment** | **str** |  | [optional] 
**inherited** | **bool** |  | [optional] 
**target_property** | **str** |  | [optional] 
**input_component** | **str** |  | [optional] 
**input_components_by_property** | **Dict[str, str]** |  | [optional] 
**view_component** | **str** |  | [optional] 
**is_list** | **bool** |  | [optional] 
**is_required** | **bool** |  | [optional] 
**is_custom** | **bool** |  | [optional] 

## Example

```python
from openapi_client.models.vue_rdf_type_property_dto import VueRDFTypePropertyDTO

# TODO update the JSON string below
json = "{}"
# create an instance of VueRDFTypePropertyDTO from a JSON string
vue_rdf_type_property_dto_instance = VueRDFTypePropertyDTO.from_json(json)
# print the JSON string representation of the object
print(VueRDFTypePropertyDTO.to_json())

# convert the object into a dict
vue_rdf_type_property_dto_dict = vue_rdf_type_property_dto_instance.to_dict()
# create an instance of VueRDFTypePropertyDTO from a dict
vue_rdf_type_property_dto_from_dict = VueRDFTypePropertyDTO.from_dict(vue_rdf_type_property_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


