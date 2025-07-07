# TokenGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**token** | **str** | User token | [optional] 

## Example

```python
from openapi_client.models.token_get_dto import TokenGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of TokenGetDTO from a JSON string
token_get_dto_instance = TokenGetDTO.from_json(json)
# print the JSON string representation of the object
print(TokenGetDTO.to_json())

# convert the object into a dict
token_get_dto_dict = token_get_dto_instance.to_dict()
# create an instance of TokenGetDTO from a dict
token_get_dto_from_dict = TokenGetDTO.from_dict(token_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


