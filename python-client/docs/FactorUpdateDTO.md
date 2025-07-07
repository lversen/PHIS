# FactorUpdateDTO


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

## Example

```python
from openapi_client.models.factor_update_dto import FactorUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of FactorUpdateDTO from a JSON string
factor_update_dto_instance = FactorUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(FactorUpdateDTO.to_json())

# convert the object into a dict
factor_update_dto_dict = factor_update_dto_instance.to_dict()
# create an instance of FactorUpdateDTO from a dict
factor_update_dto_from_dict = FactorUpdateDTO.from_dict(factor_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


