# CsvHeader


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**columns** | **List[str]** |  | [optional] 
**real_csv_header_length** | **int** |  | [optional] 

## Example

```python
from openapi_client.models.csv_header import CsvHeader

# TODO update the JSON string below
json = "{}"
# create an instance of CsvHeader from a JSON string
csv_header_instance = CsvHeader.from_json(json)
# print the JSON string representation of the object
print(CsvHeader.to_json())

# convert the object into a dict
csv_header_dict = csv_header_instance.to_dict()
# create an instance of CsvHeader from a dict
csv_header_from_dict = CsvHeader.from_dict(csv_header_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


