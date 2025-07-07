# FactorCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | 
**category** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**levels** | [**List[FactorLevelCreationDTO]**](FactorLevelCreationDTO.md) |  | 
**exact_match** | **List[str]** |  | [optional] 
**close_match** | **List[str]** |  | [optional] 
**broad_match** | **List[str]** |  | [optional] 
**narrow_match** | **List[str]** |  | [optional] 
**experiment** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.factor_creation_dto import FactorCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of FactorCreationDTO from a JSON string
factor_creation_dto_instance = FactorCreationDTO.from_json(json)
# print the JSON string representation of the object
print(FactorCreationDTO.to_json())

# convert the object into a dict
factor_creation_dto_dict = factor_creation_dto_instance.to_dict()
# create an instance of FactorCreationDTO from a dict
factor_creation_dto_from_dict = FactorCreationDTO.from_dict(factor_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


