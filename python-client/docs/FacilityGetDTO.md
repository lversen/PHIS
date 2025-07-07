# FacilityGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**organizations** | [**List[NamedResourceDTOOrganizationModel]**](NamedResourceDTOOrganizationModel.md) |  | 
**sites** | [**List[NamedResourceDTOSiteModel]**](NamedResourceDTOSiteModel.md) |  | [optional] 
**address** | [**FacilityAddressDTO**](FacilityAddressDTO.md) |  | [optional] 
**variable_groups** | [**List[NamedResourceDTOVariablesGroupModel]**](NamedResourceDTOVariablesGroupModel.md) |  | [optional] 
**geometry** | [**GeoJsonObject**](GeoJsonObject.md) |  | [optional] 
**relations** | [**List[RDFObjectRelationDTO]**](RDFObjectRelationDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.facility_get_dto import FacilityGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of FacilityGetDTO from a JSON string
facility_get_dto_instance = FacilityGetDTO.from_json(json)
# print the JSON string representation of the object
print(FacilityGetDTO.to_json())

# convert the object into a dict
facility_get_dto_dict = facility_get_dto_instance.to_dict()
# create an instance of FacilityGetDTO from a dict
facility_get_dto_from_dict = FacilityGetDTO.from_dict(facility_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


