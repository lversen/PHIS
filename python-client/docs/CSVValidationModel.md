# CSVValidationModel


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**missing_headers** | **List[str]** |  | [optional] 
**empty_headers** | **List[int]** |  | [optional] 
**invalid_header_uris** | **Dict[str, str]** |  | [optional] 
**datatype_errors** | **Dict[str, List[CSVDatatypeError]]** |  | [optional] 
**uri_not_found_errors** | **Dict[str, List[CSVURINotFoundError]]** |  | [optional] 
**invalid_uri_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**missing_required_value_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**invalid_value_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**already_existing_uri_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**duplicate_uri_errors** | **Dict[str, List[CSVDuplicateURIError]]** |  | [optional] 
**invalid_row_size_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**invalid_date_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**nb_object_imported** | **int** |  | [optional] 
**validation_token** | **str** |  | [optional] 
**csv_header** | [**CsvHeader**](CsvHeader.md) |  | [optional] 

## Example

```python
from openapi_client.models.csv_validation_model import CSVValidationModel

# TODO update the JSON string below
json = "{}"
# create an instance of CSVValidationModel from a JSON string
csv_validation_model_instance = CSVValidationModel.from_json(json)
# print the JSON string representation of the object
print(CSVValidationModel.to_json())

# convert the object into a dict
csv_validation_model_dict = csv_validation_model_instance.to_dict()
# create an instance of CSVValidationModel from a dict
csv_validation_model_from_dict = CSVValidationModel.from_dict(csv_validation_model_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


