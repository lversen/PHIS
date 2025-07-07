# AuthenticationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**identifier** | **str** | User identifier, email or URI | [optional] 
**password** | **str** | User password | [optional] 

## Example

```python
from openapi_client.models.authentication_dto import AuthenticationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of AuthenticationDTO from a JSON string
authentication_dto_instance = AuthenticationDTO.from_json(json)
# print the JSON string representation of the object
print(AuthenticationDTO.to_json())

# convert the object into a dict
authentication_dto_dict = authentication_dto_instance.to_dict()
# create an instance of AuthenticationDTO from a dict
authentication_dto_from_dict = AuthenticationDTO.from_dict(authentication_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


