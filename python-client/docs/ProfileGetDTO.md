# ProfileGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | User URI | [optional] 
**name** | **str** | Profile name | [optional] 
**credentials** | **List[str]** | Profile credentials | [optional] 

## Example

```python
from openapi_client.models.profile_get_dto import ProfileGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ProfileGetDTO from a JSON string
profile_get_dto_instance = ProfileGetDTO.from_json(json)
# print the JSON string representation of the object
print(ProfileGetDTO.to_json())

# convert the object into a dict
profile_get_dto_dict = profile_get_dto_instance.to_dict()
# create an instance of ProfileGetDTO from a dict
profile_get_dto_from_dict = ProfileGetDTO.from_dict(profile_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


