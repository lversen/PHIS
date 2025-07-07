# CharacteristicGetDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.characteristic_get_dto import CharacteristicGetDTO

# TODO update the JSON string below
json = "{}"
# create an instance of CharacteristicGetDTO from a JSON string
characteristic_get_dto_instance = CharacteristicGetDTO.from_json(json)
# print the JSON string representation of the object
print(CharacteristicGetDTO.to_json())

# convert the object into a dict
characteristic_get_dto_dict = characteristic_get_dto_instance.to_dict()
# create an instance of CharacteristicGetDTO from a dict
characteristic_get_dto_from_dict = CharacteristicGetDTO.from_dict(characteristic_get_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


