# EntityGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.entity_get_dto import EntityGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of EntityGetDTO from a JSON string
entity_get_dto_instance = EntityGetDTO.from_json(json)
# print the JSON string representation of the object
print(EntityGetDTO.to_json())

# convert the object into a dict
entity_get_dto_dict = entity_get_dto_instance.to_dict()
# create an instance of EntityGetDTO from a dict
entity_get_dto_from_dict = EntityGetDTO.from_dict(entity_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


