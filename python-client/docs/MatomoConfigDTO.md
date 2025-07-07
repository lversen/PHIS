# MatomoConfigDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**server_url** | **str** |  | [optional] 
**site_id** | **int** |  | [optional] 

## Example

```python
from openapi_client.models.matomo_config_dto import MatomoConfigDTO

# TODO update the JSON string below
json = "{}"
# create an instance of MatomoConfigDTO from a JSON string
matomo_config_dto_instance = MatomoConfigDTO.from_json(json)
# print the JSON string representation of the object
print(MatomoConfigDTO.to_json())

# convert the object into a dict
matomo_config_dto_dict = matomo_config_dto_instance.to_dict()
# create an instance of MatomoConfigDTO from a dict
matomo_config_dto_from_dict = MatomoConfigDTO.from_dict(matomo_config_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


