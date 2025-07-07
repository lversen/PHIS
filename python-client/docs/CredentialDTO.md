# CredentialDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **str** | Credential identifier | [optional] 
**name** | **str** | Credential name | [optional] 

## Example

```python
from openapi_client.models.credential_dto import CredentialDTO

# TODO update the JSON string below
json = "{}"
# create an instance of CredentialDTO from a JSON string
credential_dto_instance = CredentialDTO.from_json(json)
# print the JSON string representation of the object
print(CredentialDTO.to_json())

# convert the object into a dict
credential_dto_dict = credential_dto_instance.to_dict()
# create an instance of CredentialDTO from a dict
credential_dto_from_dict = CredentialDTO.from_dict(credential_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


