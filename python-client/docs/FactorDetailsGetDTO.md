# FactorDetailsGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**name** | **str** |  | [optional] 
**category** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**levels** | [**List[FactorLevelGetDTO]**](FactorLevelGetDTO.md) |  | [optional] 
**exact_match** | **List[str]** |  | [optional] 
**close_match** | **List[str]** |  | [optional] 
**broad_match** | **List[str]** |  | [optional] 
**narrow_match** | **List[str]** |  | [optional] 
**experiment** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.factor_details_get_dto import FactorDetailsGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of FactorDetailsGetDTO from a JSON string
factor_details_get_dto_instance = FactorDetailsGetDTO.from_json(json)
# print the JSON string representation of the object
print(FactorDetailsGetDTO.to_json())

# convert the object into a dict
factor_details_get_dto_dict = factor_details_get_dto_instance.to_dict()
# create an instance of FactorDetailsGetDTO from a dict
factor_details_get_dto_from_dict = FactorDetailsGetDTO.from_dict(factor_details_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


