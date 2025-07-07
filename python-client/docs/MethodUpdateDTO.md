# MethodUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | 
**name** | **str** |  | 
**description** | **str** |  | [optional] 
**exact_match** | **List[str]** |  | [optional] 
**close_match** | **List[str]** |  | [optional] 
**broad_match** | **List[str]** |  | [optional] 
**narrow_match** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.method_update_dto import MethodUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of MethodUpdateDTO from a JSON string
method_update_dto_instance = MethodUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(MethodUpdateDTO.to_json())

# convert the object into a dict
method_update_dto_dict = method_update_dto_instance.to_dict()
# create an instance of MethodUpdateDTO from a dict
method_update_dto_from_dict = MethodUpdateDTO.from_dict(method_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


