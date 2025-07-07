# PersonDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** | Person URI | [optional] 
**first_name** | **str** | Person first name | [optional] 
**last_name** | **str** | Person last name | [optional] 
**email** | **str** | email | [optional] 
**affiliation** | **str** | affiliation | [optional] 
**phone_number** | **str** | phone number | [optional] 
**orcid** | **str** | orcid | [optional] 
**account** | **str** | Uri of the account if this person has one | [optional] 

## Example

```python
from openapi_client.models.person_dto import PersonDTO

# TODO update the JSON string below
json = "{}"
# create an instance of PersonDTO from a JSON string
person_dto_instance = PersonDTO.from_json(json)
# print the JSON string representation of the object
print(PersonDTO.to_json())

# convert the object into a dict
person_dto_dict = person_dto_instance.to_dict()
# create an instance of PersonDTO from a dict
person_dto_from_dict = PersonDTO.from_dict(person_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


