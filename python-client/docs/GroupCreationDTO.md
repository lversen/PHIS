# GroupCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Group URI | [optional] 
**rdf_type** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**name** | **str** | Group name | 
**description** | **str** | Group description | 
**user_profiles** | [**List[GroupUserProfileDTO]**](GroupUserProfileDTO.md) | Group user with profile | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.group_creation_dto import GroupCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of GroupCreationDTO from a JSON string
group_creation_dto_instance = GroupCreationDTO.from_json(json)
# print the JSON string representation of the object
print(GroupCreationDTO.to_json())

# convert the object into a dict
group_creation_dto_dict = group_creation_dto_instance.to_dict()
# create an instance of GroupCreationDTO from a dict
group_creation_dto_from_dict = GroupCreationDTO.from_dict(group_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


