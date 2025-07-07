# OrganizationCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**parents** | **List[str]** |  | [optional] 
**groups** | **List[str]** |  | [optional] 
**facilities** | **List[str]** |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.organization_creation_dto import OrganizationCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of OrganizationCreationDTO from a JSON string
organization_creation_dto_instance = OrganizationCreationDTO.from_json(json)
# print the JSON string representation of the object
print(OrganizationCreationDTO.to_json())

# convert the object into a dict
organization_creation_dto_dict = organization_creation_dto_instance.to_dict()
# create an instance of OrganizationCreationDTO from a dict
organization_creation_dto_from_dict = OrganizationCreationDTO.from_dict(organization_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


