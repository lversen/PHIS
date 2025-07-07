# UnitDetailsDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**symbol** | **str** |  | [optional] 
**alternative_symbol** | **str** |  | [optional] 
**exact_match** | **List[str]** |  | [optional] 
**close_match** | **List[str]** |  | [optional] 
**broad_match** | **List[str]** |  | [optional] 
**narrow_match** | **List[str]** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**from_shared_resource_instance** | [**SharedResourceInstanceDTO**](SharedResourceInstanceDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.unit_details_dto import UnitDetailsDTO

# TODO update the JSON string below
json = "{}"
# create an instance of UnitDetailsDTO from a JSON string
unit_details_dto_instance = UnitDetailsDTO.from_json(json)
# print the JSON string representation of the object
print(UnitDetailsDTO.to_json())

# convert the object into a dict
unit_details_dto_dict = unit_details_dto_instance.to_dict()
# create an instance of UnitDetailsDTO from a dict
unit_details_dto_from_dict = UnitDetailsDTO.from_dict(unit_details_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


