# ResourceTreeDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**parent** | **str** |  | [optional] 
**selected** | **bool** |  | [optional] 
**disabled** | **bool** |  | [optional] 
**children** | [**List[ResourceTreeDTO]**](ResourceTreeDTO.md) |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.resource_tree_dto import ResourceTreeDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ResourceTreeDTO from a JSON string
resource_tree_dto_instance = ResourceTreeDTO.from_json(json)
# print the JSON string representation of the object
print(ResourceTreeDTO.to_json())

# convert the object into a dict
resource_tree_dto_dict = resource_tree_dto_instance.to_dict()
# create an instance of ResourceTreeDTO from a dict
resource_tree_dto_from_dict = ResourceTreeDTO.from_dict(resource_tree_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


