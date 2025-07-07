# ProfileCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | User URI | 
**name** | **str** | Profile name | 
**credentials** | **List[str]** | Profile credentials | 

## Example

```python
from openapi_client.models.profile_creation_dto import ProfileCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ProfileCreationDTO from a JSON string
profile_creation_dto_instance = ProfileCreationDTO.from_json(json)
# print the JSON string representation of the object
print(ProfileCreationDTO.to_json())

# convert the object into a dict
profile_creation_dto_dict = profile_creation_dto_instance.to_dict()
# create an instance of ProfileCreationDTO from a dict
profile_creation_dto_from_dict = ProfileCreationDTO.from_dict(profile_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


