# FacilityNamedDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.facility_named_dto import FacilityNamedDTO

# TODO update the JSON string below
json = "{}"
# create an instance of FacilityNamedDTO from a JSON string
facility_named_dto_instance = FacilityNamedDTO.from_json(json)
# print the JSON string representation of the object
print(FacilityNamedDTO.to_json())

# convert the object into a dict
facility_named_dto_dict = facility_named_dto_instance.to_dict()
# create an instance of FacilityNamedDTO from a dict
facility_named_dto_from_dict = FacilityNamedDTO.from_dict(facility_named_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


