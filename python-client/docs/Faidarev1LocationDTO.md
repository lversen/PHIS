# Faidarev1LocationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**abbreviation** | **str** |  | [optional] 
**abreviation** | **str** |  | [optional] 
**additional_info** | **Dict[str, str]** |  | [optional] 
**altitude** | **float** |  | [optional] 
**country_code** | **str** |  | [optional] 
**country_name** | **str** |  | [optional] 
**documentation_url** | **str** |  | [optional] 
**institute_address** | **str** |  | [optional] 
**institute_adress** | **str** |  | [optional] 
**institute_name** | **str** |  | [optional] 
**latitude** | **float** |  | [optional] 
**location_db_id** | **str** |  | [optional] 
**location_name** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**location_type** | **str** |  | [optional] 
**longitude** | **float** |  | [optional] 

## Example

```python
from openapi_client.models.faidarev1_location_dto import Faidarev1LocationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of Faidarev1LocationDTO from a JSON string
faidarev1_location_dto_instance = Faidarev1LocationDTO.from_json(json)
# print the JSON string representation of the object
print(Faidarev1LocationDTO.to_json())

# convert the object into a dict
faidarev1_location_dto_dict = faidarev1_location_dto_instance.to_dict()
# create an instance of Faidarev1LocationDTO from a dict
faidarev1_location_dto_from_dict = Faidarev1LocationDTO.from_dict(faidarev1_location_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


