# PositionGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**event** | **str** | Move event which update the position | [optional] 
**move_time** | **str** | Move time | [optional] 
**var_from** | [**FacilityNamedDTO**](FacilityNamedDTO.md) |  | [optional] 
**to** | [**FacilityNamedDTO**](FacilityNamedDTO.md) |  | [optional] 
**position** | [**PositionGetDetailDTO**](PositionGetDetailDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.position_get_dto import PositionGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of PositionGetDTO from a JSON string
position_get_dto_instance = PositionGetDTO.from_json(json)
# print the JSON string representation of the object
print(PositionGetDTO.to_json())

# convert the object into a dict
position_get_dto_dict = position_get_dto_instance.to_dict()
# create an instance of PositionGetDTO from a dict
position_get_dto_from_dict = PositionGetDTO.from_dict(position_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


