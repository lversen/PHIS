# InterestEntityCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**exact_match** | **List[str]** |  | [optional] 
**close_match** | **List[str]** |  | [optional] 
**broad_match** | **List[str]** |  | [optional] 
**narrow_match** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.interest_entity_creation_dto import InterestEntityCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of InterestEntityCreationDTO from a JSON string
interest_entity_creation_dto_instance = InterestEntityCreationDTO.from_json(json)
# print the JSON string representation of the object
print(InterestEntityCreationDTO.to_json())

# convert the object into a dict
interest_entity_creation_dto_dict = interest_entity_creation_dto_instance.to_dict()
# create an instance of InterestEntityCreationDTO from a dict
interest_entity_creation_dto_from_dict = InterestEntityCreationDTO.from_dict(interest_entity_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


