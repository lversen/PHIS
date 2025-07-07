# SiteCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
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
from openapi_client.models.site_creation_dto import SiteCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of SiteCreationDTO from a JSON string
site_creation_dto_instance = SiteCreationDTO.from_json(json)
# print the JSON string representation of the object
print(SiteCreationDTO.to_json())

# convert the object into a dict
site_creation_dto_dict = site_creation_dto_instance.to_dict()
# create an instance of SiteCreationDTO from a dict
site_creation_dto_from_dict = SiteCreationDTO.from_dict(site_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


