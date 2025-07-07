# SPARQLLabel


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**default_value** | **str** |  | [optional] 
**default_lang** | **str** |  | [optional] 
**translations** | **Dict[str, str]** |  | [optional] 
**all_translations** | **Dict[str, str]** |  | [optional] 

## Example

```python
from openapi_client.models.sparql_label import SPARQLLabel

# TODO update the JSON string below
json = "{}"
# create an instance of SPARQLLabel from a JSON string
sparql_label_instance = SPARQLLabel.from_json(json)
# print the JSON string representation of the object
print(SPARQLLabel.to_json())

# convert the object into a dict
sparql_label_dict = sparql_label_instance.to_dict()
# create an instance of SPARQLLabel from a dict
sparql_label_from_dict = SPARQLLabel.from_dict(sparql_label_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


