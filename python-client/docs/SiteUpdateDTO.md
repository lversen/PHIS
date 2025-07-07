# SiteUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | 
**rdf_type** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**address** | [**SiteAddressDTO**](SiteAddressDTO.md) |  | [optional] 
**organizations** | **List[str]** |  | [optional] 
**facilities** | **List[str]** |  | [optional] 
**groups** | **List[str]** |  | [optional] 
**description** | **str** |  | [optional] 
**rdf_type_name** | **str** |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.site_update_dto import SiteUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of SiteUpdateDTO from a JSON string
site_update_dto_instance = SiteUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(SiteUpdateDTO.to_json())

# convert the object into a dict
site_update_dto_dict = site_update_dto_instance.to_dict()
# create an instance of SiteUpdateDTO from a dict
site_update_dto_from_dict = SiteUpdateDTO.from_dict(site_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


