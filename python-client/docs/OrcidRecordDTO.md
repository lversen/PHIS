# OrcidRecordDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**orcid** | **str** |  | [optional] 
**first_name** | **str** |  | [optional] 
**last_name** | **str** |  | [optional] 
**emails** | **List[str]** |  | [optional] 
**organizations** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.orcid_record_dto import OrcidRecordDTO

# TODO update the JSON string below
json = "{}"
# create an instance of OrcidRecordDTO from a JSON string
orcid_record_dto_instance = OrcidRecordDTO.from_json(json)
# print the JSON string representation of the object
print(OrcidRecordDTO.to_json())

# convert the object into a dict
orcid_record_dto_dict = orcid_record_dto_instance.to_dict()
# create an instance of OrcidRecordDTO from a dict
orcid_record_dto_from_dict = OrcidRecordDTO.from_dict(orcid_record_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


