# BrAPIv1CallDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**call** | **str** |  | [optional] 
**data_types** | **List[str]** |  | [optional] 
**methods** | **List[str]** |  | [optional] 
**versions** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_call_dto import BrAPIv1CallDTO

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1CallDTO from a JSON string
br_apiv1_call_dto_instance = BrAPIv1CallDTO.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1CallDTO.to_json())

# convert the object into a dict
br_apiv1_call_dto_dict = br_apiv1_call_dto_instance.to_dict()
# create an instance of BrAPIv1CallDTO from a dict
br_apiv1_call_dto_from_dict = BrAPIv1CallDTO.from_dict(br_apiv1_call_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


