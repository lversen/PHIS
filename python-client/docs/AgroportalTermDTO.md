# AgroportalTermDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **str** |  | 
**name** | **str** |  | [optional] 
**synonym** | **List[str]** |  | [optional] 
**definitions** | **List[str]** |  | [optional] 
**ontology_name** | **str** |  | 
**obsolete** | **bool** |  | [optional] 
**type** | **str** |  | [optional] 
**links** | [**AgroportalLinksModel**](AgroportalLinksModel.md) |  | [optional] 

## Example

```python
from openapi_client.models.agroportal_term_dto import AgroportalTermDTO

# TODO update the JSON string below
json = "{}"
# create an instance of AgroportalTermDTO from a JSON string
agroportal_term_dto_instance = AgroportalTermDTO.from_json(json)
# print the JSON string representation of the object
print(AgroportalTermDTO.to_json())

# convert the object into a dict
agroportal_term_dto_dict = agroportal_term_dto_instance.to_dict()
# create an instance of AgroportalTermDTO from a dict
agroportal_term_dto_from_dict = AgroportalTermDTO.from_dict(agroportal_term_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


