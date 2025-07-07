# MenuItemDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **str** | Menu identifier | 
**label** | **str** | Menu label | 
**children** | [**List[MenuItemDTO]**](MenuItemDTO.md) | List of sub menu items | 
**route** | [**RouteDTO**](RouteDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.menu_item_dto import MenuItemDTO

# TODO update the JSON string below
json = "{}"
# create an instance of MenuItemDTO from a JSON string
menu_item_dto_instance = MenuItemDTO.from_json(json)
# print the JSON string representation of the object
print(MenuItemDTO.to_json())

# convert the object into a dict
menu_item_dto_dict = menu_item_dto_instance.to_dict()
# create an instance of MenuItemDTO from a dict
menu_item_dto_from_dict = MenuItemDTO.from_dict(menu_item_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


