# AgroportalOntologiesConfigDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**entity_ontologies** | **List[str]** |  | [optional] 
**trait_ontologies** | **List[str]** |  | [optional] 
**method_ontologies** | **List[str]** |  | [optional] 
**unit_ontologies** | **List[str]** |  | [optional] 

## Example

```python
from openapi_client.models.agroportal_ontologies_config_dto import AgroportalOntologiesConfigDTO

# TODO update the JSON string below
json = "{}"
# create an instance of AgroportalOntologiesConfigDTO from a JSON string
agroportal_ontologies_config_dto_instance = AgroportalOntologiesConfigDTO.from_json(json)
# print the JSON string representation of the object
print(AgroportalOntologiesConfigDTO.to_json())

# convert the object into a dict
agroportal_ontologies_config_dto_dict = agroportal_ontologies_config_dto_instance.to_dict()
# create an instance of AgroportalOntologiesConfigDTO from a dict
agroportal_ontologies_config_dto_from_dict = AgroportalOntologiesConfigDTO.from_dict(agroportal_ontologies_config_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


