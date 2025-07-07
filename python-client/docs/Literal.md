# Literal


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
**value** | **object** |  | [optional] 
**language** | **str** |  | [optional] 
**string** | **str** |  | [optional] 
**well_formed_xml** | **bool** |  | [optional] 
**datatype** | [**RDFDatatype**](RDFDatatype.md) |  | [optional] 
**datatype_uri** | **str** |  | [optional] 
**lexical_form** | **str** |  | [optional] 
**resource** | **bool** |  | [optional] 
**model** | [**Model**](Model.md) |  | [optional] 
**literal** | **bool** |  | [optional] 
**anon** | **bool** |  | [optional] 
**uriresource** | **bool** |  | [optional] 
**stmt_resource** | **bool** |  | [optional] 

## Example

```python
from openapi_client.models.literal import Literal

# TODO update the JSON string below
json = "{}"
# create an instance of Literal from a JSON string
literal_instance = Literal.from_json(json)
# print the JSON string representation of the object
print(Literal.to_json())

# convert the object into a dict
literal_dict = literal_instance.to_dict()
# create an instance of Literal from a dict
literal_from_dict = Literal.from_dict(literal_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


