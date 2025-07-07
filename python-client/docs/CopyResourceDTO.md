# CopyResourceDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uris** | **List[str]** |  | [optional] 
**shared_resource_instance** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.copy_resource_dto import CopyResourceDTO

# TODO update the JSON string below
json = "{}"
# create an instance of CopyResourceDTO from a JSON string
copy_resource_dto_instance = CopyResourceDTO.from_json(json)
# print the JSON string representation of the object
print(CopyResourceDTO.to_json())

# convert the object into a dict
copy_resource_dto_dict = copy_resource_dto_instance.to_dict()
# create an instance of CopyResourceDTO from a dict
copy_resource_dto_from_dict = CopyResourceDTO.from_dict(copy_resource_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


