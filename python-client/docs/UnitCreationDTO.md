# UnitCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
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
from openapi_client.models.unit_creation_dto import UnitCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of UnitCreationDTO from a JSON string
unit_creation_dto_instance = UnitCreationDTO.from_json(json)
# print the JSON string representation of the object
print(UnitCreationDTO.to_json())

# convert the object into a dict
unit_creation_dto_dict = unit_creation_dto_instance.to_dict()
# create an instance of UnitCreationDTO from a dict
unit_creation_dto_from_dict = UnitCreationDTO.from_dict(unit_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


