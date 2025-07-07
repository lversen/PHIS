# BrAPIv1MethodDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**description** | **str** |  | [optional] 
**formula** | **str** |  | [optional] 
**method_db_id** | **str** |  | [optional] 
**method_name** | **str** |  | [optional] 
**ontology_reference** | [**BrAPIv1OntologyReferenceDTO**](BrAPIv1OntologyReferenceDTO.md) |  | [optional] 
**reference** | **str** |  | [optional] 
**var_class** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_method_dto import BrAPIv1MethodDTO

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1MethodDTO from a JSON string
br_apiv1_method_dto_instance = BrAPIv1MethodDTO.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1MethodDTO.to_json())

# convert the object into a dict
br_apiv1_method_dto_dict = br_apiv1_method_dto_instance.to_dict()
# create an instance of BrAPIv1MethodDTO from a dict
br_apiv1_method_dto_from_dict = BrAPIv1MethodDTO.from_dict(br_apiv1_method_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


