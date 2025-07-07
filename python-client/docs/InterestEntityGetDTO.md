# InterestEntityGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.interest_entity_get_dto import InterestEntityGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of InterestEntityGetDTO from a JSON string
interest_entity_get_dto_instance = InterestEntityGetDTO.from_json(json)
# print the JSON string representation of the object
print(InterestEntityGetDTO.to_json())

# convert the object into a dict
interest_entity_get_dto_dict = interest_entity_get_dto_instance.to_dict()
# create an instance of InterestEntityGetDTO from a dict
interest_entity_get_dto_from_dict = InterestEntityGetDTO.from_dict(interest_entity_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


