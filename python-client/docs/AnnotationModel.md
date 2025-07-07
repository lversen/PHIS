# AnnotationModel


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**publisher** | **str** |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_update_date** | **datetime** |  | [optional] 
**relations** | [**List[SPARQLModelRelation]**](SPARQLModelRelation.md) |  | [optional] 
**description** | **str** |  | [optional] 
**motivation** | [**MotivationModel**](MotivationModel.md) |  | [optional] 
**targets** | **List[str]** |  | [optional] 
**type** | **str** |  | [optional] 
**type_label** | [**SPARQLLabel**](SPARQLLabel.md) |  | [optional] 

## Example

```python
from openapi_client.models.annotation_model import AnnotationModel

# TODO update the JSON string below
json = "{}"
# create an instance of AnnotationModel from a JSON string
annotation_model_instance = AnnotationModel.from_json(json)
# print the JSON string representation of the object
print(AnnotationModel.to_json())

# convert the object into a dict
annotation_model_dict = annotation_model_instance.to_dict()
# create an instance of AnnotationModel from a dict
annotation_model_from_dict = AnnotationModel.from_dict(annotation_model_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


