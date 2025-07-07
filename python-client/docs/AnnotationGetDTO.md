# AnnotationGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Annotation URI | [optional] 
**description** | **str** | Content of the annotation | [optional] 
**targets** | **List[str]** |  | [optional] 
**motivation** | [**MotivationGetDTO**](MotivationGetDTO.md) |  | [optional] 
**published** | **datetime** |  | [optional] 
**publisher** | **str** | Annotation publisher URI | [optional] 

## Example

```python
from openapi_client.models.annotation_get_dto import AnnotationGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of AnnotationGetDTO from a JSON string
annotation_get_dto_instance = AnnotationGetDTO.from_json(json)
# print the JSON string representation of the object
print(AnnotationGetDTO.to_json())

# convert the object into a dict
annotation_get_dto_dict = annotation_get_dto_instance.to_dict()
# create an instance of AnnotationGetDTO from a dict
annotation_get_dto_from_dict = AnnotationGetDTO.from_dict(annotation_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


