# DataSimpleProvenanceGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.data_simple_provenance_get_dto import DataSimpleProvenanceGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of DataSimpleProvenanceGetDTO from a JSON string
data_simple_provenance_get_dto_instance = DataSimpleProvenanceGetDTO.from_json(json)
# print the JSON string representation of the object
print(DataSimpleProvenanceGetDTO.to_json())

# convert the object into a dict
data_simple_provenance_get_dto_dict = data_simple_provenance_get_dto_instance.to_dict()
# create an instance of DataSimpleProvenanceGetDTO from a dict
data_simple_provenance_get_dto_from_dict = DataSimpleProvenanceGetDTO.from_dict(data_simple_provenance_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


