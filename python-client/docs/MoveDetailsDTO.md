# MoveDetailsDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Event URI | [optional] 
**rdf_type** | **str** | Event type URI | [optional] 
**rdf_type_name** | **str** | Event type name | [optional] 
**start** | **str** | Beginning of the event | [optional] 
**end** | **str** | End of the event | [optional] 
**is_instant** | **bool** | Indicate if the event is instant | [optional] 
**description** | **str** | Description of the move | [optional] 
**targets** | **List[str]** | URI(s) of items concerned by this event | [optional] 
**relations** | [**List[RDFObjectRelationDTO]**](RDFObjectRelationDTO.md) |  | [optional] 
**var_from** | [**FacilityNamedDTO**](FacilityNamedDTO.md) |  | [optional] 
**to** | [**FacilityNamedDTO**](FacilityNamedDTO.md) |  | [optional] 
**targets_positions** | [**List[TargetPositionGetDTO]**](TargetPositionGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.move_details_dto import MoveDetailsDTO

# TODO update the JSON string below
json = "{}"
# create an instance of MoveDetailsDTO from a JSON string
move_details_dto_instance = MoveDetailsDTO.from_json(json)
# print the JSON string representation of the object
print(MoveDetailsDTO.to_json())

# convert the object into a dict
move_details_dto_dict = move_details_dto_instance.to_dict()
# create an instance of MoveDetailsDTO from a dict
move_details_dto_from_dict = MoveDetailsDTO.from_dict(move_details_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


