# ProjectCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**name** | **str** |  | 
**shortname** | **str** |  | [optional] 
**start_date** | **date** |  | 
**end_date** | **date** |  | [optional] 
**description** | **str** |  | [optional] 
**objective** | **str** |  | [optional] 
**financial_funding** | **str** |  | [optional] 
**website** | **str** |  | [optional] 
**related_projects** | **List[str]** |  | [optional] 
**coordinators** | **List[str]** |  | [optional] 
**scientific_contacts** | **List[str]** |  | [optional] 
**administrative_contacts** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.project_creation_dto import ProjectCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ProjectCreationDTO from a JSON string
project_creation_dto_instance = ProjectCreationDTO.from_json(json)
# print the JSON string representation of the object
print(ProjectCreationDTO.to_json())

# convert the object into a dict
project_creation_dto_dict = project_creation_dto_instance.to_dict()
# create an instance of ProjectCreationDTO from a dict
project_creation_dto_from_dict = ProjectCreationDTO.from_dict(project_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


