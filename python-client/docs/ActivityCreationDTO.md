# ActivityCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**rdf_type** | **str** | activity type defined in the ontology | [optional] 
**uri** | **str** | external uri of the activity or process | [optional] 
**start_date** | **str** | start date or datetime | [optional] 
**end_date** | **str** | end date or datetime | [optional] 
**timezone** | **str** | to specify if the offset is not in the dates and if the timezone is different from the default one | [optional] 
**settings** | **Dict[str, object]** | a key-value system to store process parameters | [optional] 

## Example

```python
from openapi_client.models.activity_creation_dto import ActivityCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ActivityCreationDTO from a JSON string
activity_creation_dto_instance = ActivityCreationDTO.from_json(json)
# print the JSON string representation of the object
print(ActivityCreationDTO.to_json())

# convert the object into a dict
activity_creation_dto_dict = activity_creation_dto_instance.to_dict()
# create an instance of ActivityCreationDTO from a dict
activity_creation_dto_from_dict = ActivityCreationDTO.from_dict(activity_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


