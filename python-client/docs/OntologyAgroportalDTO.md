# OntologyAgroportalDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **str** |  | 
**name** | **str** |  | [optional] 
**acronym** | **str** |  | 

## Example

```python
from openapi_client.models.ontology_agroportal_dto import OntologyAgroportalDTO

# TODO update the JSON string below
json = "{}"
# create an instance of OntologyAgroportalDTO from a JSON string
ontology_agroportal_dto_instance = OntologyAgroportalDTO.from_json(json)
# print the JSON string representation of the object
print(OntologyAgroportalDTO.to_json())

# convert the object into a dict
ontology_agroportal_dto_dict = ontology_agroportal_dto_instance.to_dict()
# create an instance of OntologyAgroportalDTO from a dict
ontology_agroportal_dto_from_dict = OntologyAgroportalDTO.from_dict(ontology_agroportal_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


