# ExperimentGetListDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**start_date** | **date** |  | [optional] 
**end_date** | **date** |  | [optional] 
**description** | **str** |  | [optional] 
**objective** | **str** |  | [optional] 
**species** | **List[str]** |  | [optional] 
**is_public** | **bool** |  | [optional] 
**facilities** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.experiment_get_list_dto import ExperimentGetListDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ExperimentGetListDTO from a JSON string
experiment_get_list_dto_instance = ExperimentGetListDTO.from_json(json)
# print the JSON string representation of the object
print(ExperimentGetListDTO.to_json())

# convert the object into a dict
experiment_get_list_dto_dict = experiment_get_list_dto_instance.to_dict()
# create an instance of ExperimentGetListDTO from a dict
experiment_get_list_dto_from_dict = ExperimentGetListDTO.from_dict(experiment_get_list_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


