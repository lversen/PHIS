# CharacteristicCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | 
**description** | **str** |  | [optional] 
**exact_match** | **List[str]** |  | [optional] 
**close_match** | **List[str]** |  | [optional] 
**broad_match** | **List[str]** |  | [optional] 
**narrow_match** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.characteristic_creation_dto import CharacteristicCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of CharacteristicCreationDTO from a JSON string
characteristic_creation_dto_instance = CharacteristicCreationDTO.from_json(json)
# print the JSON string representation of the object
print(CharacteristicCreationDTO.to_json())

# convert the object into a dict
characteristic_creation_dto_dict = characteristic_creation_dto_instance.to_dict()
# create an instance of CharacteristicCreationDTO from a dict
characteristic_creation_dto_from_dict = CharacteristicCreationDTO.from_dict(characteristic_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


