# UserFrontConfigDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**menu** | [**List[MenuItemDTO]**](MenuItemDTO.md) | Application menu with routes | 
**user_is_anonymous** | **bool** | User is anonymous | 

## Example

```python
from openapi_client.models.user_front_config_dto import UserFrontConfigDTO

# TODO update the JSON string below
json = "{}"
# create an instance of UserFrontConfigDTO from a JSON string
user_front_config_dto_instance = UserFrontConfigDTO.from_json(json)
# print the JSON string representation of the object
print(UserFrontConfigDTO.to_json())

# convert the object into a dict
user_front_config_dto_dict = user_front_config_dto_instance.to_dict()
# create an instance of UserFrontConfigDTO from a dict
user_front_config_dto_from_dict = UserFrontConfigDTO.from_dict(user_front_config_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


