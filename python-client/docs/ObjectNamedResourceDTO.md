# ObjectNamedResourceDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.object_named_resource_dto import ObjectNamedResourceDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ObjectNamedResourceDTO from a JSON string
object_named_resource_dto_instance = ObjectNamedResourceDTO.from_json(json)
# print the JSON string representation of the object
print(ObjectNamedResourceDTO.to_json())

# convert the object into a dict
object_named_resource_dto_dict = object_named_resource_dto_instance.to_dict()
# create an instance of ObjectNamedResourceDTO from a dict
object_named_resource_dto_from_dict = ObjectNamedResourceDTO.from_dict(object_named_resource_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


