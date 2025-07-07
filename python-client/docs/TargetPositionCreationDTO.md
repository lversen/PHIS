# TargetPositionCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**target** | **str** |  | 
**position** | [**PositionCreationDTO**](PositionCreationDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.target_position_creation_dto import TargetPositionCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of TargetPositionCreationDTO from a JSON string
target_position_creation_dto_instance = TargetPositionCreationDTO.from_json(json)
# print the JSON string representation of the object
print(TargetPositionCreationDTO.to_json())

# convert the object into a dict
target_position_creation_dto_dict = target_position_creation_dto_instance.to_dict()
# create an instance of TargetPositionCreationDTO from a dict
target_position_creation_dto_from_dict = TargetPositionCreationDTO.from_dict(target_position_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


