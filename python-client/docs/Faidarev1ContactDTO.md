# Faidarev1ContactDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**contact_db_id** | **str** |  | [optional] 
**email** | **str** |  | [optional] 
**institution_name** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**orcid** | **str** |  | [optional] 
**type** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.faidarev1_contact_dto import Faidarev1ContactDTO

# TODO update the JSON string below
json = "{}"
# create an instance of Faidarev1ContactDTO from a JSON string
faidarev1_contact_dto_instance = Faidarev1ContactDTO.from_json(json)
# print the JSON string representation of the object
print(Faidarev1ContactDTO.to_json())

# convert the object into a dict
faidarev1_contact_dto_dict = faidarev1_contact_dto_instance.to_dict()
# create an instance of Faidarev1ContactDTO from a dict
faidarev1_contact_dto_from_dict = Faidarev1ContactDTO.from_dict(faidarev1_contact_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


