# AccountGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Account URI | [optional] 
**email** | **str** | Account email | [optional] 
**admin** | **bool** | Account admin flag | [optional] 
**language** | **str** | Account language | [optional] 
**enable** | **bool** | Account is enable | [optional] 
**favorites** | **List[str]** | Favorites URI | [optional] 
**linked_person** | **str** | URI of the Person linked to this account | [optional] 
**person_first_name** | **str** | first name of the linked person | [optional] 
**person_last_name** | **str** | last name of the linked person | [optional] 

## Example

```python
from openapi_client.models.account_get_dto import AccountGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of AccountGetDTO from a JSON string
account_get_dto_instance = AccountGetDTO.from_json(json)
# print the JSON string representation of the object
print(AccountGetDTO.to_json())

# convert the object into a dict
account_get_dto_dict = account_get_dto_instance.to_dict()
# create an instance of AccountGetDTO from a dict
account_get_dto_from_dict = AccountGetDTO.from_dict(account_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


