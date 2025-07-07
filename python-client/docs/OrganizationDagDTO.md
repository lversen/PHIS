# OrganizationDagDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**parents** | **List[str]** |  | [optional] 
**children** | **List[str]** |  | [optional] 
**facilities** | [**List[NamedResourceDTO]**](NamedResourceDTO.md) |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.organization_dag_dto import OrganizationDagDTO

# TODO update the JSON string below
json = "{}"
# create an instance of OrganizationDagDTO from a JSON string
organization_dag_dto_instance = OrganizationDagDTO.from_json(json)
# print the JSON string representation of the object
print(OrganizationDagDTO.to_json())

# convert the object into a dict
organization_dag_dto_dict = organization_dag_dto_instance.to_dict()
# create an instance of OrganizationDagDTO from a dict
organization_dag_dto_from_dict = OrganizationDagDTO.from_dict(organization_dag_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


