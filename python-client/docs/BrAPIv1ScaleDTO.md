# BrAPIv1ScaleDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**data_type** | **str** |  | [optional] 
**decimal_places** | **str** |  | [optional] 
**ontology_reference** | [**BrAPIv1OntologyReferenceDTO**](BrAPIv1OntologyReferenceDTO.md) |  | [optional] 
**scale_db_id** | **str** |  | [optional] 
**scale_name** | **str** |  | [optional] 
**valid_values** | **str** |  | [optional] 
**xref** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_scale_dto import BrAPIv1ScaleDTO

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1ScaleDTO from a JSON string
br_apiv1_scale_dto_instance = BrAPIv1ScaleDTO.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1ScaleDTO.to_json())

# convert the object into a dict
br_apiv1_scale_dto_dict = br_apiv1_scale_dto_instance.to_dict()
# create an instance of BrAPIv1ScaleDTO from a dict
br_apiv1_scale_dto_from_dict = BrAPIv1ScaleDTO.from_dict(br_apiv1_scale_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


