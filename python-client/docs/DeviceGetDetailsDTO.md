# DeviceGetDetailsDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**rdf_type** | **str** | rdfType URI | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**name** | **str** | Device name | 
**brand** | **str** | Device brand | [optional] 
**constructor_model** | **str** | Device model | [optional] 
**serial_number** | **str** | Device serial number | [optional] 
**person_in_charge** | **str** | Person in charge | [optional] 
**start_up** | **date** | Device date of start-up | [optional] 
**removal** | **date** | Device date of removal | [optional] 
**relations** | [**List[RDFObjectRelationDTO]**](RDFObjectRelationDTO.md) |  | [optional] 
**description** | **str** | comment | [optional] 
**metadata** | **Dict[str, str]** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.device_get_details_dto import DeviceGetDetailsDTO

# TODO update the JSON string below
json = "{}"
# create an instance of DeviceGetDetailsDTO from a JSON string
device_get_details_dto_instance = DeviceGetDetailsDTO.from_json(json)
# print the JSON string representation of the object
print(DeviceGetDetailsDTO.to_json())

# convert the object into a dict
device_get_details_dto_dict = device_get_details_dto_instance.to_dict()
# create an instance of DeviceGetDetailsDTO from a dict
device_get_details_dto_from_dict = DeviceGetDetailsDTO.from_dict(device_get_details_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


