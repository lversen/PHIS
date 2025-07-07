# UserGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | User URI | [optional] 
**email** | **str** | User email | [optional] 
**language** | **str** | User language | [optional] 
**admin** | **bool** | User admin flag | [optional] 
**first_name** | **str** | User first name | [optional] 
**last_name** | **str** | User last name | [optional] 
**linked_person** | **str** | URI of the Person linked to this account | [optional] 
**enable** | **bool** | User is enable | [optional] 
**favorites** | **List[str]** | Favorites URI | [optional] 

## Example

```python
from openapi_client.models.user_get_dto import UserGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of UserGetDTO from a JSON string
user_get_dto_instance = UserGetDTO.from_json(json)
# print the JSON string representation of the object
print(UserGetDTO.to_json())

# convert the object into a dict
user_get_dto_dict = user_get_dto_instance.to_dict()
# create an instance of UserGetDTO from a dict
user_get_dto_from_dict = UserGetDTO.from_dict(user_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


