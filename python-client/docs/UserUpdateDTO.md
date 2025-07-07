# UserUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | User URI | 
**first_name** | **str** | User first name | 
**language** | **str** | User language | 
**password** | **str** | Optional user password | [optional] 
**admin** | **bool** | User admin flag | 
**last_name** | **str** | User last name | 
**email** | **str** | User email | 
**enable** | **bool** | User is enable | [optional] 
**favorites** | **List[str]** |  | [optional] 
**linked_person** | **str** | URI of the Person linked to this account | [optional] 

## Example

```python
from openapi_client.models.user_update_dto import UserUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of UserUpdateDTO from a JSON string
user_update_dto_instance = UserUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(UserUpdateDTO.to_json())

# convert the object into a dict
user_update_dto_dict = user_update_dto_instance.to_dict()
# create an instance of UserUpdateDTO from a dict
user_update_dto_from_dict = UserUpdateDTO.from_dict(user_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


