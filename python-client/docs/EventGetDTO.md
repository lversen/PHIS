# EventGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Event URI | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**rdf_type** | **str** | Event type URI | [optional] 
**rdf_type_name** | **str** | Event type name | [optional] 
**start** | **str** | Beginning of the event | [optional] 
**end** | **str** | End of the event | [optional] 
**is_instant** | **bool** | Indicate if the event is instant | [optional] 
**description** | **str** | Description of the event | [optional] 
**targets** | **List[str]** | URI(s) of items concerned by this event | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.event_get_dto import EventGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of EventGetDTO from a JSON string
event_get_dto_instance = EventGetDTO.from_json(json)
# print the JSON string representation of the object
print(EventGetDTO.to_json())

# convert the object into a dict
event_get_dto_dict = event_get_dto_instance.to_dict()
# create an instance of EventGetDTO from a dict
event_get_dto_from_dict = EventGetDTO.from_dict(event_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


