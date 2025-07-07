# SpeciesDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.species_dto import SpeciesDTO

# TODO update the JSON string below
json = "{}"
# create an instance of SpeciesDTO from a JSON string
species_dto_instance = SpeciesDTO.from_json(json)
# print the JSON string representation of the object
print(SpeciesDTO.to_json())

# convert the object into a dict
species_dto_dict = species_dto_instance.to_dict()
# create an instance of SpeciesDTO from a dict
species_dto_from_dict = SpeciesDTO.from_dict(species_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


