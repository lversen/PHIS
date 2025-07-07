# BrAPIv1OntologyReferenceDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**documentation_links** | [**List[BrAPIv1DocumentationLinkDTO]**](BrAPIv1DocumentationLinkDTO.md) |  | [optional] 
**ontology_db_id** | **str** |  | [optional] 
**ontology_name** | **str** |  | [optional] 
**version** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_ontology_reference_dto import BrAPIv1OntologyReferenceDTO

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1OntologyReferenceDTO from a JSON string
br_apiv1_ontology_reference_dto_instance = BrAPIv1OntologyReferenceDTO.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1OntologyReferenceDTO.to_json())

# convert the object into a dict
br_apiv1_ontology_reference_dto_dict = br_apiv1_ontology_reference_dto_instance.to_dict()
# create an instance of BrAPIv1OntologyReferenceDTO from a dict
br_apiv1_ontology_reference_dto_from_dict = BrAPIv1OntologyReferenceDTO.from_dict(br_apiv1_ontology_reference_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


