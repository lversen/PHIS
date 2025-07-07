# FactorCategoryGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | URI of the factor category | [optional] 
**name** | **str** | Name of the factor category | [optional] 

## Example

```python
from openapi_client.models.factor_category_get_dto import FactorCategoryGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of FactorCategoryGetDTO from a JSON string
factor_category_get_dto_instance = FactorCategoryGetDTO.from_json(json)
# print the JSON string representation of the object
print(FactorCategoryGetDTO.to_json())

# convert the object into a dict
factor_category_get_dto_dict = factor_category_get_dto_instance.to_dict()
# create an instance of FactorCategoryGetDTO from a dict
factor_category_get_dto_from_dict = FactorCategoryGetDTO.from_dict(factor_category_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


