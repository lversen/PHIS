# SharedResourceInstanceDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**api_url** | **str** |  | [optional] 
**label** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.shared_resource_instance_dto import SharedResourceInstanceDTO

# TODO update the JSON string below
json = "{}"
# create an instance of SharedResourceInstanceDTO from a JSON string
shared_resource_instance_dto_instance = SharedResourceInstanceDTO.from_json(json)
# print the JSON string representation of the object
print(SharedResourceInstanceDTO.to_json())

# convert the object into a dict
shared_resource_instance_dto_dict = shared_resource_instance_dto_instance.to_dict()
# create an instance of SharedResourceInstanceDTO from a dict
shared_resource_instance_dto_from_dict = SharedResourceInstanceDTO.from_dict(shared_resource_instance_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


