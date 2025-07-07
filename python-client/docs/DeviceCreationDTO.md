# DeviceCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Device URI | [optional] 
**rdf_type** | **str** | rdfType URI | 
**name** | **str** | Device name | 
**brand** | **str** |  | [optional] 
**constructor_model** | **str** |  | [optional] 
**serial_number** | **str** |  | [optional] 
**person_in_charge** | **str** | Person in charge | [optional] 
**start_up** | **date** |  | [optional] 
**removal** | **date** |  | [optional] 
**relations** | [**List[RDFObjectRelationDTO]**](RDFObjectRelationDTO.md) |  | [optional] 
**description** | **str** |  | [optional] 
**metadata** | **Dict[str, str]** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.device_creation_dto import DeviceCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of DeviceCreationDTO from a JSON string
device_creation_dto_instance = DeviceCreationDTO.from_json(json)
# print the JSON string representation of the object
print(DeviceCreationDTO.to_json())

# convert the object into a dict
device_creation_dto_dict = device_creation_dto_instance.to_dict()
# create an instance of DeviceCreationDTO from a dict
device_creation_dto_from_dict = DeviceCreationDTO.from_dict(device_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


