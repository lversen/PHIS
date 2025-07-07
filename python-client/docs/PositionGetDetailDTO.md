# PositionGetDetailDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**point** | [**Point**](Point.md) |  | [optional] 
**x** | **str** |  | [optional] 
**y** | **str** |  | [optional] 
**z** | **str** |  | [optional] 
**text** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.position_get_detail_dto import PositionGetDetailDTO

# TODO update the JSON string below
json = "{}"
# create an instance of PositionGetDetailDTO from a JSON string
position_get_detail_dto_instance = PositionGetDetailDTO.from_json(json)
# print the JSON string representation of the object
print(PositionGetDetailDTO.to_json())

# convert the object into a dict
position_get_detail_dto_dict = position_get_detail_dto_instance.to_dict()
# create an instance of PositionGetDetailDTO from a dict
position_get_detail_dto_from_dict = PositionGetDetailDTO.from_dict(position_get_detail_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


