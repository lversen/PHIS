# Alt


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**default** | [**RDFNode**](RDFNode.md) |  | [optional] 
**default_language** | **str** |  | [optional] 
**default_resource** | [**Resource**](Resource.md) |  | [optional] 
**default_literal** | [**Literal**](Literal.md) |  | [optional] 
**default_boolean** | **bool** |  | [optional] 
**default_byte** | **bytearray** |  | [optional] 
**default_short** | **int** |  | [optional] 
**default_int** | **int** |  | [optional] 
**default_long** | **int** |  | [optional] 
**default_char** | **str** |  | [optional] 
**default_float** | **float** |  | [optional] 
**default_double** | **float** |  | [optional] 
**default_string** | **str** |  | [optional] 
**default_alt** | [**Alt**](Alt.md) |  | [optional] 
**default_bag** | [**Bag**](Bag.md) |  | [optional] 
**default_seq** | [**Seq**](Seq.md) |  | [optional] 
**alt** | **bool** |  | [optional] 
**seq** | **bool** |  | [optional] 
**bag** | **bool** |  | [optional] 
**id** | [**AnonId**](AnonId.md) |  | [optional] 
**uri** | **str** |  | [optional] 
**local_name** | **str** |  | [optional] 
**name_space** | **str** |  | [optional] 
**stmt_term** | [**Statement**](Statement.md) |  | [optional] 
**resource** | **bool** |  | [optional] 
**model** | [**Model**](Model.md) |  | [optional] 
**literal** | **bool** |  | [optional] 
**anon** | **bool** |  | [optional] 
**uriresource** | **bool** |  | [optional] 
**stmt_resource** | **bool** |  | [optional] 

## Example

```python
from openapi_client.models.alt import Alt

# TODO update the JSON string below
json = "{}"
# create an instance of Alt from a JSON string
alt_instance = Alt.from_json(json)
# print the JSON string representation of the object
print(Alt.to_json())

# convert the object into a dict
alt_dict = alt_instance.to_dict()
# create an instance of Alt from a dict
alt_from_dict = Alt.from_dict(alt_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


