# InterestEntityUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | 
**name** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**exact_match** | **List[str]** |  | [optional] 
**close_match** | **List[str]** |  | [optional] 
**broad_match** | **List[str]** |  | [optional] 
**narrow_match** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.interest_entity_update_dto import InterestEntityUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of InterestEntityUpdateDTO from a JSON string
interest_entity_update_dto_instance = InterestEntityUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(InterestEntityUpdateDTO.to_json())

# convert the object into a dict
interest_entity_update_dto_dict = interest_entity_update_dto_instance.to_dict()
# create an instance of InterestEntityUpdateDTO from a dict
interest_entity_update_dto_from_dict = InterestEntityUpdateDTO.from_dict(interest_entity_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


