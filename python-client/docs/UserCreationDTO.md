# UserCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Account URI | [optional] 
**first_name** | **str** | Person first name | 
**last_name** | **str** | Person last name | 
**email** | **str** | User email | 
**language** | **str** | Account language | 
**password** | **str** | Account password | 
**admin** | **bool** | Account admin flag | 
**enable** | **bool** | User is enable | [optional] 
**favorites** | **List[str]** | Favorites URI | [optional] 
**linked_person** | **str** | URI of the Person linked to this account | [optional] 

## Example

```python
from openapi_client.models.user_creation_dto import UserCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of UserCreationDTO from a JSON string
user_creation_dto_instance = UserCreationDTO.from_json(json)
# print the JSON string representation of the object
print(UserCreationDTO.to_json())

# convert the object into a dict
user_creation_dto_dict = user_creation_dto_instance.to_dict()
# create an instance of UserCreationDTO from a dict
user_creation_dto_from_dict = UserCreationDTO.from_dict(user_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


