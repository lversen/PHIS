# InterestEntityDetailsDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**exact_match** | **List[str]** |  | [optional] 
**close_match** | **List[str]** |  | [optional] 
**broad_match** | **List[str]** |  | [optional] 
**narrow_match** | **List[str]** |  | [optional] 
**from_shared_resource_instance** | [**SharedResourceInstanceDTO**](SharedResourceInstanceDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.interest_entity_details_dto import InterestEntityDetailsDTO

# TODO update the JSON string below
json = "{}"
# create an instance of InterestEntityDetailsDTO from a JSON string
interest_entity_details_dto_instance = InterestEntityDetailsDTO.from_json(json)
# print the JSON string representation of the object
print(InterestEntityDetailsDTO.to_json())

# convert the object into a dict
interest_entity_details_dto_dict = interest_entity_details_dto_instance.to_dict()
# create an instance of InterestEntityDetailsDTO from a dict
interest_entity_details_dto_from_dict = InterestEntityDetailsDTO.from_dict(interest_entity_details_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


