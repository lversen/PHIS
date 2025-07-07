# SPARQLModelRelation


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**graph** | **str** |  | [optional] 
**var_property** | [**ModelProperty**](ModelProperty.md) |  | [optional] 
**value** | **str** |  | [optional] 
**reverse** | **bool** |  | [optional] 

## Example

```python
from openapi_client.models.sparql_model_relation import SPARQLModelRelation

# TODO update the JSON string below
json = "{}"
# create an instance of SPARQLModelRelation from a JSON string
sparql_model_relation_instance = SPARQLModelRelation.from_json(json)
# print the JSON string representation of the object
print(SPARQLModelRelation.to_json())

# convert the object into a dict
sparql_model_relation_dict = sparql_model_relation_instance.to_dict()
# create an instance of SPARQLModelRelation from a dict
sparql_model_relation_from_dict = SPARQLModelRelation.from_dict(sparql_model_relation_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


