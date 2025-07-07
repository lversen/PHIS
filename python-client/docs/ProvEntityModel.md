# ProvEntityModel


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | 
**rdf_type** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.prov_entity_model import ProvEntityModel

# TODO update the JSON string below
json = "{}"
# create an instance of ProvEntityModel from a JSON string
prov_entity_model_instance = ProvEntityModel.from_json(json)
# print the JSON string representation of the object
print(ProvEntityModel.to_json())

# convert the object into a dict
prov_entity_model_dict = prov_entity_model_instance.to_dict()
# create an instance of ProvEntityModel from a dict
prov_entity_model_from_dict = ProvEntityModel.from_dict(prov_entity_model_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


