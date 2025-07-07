# UnitUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | 
**name** | **str** |  | 
**description** | **str** |  | [optional] 
**symbol** | **str** |  | [optional] 
**alternative_symbol** | **str** |  | [optional] 
**exact_match** | **List[str]** |  | [optional] 
**close_match** | **List[str]** |  | [optional] 
**broad_match** | **List[str]** |  | [optional] 
**narrow_match** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.unit_update_dto import UnitUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of UnitUpdateDTO from a JSON string
unit_update_dto_instance = UnitUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(UnitUpdateDTO.to_json())

# convert the object into a dict
unit_update_dto_dict = unit_update_dto_instance.to_dict()
# create an instance of UnitUpdateDTO from a dict
unit_update_dto_from_dict = UnitUpdateDTO.from_dict(unit_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


