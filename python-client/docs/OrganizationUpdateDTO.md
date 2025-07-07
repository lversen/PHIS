# OrganizationUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | 
**rdf_type** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**parents** | **List[str]** |  | [optional] 
**groups** | **List[str]** |  | [optional] 
**facilities** | **List[str]** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.organization_update_dto import OrganizationUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of OrganizationUpdateDTO from a JSON string
organization_update_dto_instance = OrganizationUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(OrganizationUpdateDTO.to_json())

# convert the object into a dict
organization_update_dto_dict = organization_update_dto_instance.to_dict()
# create an instance of OrganizationUpdateDTO from a dict
organization_update_dto_from_dict = OrganizationUpdateDTO.from_dict(organization_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


