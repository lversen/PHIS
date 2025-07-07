# NamedResourceDTOFactorLevelModel


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.named_resource_dto_factor_level_model import NamedResourceDTOFactorLevelModel

# TODO update the JSON string below
json = "{}"
# create an instance of NamedResourceDTOFactorLevelModel from a JSON string
named_resource_dto_factor_level_model_instance = NamedResourceDTOFactorLevelModel.from_json(json)
# print the JSON string representation of the object
print(NamedResourceDTOFactorLevelModel.to_json())

# convert the object into a dict
named_resource_dto_factor_level_model_dict = named_resource_dto_factor_level_model_instance.to_dict()
# create an instance of NamedResourceDTOFactorLevelModel from a dict
named_resource_dto_factor_level_model_from_dict = NamedResourceDTOFactorLevelModel.from_dict(named_resource_dto_factor_level_model_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


