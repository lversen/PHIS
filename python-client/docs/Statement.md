# Statement


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**boolean** | **bool** |  | [optional] 
**byte** | **bytearray** |  | [optional] 
**short** | **int** |  | [optional] 
**char** | **str** |  | [optional] 
**int** | **int** |  | [optional] 
**long** | **int** |  | [optional] 
**var_float** | **float** |  | [optional] 
**double** | **float** |  | [optional] 
**resource** | [**Resource**](Resource.md) |  | [optional] 
**object** | [**RDFNode**](RDFNode.md) |  | [optional] 
**language** | **str** |  | [optional] 
**string** | **str** |  | [optional] 
**list** | [**RDFList**](RDFList.md) |  | [optional] 
**model** | [**Model**](Model.md) |  | [optional] 
**subject** | [**Resource**](Resource.md) |  | [optional] 
**literal** | [**Literal**](Literal.md) |  | [optional] 
**bag** | [**Bag**](Bag.md) |  | [optional] 
**alt** | [**Alt**](Alt.md) |  | [optional] 
**seq** | [**Seq**](Seq.md) |  | [optional] 
**predicate** | [**ModelProperty**](ModelProperty.md) |  | [optional] 
**reified** | **bool** |  | [optional] 

## Example

```python
from openapi_client.models.statement import Statement

# TODO update the JSON string below
json = "{}"
# create an instance of Statement from a JSON string
statement_instance = Statement.from_json(json)
# print the JSON string representation of the object
print(Statement.to_json())

# convert the object into a dict
statement_dict = statement_instance.to_dict()
# create an instance of Statement from a dict
statement_from_dict = Statement.from_dict(statement_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


