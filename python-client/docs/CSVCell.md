# CSVCell


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**row_index** | **int** |  | [optional] 
**col_index** | **int** |  | [optional] 
**header** | **str** |  | [optional] 
**value** | **str** |  | [optional] 
**message** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.csv_cell import CSVCell

# TODO update the JSON string below
json = "{}"
# create an instance of CSVCell from a JSON string
csv_cell_instance = CSVCell.from_json(json)
# print the JSON string representation of the object
print(CSVCell.to_json())

# convert the object into a dict
csv_cell_dict = csv_cell_instance.to_dict()
# create an instance of CSVCell from a dict
csv_cell_from_dict = CSVCell.from_dict(csv_cell_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


