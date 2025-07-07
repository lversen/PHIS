# ExperimentCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | 
**start_date** | **date** |  | 
**end_date** | **date** |  | [optional] 
**description** | **str** |  | [optional] 
**objective** | **str** |  | 
**organisations** | **List[str]** |  | [optional] 
**facilities** | **List[str]** |  | [optional] 
**projects** | **List[str]** |  | [optional] 
**scientific_supervisors** | **List[str]** |  | [optional] 
**technical_supervisors** | **List[str]** |  | [optional] 
**groups** | **List[str]** |  | [optional] 
**factors** | **List[str]** |  | [optional] 
**is_public** | **bool** |  | [optional] 

## Example

```python
from openapi_client.models.experiment_creation_dto import ExperimentCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ExperimentCreationDTO from a JSON string
experiment_creation_dto_instance = ExperimentCreationDTO.from_json(json)
# print the JSON string representation of the object
print(ExperimentCreationDTO.to_json())

# convert the object into a dict
experiment_creation_dto_dict = experiment_creation_dto_instance.to_dict()
# create an instance of ExperimentCreationDTO from a dict
experiment_creation_dto_from_dict = ExperimentCreationDTO.from_dict(experiment_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


