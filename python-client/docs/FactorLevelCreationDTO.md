# FactorLevelCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | 
**description** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.factor_level_creation_dto import FactorLevelCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of FactorLevelCreationDTO from a JSON string
factor_level_creation_dto_instance = FactorLevelCreationDTO.from_json(json)
# print the JSON string representation of the object
print(FactorLevelCreationDTO.to_json())

# convert the object into a dict
factor_level_creation_dto_dict = factor_level_creation_dto_instance.to_dict()
# create an instance of FactorLevelCreationDTO from a dict
factor_level_creation_dto_from_dict = FactorLevelCreationDTO.from_dict(factor_level_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


