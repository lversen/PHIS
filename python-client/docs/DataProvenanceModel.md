# DataProvenanceModel


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | provenance uri | 
**prov_used** | [**List[ProvEntityModel]**](ProvEntityModel.md) | list of inputs of the process described in the provenance | [optional] 
**prov_was_associated_with** | [**List[ProvEntityModel]**](ProvEntityModel.md) | allow an activity to be linked to an agent | [optional] 
**settings** | **Dict[str, object]** | a key-value system to store specific information | [optional] 
**experiments** | **List[str]** | experiments uris on which the data has been produced | [optional] 

## Example

```python
from openapi_client.models.data_provenance_model import DataProvenanceModel

# TODO update the JSON string below
json = "{}"
# create an instance of DataProvenanceModel from a JSON string
data_provenance_model_instance = DataProvenanceModel.from_json(json)
# print the JSON string representation of the object
print(DataProvenanceModel.to_json())

# convert the object into a dict
data_provenance_model_dict = data_provenance_model_instance.to_dict()
# create an instance of DataProvenanceModel from a dict
data_provenance_model_from_dict = DataProvenanceModel.from_dict(data_provenance_model_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


