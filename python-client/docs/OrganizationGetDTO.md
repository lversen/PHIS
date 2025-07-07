# OrganizationGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**name** | **str** |  | [optional] 
**parents** | [**List[NamedResourceDTOOrganizationModel]**](NamedResourceDTOOrganizationModel.md) |  | [optional] 
**children** | [**List[NamedResourceDTOOrganizationModel]**](NamedResourceDTOOrganizationModel.md) |  | [optional] 
**groups** | [**List[NamedResourceDTOGroupModel]**](NamedResourceDTOGroupModel.md) |  | [optional] 
**facilities** | [**List[NamedResourceDTOFacilityModel]**](NamedResourceDTOFacilityModel.md) |  | [optional] 
**sites** | [**List[NamedResourceDTOSiteModel]**](NamedResourceDTOSiteModel.md) |  | [optional] 
**experiments** | [**List[NamedResourceDTOExperimentModel]**](NamedResourceDTOExperimentModel.md) |  | [optional] 

## Example

```python
from openapi_client.models.organization_get_dto import OrganizationGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of OrganizationGetDTO from a JSON string
organization_get_dto_instance = OrganizationGetDTO.from_json(json)
# print the JSON string representation of the object
print(OrganizationGetDTO.to_json())

# convert the object into a dict
organization_get_dto_dict = organization_get_dto_instance.to_dict()
# create an instance of OrganizationGetDTO from a dict
organization_get_dto_from_dict = OrganizationGetDTO.from_dict(organization_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


