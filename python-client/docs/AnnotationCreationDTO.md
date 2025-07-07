# AnnotationCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**description** | **str** |  | 
**targets** | **List[str]** |  | 
**motivation** | **str** |  | 

## Example

```python
from openapi_client.models.annotation_creation_dto import AnnotationCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of AnnotationCreationDTO from a JSON string
annotation_creation_dto_instance = AnnotationCreationDTO.from_json(json)
# print the JSON string representation of the object
print(AnnotationCreationDTO.to_json())

# convert the object into a dict
annotation_creation_dto_dict = annotation_creation_dto_instance.to_dict()
# create an instance of AnnotationCreationDTO from a dict
annotation_creation_dto_from_dict = AnnotationCreationDTO.from_dict(annotation_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


