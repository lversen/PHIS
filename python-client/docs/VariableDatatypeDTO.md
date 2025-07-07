# VariableDatatypeDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.variable_datatype_dto import VariableDatatypeDTO

# TODO update the JSON string below
json = "{}"
# create an instance of VariableDatatypeDTO from a JSON string
variable_datatype_dto_instance = VariableDatatypeDTO.from_json(json)
# print the JSON string representation of the object
print(VariableDatatypeDTO.to_json())

# convert the object into a dict
variable_datatype_dto_dict = variable_datatype_dto_instance.to_dict()
# create an instance of VariableDatatypeDTO from a dict
variable_datatype_dto_from_dict = VariableDatatypeDTO.from_dict(variable_datatype_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


