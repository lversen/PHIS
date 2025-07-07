# ProfileUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | User URI | 
**name** | **str** | Profile name | 
**credentials** | **List[str]** | Profile credentials | 

## Example

```python
from openapi_client.models.profile_update_dto import ProfileUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ProfileUpdateDTO from a JSON string
profile_update_dto_instance = ProfileUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(ProfileUpdateDTO.to_json())

# convert the object into a dict
profile_update_dto_dict = profile_update_dto_instance.to_dict()
# create an instance of ProfileUpdateDTO from a dict
profile_update_dto_from_dict = ProfileUpdateDTO.from_dict(profile_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


