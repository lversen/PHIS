# AccountUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Account URI | 
**email** | **str** | Account email | [optional] 
**admin** | **bool** | Account admin flag | [optional] 
**language** | **str** | Account language | [optional] 
**enable** | **bool** | Account is enable | [optional] 
**favorites** | **List[str]** | Favorites URI | [optional] 
**password** | **str** | Account password | [optional] 
**linked_person** | **str** | URI of the Person linked to this account | [optional] 

## Example

```python
from openapi_client.models.account_update_dto import AccountUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of AccountUpdateDTO from a JSON string
account_update_dto_instance = AccountUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(AccountUpdateDTO.to_json())

# convert the object into a dict
account_update_dto_dict = account_update_dto_instance.to_dict()
# create an instance of AccountUpdateDTO from a dict
account_update_dto_from_dict = AccountUpdateDTO.from_dict(account_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


