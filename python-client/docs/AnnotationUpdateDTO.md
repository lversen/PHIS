# AnnotationUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | 
**description** | **str** |  | 
**targets** | **List[str]** |  | 
**motivation** | **str** |  | 

## Example

```python
from openapi_client.models.annotation_update_dto import AnnotationUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of AnnotationUpdateDTO from a JSON string
annotation_update_dto_instance = AnnotationUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(AnnotationUpdateDTO.to_json())

# convert the object into a dict
annotation_update_dto_dict = annotation_update_dto_instance.to_dict()
# create an instance of AnnotationUpdateDTO from a dict
annotation_update_dto_from_dict = AnnotationUpdateDTO.from_dict(annotation_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


