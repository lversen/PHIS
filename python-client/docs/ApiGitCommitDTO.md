# ApiGitCommitDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**commit_id** | **str** |  | [optional] 
**commit_message** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.api_git_commit_dto import ApiGitCommitDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ApiGitCommitDTO from a JSON string
api_git_commit_dto_instance = ApiGitCommitDTO.from_json(json)
# print the JSON string representation of the object
print(ApiGitCommitDTO.to_json())

# convert the object into a dict
api_git_commit_dto_dict = api_git_commit_dto_instance.to_dict()
# create an instance of ApiGitCommitDTO from a dict
api_git_commit_dto_from_dict = ApiGitCommitDTO.from_dict(api_git_commit_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


