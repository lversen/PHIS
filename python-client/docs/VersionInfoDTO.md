# VersionInfoDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**title** | **str** | Opensilex instance name | [optional] 
**version** | **str** | Opensilex API version | [optional] 
**description** | **str** | Opensilex description | [optional] 
**contact** | [**ApiContactInfoDTO**](ApiContactInfoDTO.md) |  | [optional] 
**license** | [**ApiLicenseInfoDTO**](ApiLicenseInfoDTO.md) |  | [optional] 
**modules_version** | [**List[ApiModulesInfo]**](ApiModulesInfo.md) |  | [optional] 
**external_docs** | [**ApiExternalDocsDTO**](ApiExternalDocsDTO.md) |  | [optional] 
**api_docs** | [**ApiExternalDocsDTO**](ApiExternalDocsDTO.md) |  | [optional] 
**git_commit** | [**ApiGitCommitDTO**](ApiGitCommitDTO.md) |  | [optional] 
**github_page** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.version_info_dto import VersionInfoDTO

# TODO update the JSON string below
json = "{}"
# create an instance of VersionInfoDTO from a JSON string
version_info_dto_instance = VersionInfoDTO.from_json(json)
# print the JSON string representation of the object
print(VersionInfoDTO.to_json())

# convert the object into a dict
version_info_dto_dict = version_info_dto_instance.to_dict()
# create an instance of VersionInfoDTO from a dict
version_info_dto_from_dict = VersionInfoDTO.from_dict(version_info_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


