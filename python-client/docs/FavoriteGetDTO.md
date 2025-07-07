# FavoriteGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**type** | **str** |  | [optional] 
**default_name** | **str** |  | [optional] 
**graph_names** | [**List[FavoriteGetGraphNameDTO]**](FavoriteGetGraphNameDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.favorite_get_dto import FavoriteGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of FavoriteGetDTO from a JSON string
favorite_get_dto_instance = FavoriteGetDTO.from_json(json)
# print the JSON string representation of the object
print(FavoriteGetDTO.to_json())

# convert the object into a dict
favorite_get_dto_dict = favorite_get_dto_instance.to_dict()
# create an instance of FavoriteGetDTO from a dict
favorite_get_dto_from_dict = FavoriteGetDTO.from_dict(favorite_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


