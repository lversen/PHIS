# NamedResourceDTOGroupModel


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.named_resource_dto_group_model import NamedResourceDTOGroupModel

# TODO update the JSON string below
json = "{}"
# create an instance of NamedResourceDTOGroupModel from a JSON string
named_resource_dto_group_model_instance = NamedResourceDTOGroupModel.from_json(json)
# print the JSON string representation of the object
print(NamedResourceDTOGroupModel.to_json())

# convert the object into a dict
named_resource_dto_group_model_dict = named_resource_dto_group_model_instance.to_dict()
# create an instance of NamedResourceDTOGroupModel from a dict
named_resource_dto_group_model_from_dict = NamedResourceDTOGroupModel.from_dict(named_resource_dto_group_model_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


