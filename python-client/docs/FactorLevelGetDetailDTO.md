# FactorLevelGetDetailDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**factor** | **str** |  | [optional] 
**factor_name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.factor_level_get_detail_dto import FactorLevelGetDetailDTO

# TODO update the JSON string below
json = "{}"
# create an instance of FactorLevelGetDetailDTO from a JSON string
factor_level_get_detail_dto_instance = FactorLevelGetDetailDTO.from_json(json)
# print the JSON string representation of the object
print(FactorLevelGetDetailDTO.to_json())

# convert the object into a dict
factor_level_get_detail_dto_dict = factor_level_get_detail_dto_instance.to_dict()
# create an instance of FactorLevelGetDetailDTO from a dict
factor_level_get_detail_dto_from_dict = FactorLevelGetDetailDTO.from_dict(factor_level_get_detail_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


