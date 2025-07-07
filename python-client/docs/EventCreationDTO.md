# EventCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**rdf_type** | **str** | Event type URI | [optional] 
**start** | **str** |  | [optional] 
**end** | **str** |  | [optional] 
**is_instant** | **bool** | Indicate if the event is instant | 
**description** | **str** |  | [optional] 
**targets** | **List[str]** | URI(s) of items concerned by this event | 
**relations** | [**List[RDFObjectRelationDTO]**](RDFObjectRelationDTO.md) |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.event_creation_dto import EventCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of EventCreationDTO from a JSON string
event_creation_dto_instance = EventCreationDTO.from_json(json)
# print the JSON string representation of the object
print(EventCreationDTO.to_json())

# convert the object into a dict
event_creation_dto_dict = event_creation_dto_instance.to_dict()
# create an instance of EventCreationDTO from a dict
event_creation_dto_from_dict = EventCreationDTO.from_dict(event_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


