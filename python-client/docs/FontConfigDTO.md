# FontConfigDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**family** | **str** |  | [optional] 
**style** | **str** |  | [optional] 
**weight** | **str** |  | [optional] 
**url** | **str** |  | [optional] 
**src** | **Dict[str, str]** |  | [optional] 

## Example

```python
from openapi_client.models.font_config_dto import FontConfigDTO

# TODO update the JSON string below
json = "{}"
# create an instance of FontConfigDTO from a JSON string
font_config_dto_instance = FontConfigDTO.from_json(json)
# print the JSON string representation of the object
print(FontConfigDTO.to_json())

# convert the object into a dict
font_config_dto_dict = font_config_dto_instance.to_dict()
# create an instance of FontConfigDTO from a dict
font_config_dto_from_dict = FontConfigDTO.from_dict(font_config_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


