# OWLClassPropertyRestrictionDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**required** | **bool** |  | [optional] 
**list** | **bool** |  | [optional] 
**rdf_type** | **str** | RDF type | 
**domain** | **str** | Domain URI | 
**var_property** | **str** | Property URI | 

## Example

```python
from openapi_client.models.owl_class_property_restriction_dto import OWLClassPropertyRestrictionDTO

# TODO update the JSON string below
json = "{}"
# create an instance of OWLClassPropertyRestrictionDTO from a JSON string
owl_class_property_restriction_dto_instance = OWLClassPropertyRestrictionDTO.from_json(json)
# print the JSON string representation of the object
print(OWLClassPropertyRestrictionDTO.to_json())

# convert the object into a dict
owl_class_property_restriction_dto_dict = owl_class_property_restriction_dto_instance.to_dict()
# create an instance of OWLClassPropertyRestrictionDTO from a dict
owl_class_property_restriction_dto_from_dict = OWLClassPropertyRestrictionDTO.from_dict(owl_class_property_restriction_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


