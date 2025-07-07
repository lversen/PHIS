# EntityDetailsDTO


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
from openapi_client.models.entity_details_dto import EntityDetailsDTO

# TODO update the JSON string below
json = "{}"
# create an instance of EntityDetailsDTO from a JSON string
entity_details_dto_instance = EntityDetailsDTO.from_json(json)
# print the JSON string representation of the object
print(EntityDetailsDTO.to_json())

# convert the object into a dict
entity_details_dto_dict = entity_details_dto_instance.to_dict()
# create an instance of EntityDetailsDTO from a dict
entity_details_dto_from_dict = EntityDetailsDTO.from_dict(entity_details_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


