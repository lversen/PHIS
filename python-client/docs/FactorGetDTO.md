# FactorGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**category** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**experiment** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.factor_get_dto import FactorGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of FactorGetDTO from a JSON string
factor_get_dto_instance = FactorGetDTO.from_json(json)
# print the JSON string representation of the object
print(FactorGetDTO.to_json())

# convert the object into a dict
factor_get_dto_dict = factor_get_dto_instance.to_dict()
# create an instance of FactorGetDTO from a dict
factor_get_dto_from_dict = FactorGetDTO.from_dict(factor_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


