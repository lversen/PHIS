# ApiModulesInfo


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **str** | opensilex-core | [optional] 
**version** | **str** | 1.0.0-beta+2 | [optional] 

## Example

```python
from openapi_client.models.api_modules_info import ApiModulesInfo

# TODO update the JSON string below
json = "{}"
# create an instance of ApiModulesInfo from a JSON string
api_modules_info_instance = ApiModulesInfo.from_json(json)
# print the JSON string representation of the object
print(ApiModulesInfo.to_json())

# convert the object into a dict
api_modules_info_dict = api_modules_info_instance.to_dict()
# create an instance of ApiModulesInfo from a dict
api_modules_info_from_dict = ApiModulesInfo.from_dict(api_modules_info_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


