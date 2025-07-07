# SiteAddressDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**country_name** | **str** |  | [optional] 
**locality** | **str** |  | [optional] 
**postal_code** | **str** |  | [optional] 
**region** | **str** |  | [optional] 
**street_address** | **str** |  | [optional] 
**readable_address** | **str** |  | [optional] [readonly] 

## Example

```python
from openapi_client.models.site_address_dto import SiteAddressDTO

# TODO update the JSON string below
json = "{}"
# create an instance of SiteAddressDTO from a JSON string
site_address_dto_instance = SiteAddressDTO.from_json(json)
# print the JSON string representation of the object
print(SiteAddressDTO.to_json())

# convert the object into a dict
site_address_dto_dict = site_address_dto_instance.to_dict()
# create an instance of SiteAddressDTO from a dict
site_address_dto_from_dict = SiteAddressDTO.from_dict(site_address_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


