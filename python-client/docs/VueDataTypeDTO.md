# VueDataTypeDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**short_uri** | **str** |  | [optional] [readonly] 
**input_component** | **str** |  | [optional] 
**view_component** | **str** |  | [optional] 
**label_key** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.vue_data_type_dto import VueDataTypeDTO

# TODO update the JSON string below
json = "{}"
# create an instance of VueDataTypeDTO from a JSON string
vue_data_type_dto_instance = VueDataTypeDTO.from_json(json)
# print the JSON string representation of the object
print(VueDataTypeDTO.to_json())

# convert the object into a dict
vue_data_type_dto_dict = vue_data_type_dto_instance.to_dict()
# create an instance of VueDataTypeDTO from a dict
vue_data_type_dto_from_dict = VueDataTypeDTO.from_dict(vue_data_type_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


