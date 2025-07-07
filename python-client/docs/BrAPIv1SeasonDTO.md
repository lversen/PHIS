# BrAPIv1SeasonDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**season** | **str** |  | [optional] 
**season_db_id** | **str** |  | [optional] 
**year** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_season_dto import BrAPIv1SeasonDTO

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1SeasonDTO from a JSON string
br_apiv1_season_dto_instance = BrAPIv1SeasonDTO.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1SeasonDTO.to_json())

# convert the object into a dict
br_apiv1_season_dto_dict = br_apiv1_season_dto_instance.to_dict()
# create an instance of BrAPIv1SeasonDTO from a dict
br_apiv1_season_dto_from_dict = BrAPIv1SeasonDTO.from_dict(br_apiv1_season_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


