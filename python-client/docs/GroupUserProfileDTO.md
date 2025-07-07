# GroupUserProfileDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Group URI | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**profile_uri** | **str** | User associated profile URI | [optional] 
**profile_name** | **str** | User associated profile name | [optional] 
**user_uri** | **str** | User URI | 
**user_name** | **str** | User name | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.group_user_profile_dto import GroupUserProfileDTO

# TODO update the JSON string below
json = "{}"
# create an instance of GroupUserProfileDTO from a JSON string
group_user_profile_dto_instance = GroupUserProfileDTO.from_json(json)
# print the JSON string representation of the object
print(GroupUserProfileDTO.to_json())

# convert the object into a dict
group_user_profile_dto_dict = group_user_profile_dto_instance.to_dict()
# create an instance of GroupUserProfileDTO from a dict
group_user_profile_dto_from_dict = GroupUserProfileDTO.from_dict(group_user_profile_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


