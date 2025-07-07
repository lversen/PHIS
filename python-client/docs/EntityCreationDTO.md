# EntityCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | 
**description** | **str** |  | [optional] 
**exact_match** | **List[str]** |  | [optional] 
**close_match** | **List[str]** |  | [optional] 
**broad_match** | **List[str]** |  | [optional] 
**narrow_match** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.entity_creation_dto import EntityCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of EntityCreationDTO from a JSON string
entity_creation_dto_instance = EntityCreationDTO.from_json(json)
# print the JSON string representation of the object
print(EntityCreationDTO.to_json())

# convert the object into a dict
entity_creation_dto_dict = entity_creation_dto_instance.to_dict()
# create an instance of EntityCreationDTO from a dict
entity_creation_dto_from_dict = EntityCreationDTO.from_dict(entity_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


