# ThemeConfigDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**has_style** | **bool** |  | [optional] 
**fonts** | [**List[FontConfigDTO]**](FontConfigDTO.md) |  | [optional] 
**icon_classes_rdf** | **Dict[str, str]** |  | [optional] 
**component_overrides** | **Dict[str, str]** |  | [optional] 

## Example

```python
from openapi_client.models.theme_config_dto import ThemeConfigDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ThemeConfigDTO from a JSON string
theme_config_dto_instance = ThemeConfigDTO.from_json(json)
# print the JSON string representation of the object
print(ThemeConfigDTO.to_json())

# convert the object into a dict
theme_config_dto_dict = theme_config_dto_instance.to_dict()
# create an instance of ThemeConfigDTO from a dict
theme_config_dto_from_dict = ThemeConfigDTO.from_dict(theme_config_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


