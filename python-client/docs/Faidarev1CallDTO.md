# Faidarev1CallDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**call** | **str** |  | [optional] 
**data_types** | **List[str]** |  | [optional] 
**methods** | **List[str]** |  | [optional] 
**versions** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.faidarev1_call_dto import Faidarev1CallDTO

# TODO update the JSON string below
json = "{}"
# create an instance of Faidarev1CallDTO from a JSON string
faidarev1_call_dto_instance = Faidarev1CallDTO.from_json(json)
# print the JSON string representation of the object
print(Faidarev1CallDTO.to_json())

# convert the object into a dict
faidarev1_call_dto_dict = faidarev1_call_dto_instance.to_dict()
# create an instance of Faidarev1CallDTO from a dict
faidarev1_call_dto_from_dict = Faidarev1CallDTO.from_dict(faidarev1_call_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


