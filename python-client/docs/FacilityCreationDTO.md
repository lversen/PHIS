# FacilityCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**organizations** | **List[str]** |  | [optional] 
**sites** | **List[str]** |  | [optional] 
**address** | [**FacilityAddressDTO**](FacilityAddressDTO.md) |  | [optional] 
**variable_groups** | **List[str]** |  | [optional] 
**geometry** | [**GeoJsonObject**](GeoJsonObject.md) |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**relations** | [**List[RDFObjectRelationDTO]**](RDFObjectRelationDTO.md) |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.facility_creation_dto import FacilityCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of FacilityCreationDTO from a JSON string
facility_creation_dto_instance = FacilityCreationDTO.from_json(json)
# print the JSON string representation of the object
print(FacilityCreationDTO.to_json())

# convert the object into a dict
facility_creation_dto_dict = facility_creation_dto_instance.to_dict()
# create an instance of FacilityCreationDTO from a dict
facility_creation_dto_from_dict = FacilityCreationDTO.from_dict(facility_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


