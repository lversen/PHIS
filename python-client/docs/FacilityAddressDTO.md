# FacilityAddressDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**country_name** | **str** |  | [optional] 
**locality** | **str** |  | [optional] 
**postal_code** | **str** |  | [optional] 
**region** | **str** |  | [optional] 
**street_address** | **str** |  | [optional] 
**readable_address** | **str** |  | [optional] [readonly] 

## Example

```python
from openapi_client.models.facility_address_dto import FacilityAddressDTO

# TODO update the JSON string below
json = "{}"
# create an instance of FacilityAddressDTO from a JSON string
facility_address_dto_instance = FacilityAddressDTO.from_json(json)
# print the JSON string representation of the object
print(FacilityAddressDTO.to_json())

# convert the object into a dict
facility_address_dto_dict = facility_address_dto_instance.to_dict()
# create an instance of FacilityAddressDTO from a dict
facility_address_dto_from_dict = FacilityAddressDTO.from_dict(facility_address_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


