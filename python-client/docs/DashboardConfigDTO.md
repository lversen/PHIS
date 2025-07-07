# DashboardConfigDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**show_metrics** | **bool** |  | [optional] 
**graph1** | [**GraphConfigDTO**](GraphConfigDTO.md) |  | [optional] 
**graph2** | [**GraphConfigDTO**](GraphConfigDTO.md) |  | [optional] 
**graph3** | [**GraphConfigDTO**](GraphConfigDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.dashboard_config_dto import DashboardConfigDTO

# TODO update the JSON string below
json = "{}"
# create an instance of DashboardConfigDTO from a JSON string
dashboard_config_dto_instance = DashboardConfigDTO.from_json(json)
# print the JSON string representation of the object
print(DashboardConfigDTO.to_json())

# convert the object into a dict
dashboard_config_dto_dict = dashboard_config_dto_instance.to_dict()
# create an instance of DashboardConfigDTO from a dict
dashboard_config_dto_from_dict = DashboardConfigDTO.from_dict(dashboard_config_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


