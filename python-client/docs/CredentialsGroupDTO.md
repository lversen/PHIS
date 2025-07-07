# CredentialsGroupDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**group_id** | **str** | Credential group identifier | [optional] 
**group_key_name** | **str** | Credential group key label | [optional] 
**credentials** | [**List[CredentialDTO]**](CredentialDTO.md) | Credentials Map | [optional] 

## Example

```python
from openapi_client.models.credentials_group_dto import CredentialsGroupDTO

# TODO update the JSON string below
json = "{}"
# create an instance of CredentialsGroupDTO from a JSON string
credentials_group_dto_instance = CredentialsGroupDTO.from_json(json)
# print the JSON string representation of the object
print(CredentialsGroupDTO.to_json())

# convert the object into a dict
credentials_group_dto_dict = credentials_group_dto_instance.to_dict()
# create an instance of CredentialsGroupDTO from a dict
credentials_group_dto_from_dict = CredentialsGroupDTO.from_dict(credentials_group_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


