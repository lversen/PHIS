# MotivationGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | URI of the motivation | [optional] 
**name** | **str** | Name of the annotation motivation | [optional] 

## Example

```python
from openapi_client.models.motivation_get_dto import MotivationGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of MotivationGetDTO from a JSON string
motivation_get_dto_instance = MotivationGetDTO.from_json(json)
# print the JSON string representation of the object
print(MotivationGetDTO.to_json())

# convert the object into a dict
motivation_get_dto_dict = motivation_get_dto_instance.to_dict()
# create an instance of MotivationGetDTO from a dict
motivation_get_dto_from_dict = MotivationGetDTO.from_dict(motivation_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


