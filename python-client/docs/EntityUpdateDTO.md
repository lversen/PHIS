# EntityUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | 
**name** | **str** |  | 
**description** | **str** |  | [optional] 
**exact_match** | **List[str]** |  | [optional] 
**close_match** | **List[str]** |  | [optional] 
**broad_match** | **List[str]** |  | [optional] 
**narrow_match** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.entity_update_dto import EntityUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of EntityUpdateDTO from a JSON string
entity_update_dto_instance = EntityUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(EntityUpdateDTO.to_json())

# convert the object into a dict
entity_update_dto_dict = entity_update_dto_instance.to_dict()
# create an instance of EntityUpdateDTO from a dict
entity_update_dto_from_dict = EntityUpdateDTO.from_dict(entity_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


