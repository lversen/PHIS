# ExperimentGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**name** | **str** |  | [optional] 
**start_date** | **date** |  | 
**end_date** | **date** |  | [optional] 
**description** | **str** |  | [optional] 
**objective** | **str** |  | [optional] 
**species** | **List[str]** |  | [optional] 
**factors** | **List[str]** |  | [optional] 
**organisations** | [**List[NamedResourceDTOOrganizationModel]**](NamedResourceDTOOrganizationModel.md) |  | [optional] 
**facilities** | [**List[NamedResourceDTOFacilityModel]**](NamedResourceDTOFacilityModel.md) |  | [optional] 
**projects** | [**List[NamedResourceDTOProjectModel]**](NamedResourceDTOProjectModel.md) |  | [optional] 
**scientific_supervisors** | **List[str]** |  | [optional] 
**technical_supervisors** | **List[str]** |  | [optional] 
**groups** | **List[str]** |  | [optional] 
**is_public** | **bool** |  | [optional] 

## Example

```python
from openapi_client.models.experiment_get_dto import ExperimentGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ExperimentGetDTO from a JSON string
experiment_get_dto_instance = ExperimentGetDTO.from_json(json)
# print the JSON string representation of the object
print(ExperimentGetDTO.to_json())

# convert the object into a dict
experiment_get_dto_dict = experiment_get_dto_instance.to_dict()
# create an instance of ExperimentGetDTO from a dict
experiment_get_dto_from_dict = ExperimentGetDTO.from_dict(experiment_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


