# FavoriteCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **str** |  | [optional] 
**uri** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.favorite_creation_dto import FavoriteCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of FavoriteCreationDTO from a JSON string
favorite_creation_dto_instance = FavoriteCreationDTO.from_json(json)
# print the JSON string representation of the object
print(FavoriteCreationDTO.to_json())

# convert the object into a dict
favorite_creation_dto_dict = favorite_creation_dto_instance.to_dict()
# create an instance of FavoriteCreationDTO from a dict
favorite_creation_dto_from_dict = FavoriteCreationDTO.from_dict(favorite_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


