# NamedResourceDTO


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
from openapi_client.models.named_resource_dto import NamedResourceDTO

# TODO update the JSON string below
json = "{}"
# create an instance of NamedResourceDTO from a JSON string
named_resource_dto_instance = NamedResourceDTO.from_json(json)
# print the JSON string representation of the object
print(NamedResourceDTO.to_json())

# convert the object into a dict
named_resource_dto_dict = named_resource_dto_instance.to_dict()
# create an instance of NamedResourceDTO from a dict
named_resource_dto_from_dict = NamedResourceDTO.from_dict(named_resource_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


