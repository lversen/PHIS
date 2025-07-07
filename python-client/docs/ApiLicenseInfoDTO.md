# ApiLicenseInfoDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **str** | GNU Affero General Public License v3 | [optional] 
**url** | **str** | https://www.gnu.org/licenses/agpl-3.0.fr.html | [optional] 

## Example

```python
from openapi_client.models.api_license_info_dto import ApiLicenseInfoDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ApiLicenseInfoDTO from a JSON string
api_license_info_dto_instance = ApiLicenseInfoDTO.from_json(json)
# print the JSON string representation of the object
print(ApiLicenseInfoDTO.to_json())

# convert the object into a dict
api_license_info_dto_dict = api_license_info_dto_instance.to_dict()
# create an instance of ApiLicenseInfoDTO from a dict
api_license_info_dto_from_dict = ApiLicenseInfoDTO.from_dict(api_license_info_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


