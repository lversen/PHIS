# AgroportalLinksModel


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**var_self** | **str** |  | [optional] 
**ontology** | **str** |  | [optional] 
**children** | **str** |  | [optional] 
**parents** | **str** |  | [optional] 
**descendants** | **str** |  | [optional] 
**ancestors** | **str** |  | [optional] 
**instances** | **str** |  | [optional] 
**tree** | **str** |  | [optional] 
**notes** | **str** |  | [optional] 
**ui** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.agroportal_links_model import AgroportalLinksModel

# TODO update the JSON string below
json = "{}"
# create an instance of AgroportalLinksModel from a JSON string
agroportal_links_model_instance = AgroportalLinksModel.from_json(json)
# print the JSON string representation of the object
print(AgroportalLinksModel.to_json())

# convert the object into a dict
agroportal_links_model_dict = agroportal_links_model_instance.to_dict()
# create an instance of AgroportalLinksModel from a dict
agroportal_links_model_from_dict = AgroportalLinksModel.from_dict(agroportal_links_model_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


