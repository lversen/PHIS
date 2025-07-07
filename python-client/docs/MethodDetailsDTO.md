# MethodDetailsDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**exact_match** | **List[str]** |  | [optional] 
**close_match** | **List[str]** |  | [optional] 
**broad_match** | **List[str]** |  | [optional] 
**narrow_match** | **List[str]** |  | [optional] 
**from_shared_resource_instance** | [**SharedResourceInstanceDTO**](SharedResourceInstanceDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.method_details_dto import MethodDetailsDTO

# TODO update the JSON string below
json = "{}"
# create an instance of MethodDetailsDTO from a JSON string
method_details_dto_instance = MethodDetailsDTO.from_json(json)
# print the JSON string representation of the object
print(MethodDetailsDTO.to_json())

# convert the object into a dict
method_details_dto_dict = method_details_dto_instance.to_dict()
# create an instance of MethodDetailsDTO from a dict
method_details_dto_from_dict = MethodDetailsDTO.from_dict(method_details_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


