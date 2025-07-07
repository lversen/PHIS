# AccountCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Account URI | [optional] 
**email** | **str** | Account email | [optional] 
**admin** | **bool** | Account admin flag | [optional] 
**language** | **str** | Account language | [optional] 
**enable** | **bool** | Account is enable | [optional] 
**favorites** | **List[str]** | Favorites URI | [optional] 
**password** | **str** | Account password | [optional] 
**linked_person** | **str** | URI of the Person linked to this account | [optional] 

## Example

```python
from openapi_client.models.account_creation_dto import AccountCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of AccountCreationDTO from a JSON string
account_creation_dto_instance = AccountCreationDTO.from_json(json)
# print the JSON string representation of the object
print(AccountCreationDTO.to_json())

# convert the object into a dict
account_creation_dto_dict = account_creation_dto_instance.to_dict()
# create an instance of AccountCreationDTO from a dict
account_creation_dto_from_dict = AccountCreationDTO.from_dict(account_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


