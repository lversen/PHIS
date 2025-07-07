# Faidarev1ScaleDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**data_type** | **str** |  | [optional] 
**decimal_places** | **str** |  | [optional] 
**scale_db_id** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**valid_values** | **str** |  | [optional] 
**xref** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.faidarev1_scale_dto import Faidarev1ScaleDTO

# TODO update the JSON string below
json = "{}"
# create an instance of Faidarev1ScaleDTO from a JSON string
faidarev1_scale_dto_instance = Faidarev1ScaleDTO.from_json(json)
# print the JSON string representation of the object
print(Faidarev1ScaleDTO.to_json())

# convert the object into a dict
faidarev1_scale_dto_dict = faidarev1_scale_dto_instance.to_dict()
# create an instance of Faidarev1ScaleDTO from a dict
faidarev1_scale_dto_from_dict = Faidarev1ScaleDTO.from_dict(faidarev1_scale_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


