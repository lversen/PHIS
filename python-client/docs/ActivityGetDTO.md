# ActivityGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**rdf_type** | **str** | activity type defined in the ontology | [optional] 
**uri** | **str** | external uri of the activity or process | [optional] 
**start_date** | **str** | start date or datetime | [optional] 
**end_date** | **str** | end date or datetime | [optional] 
**settings** | **Dict[str, object]** | a key-value system to store process parameters | [optional] 

## Example

```python
from openapi_client.models.activity_get_dto import ActivityGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ActivityGetDTO from a JSON string
activity_get_dto_instance = ActivityGetDTO.from_json(json)
# print the JSON string representation of the object
print(ActivityGetDTO.to_json())

# convert the object into a dict
activity_get_dto_dict = activity_get_dto_instance.to_dict()
# create an instance of ActivityGetDTO from a dict
activity_get_dto_from_dict = ActivityGetDTO.from_dict(activity_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


