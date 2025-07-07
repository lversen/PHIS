# ApiContactInfoDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **str** | Opensilex Team | [optional] 
**email** | **str** | opensilex@gmail.com | [optional] 
**homepage** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.api_contact_info_dto import ApiContactInfoDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ApiContactInfoDTO from a JSON string
api_contact_info_dto_instance = ApiContactInfoDTO.from_json(json)
# print the JSON string representation of the object
print(ApiContactInfoDTO.to_json())

# convert the object into a dict
api_contact_info_dto_dict = api_contact_info_dto_instance.to_dict()
# create an instance of ApiContactInfoDTO from a dict
api_contact_info_dto_from_dict = ApiContactInfoDTO.from_dict(api_contact_info_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


