# FrontConfigDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**path_prefix** | **str** | Application url path prefix | 
**home_component** | **str** | Home component identifier | 
**not_found_component** | **str** | Not found component identifier | 
**header_component** | **str** | Header component identifier | 
**login_component** | **str** | Login component identifier | 
**menu_component** | **str** | Menu component identifier | 
**footer_component** | **str** | Footer component identifier | 
**routes** | [**List[RouteDTO]**](RouteDTO.md) | List of configured routes | 
**theme_module** | **str** | Theme module identifier | [optional] 
**theme_name** | **str** | Theme module name | [optional] 
**open_id_authentication_uri** | **str** | OpenID Authorization URI | [optional] 
**open_id_connection_title** | **str** |  | [optional] 
**saml_proxy_login_uri** | **str** |  | [optional] 
**saml_connection_title** | **str** |  | [optional] 
**activate_reset_password** | **bool** |  | [optional] 
**geocoding_service** | **str** | Geocoding service | [optional] 
**menu_exclusions** | **List[str]** | Menu exclusions | [optional] 
**version_label** | **str** | Version label to use in the header | [optional] 
**application_name** | **str** | Name of the application to display | [optional] 
**connect_as_guest** | **bool** | Ability to be logged as guest | [optional] 
**dashboard** | [**DashboardConfigDTO**](DashboardConfigDTO.md) |  | [optional] 
**gdpr_file_is_configured** | **bool** | GDPR PDF is configured | [optional] 
**matomo** | [**MatomoConfigDTO**](MatomoConfigDTO.md) |  | [optional] 
**notification_message** | **Dict[str, str]** | Notification message for the instance | [optional] 
**notification_color_theme** | **str** | Color theme for the notification message | [optional] 
**notification_end_date** | **date** | Date until which to send the notification | [optional] 
**agroportal** | [**AgroportalOntologiesConfigDTO**](AgroportalOntologiesConfigDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.front_config_dto import FrontConfigDTO

# TODO update the JSON string below
json = "{}"
# create an instance of FrontConfigDTO from a JSON string
front_config_dto_instance = FrontConfigDTO.from_json(json)
# print the JSON string representation of the object
print(FrontConfigDTO.to_json())

# convert the object into a dict
front_config_dto_dict = front_config_dto_instance.to_dict()
# create an instance of FrontConfigDTO from a dict
front_config_dto_from_dict = FrontConfigDTO.from_dict(front_config_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


