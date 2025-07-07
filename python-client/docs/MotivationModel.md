# MotivationModel


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**publisher** | **str** |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_update_date** | **datetime** |  | [optional] 
**relations** | [**List[SPARQLModelRelation]**](SPARQLModelRelation.md) |  | [optional] 
**name** | **str** |  | [optional] 
**type** | **str** |  | [optional] 
**type_label** | [**SPARQLLabel**](SPARQLLabel.md) |  | [optional] 

## Example

```python
from openapi_client.models.motivation_model import MotivationModel

# TODO update the JSON string below
json = "{}"
# create an instance of MotivationModel from a JSON string
motivation_model_instance = MotivationModel.from_json(json)
# print the JSON string representation of the object
print(MotivationModel.to_json())

# convert the object into a dict
motivation_model_dict = motivation_model_instance.to_dict()
# create an instance of MotivationModel from a dict
motivation_model_from_dict = MotivationModel.from_dict(motivation_model_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


