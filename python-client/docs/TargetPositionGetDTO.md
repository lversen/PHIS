# TargetPositionGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**target** | **str** |  | [optional] 
**position** | [**PositionGetDetailDTO**](PositionGetDetailDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.target_position_get_dto import TargetPositionGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of TargetPositionGetDTO from a JSON string
target_position_get_dto_instance = TargetPositionGetDTO.from_json(json)
# print the JSON string representation of the object
print(TargetPositionGetDTO.to_json())

# convert the object into a dict
target_position_get_dto_dict = target_position_get_dto_instance.to_dict()
# create an instance of TargetPositionGetDTO from a dict
target_position_get_dto_from_dict = TargetPositionGetDTO.from_dict(target_position_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


