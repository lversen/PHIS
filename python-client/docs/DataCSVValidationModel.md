# DataCSVValidationModel


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
**invalid_object_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**invalid_annotation_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**invalid_target_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**invalid_data_type_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**invalid_experiment_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**invalid_device_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**device_choice_ambiguity_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**duplicated_data_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**duplicated_object_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**duplicated_target_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**duplicated_experiment_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**duplicated_device_errors** | **Dict[str, List[CSVCell]]** |  | [optional] 
**headers** | **List[str]** |  | [optional] 
**headers_labels** | **List[str]** |  | [optional] 
**annotations_on_objects** | [**List[AnnotationModel]**](AnnotationModel.md) |  | [optional] 
**nb_lines_imported** | **int** |  | [optional] 
**nb_lines_to_import** | **int** |  | [optional] 
**validation_step** | **bool** |  | [optional] 
**insertion_step** | **bool** |  | [optional] 
**valid_csv** | **bool** |  | [optional] 
**too_large_dataset** | **bool** |  | [optional] 
**error_message** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.data_csv_validation_model import DataCSVValidationModel

# TODO update the JSON string below
json = "{}"
# create an instance of DataCSVValidationModel from a JSON string
data_csv_validation_model_instance = DataCSVValidationModel.from_json(json)
# print the JSON string representation of the object
print(DataCSVValidationModel.to_json())

# convert the object into a dict
data_csv_validation_model_dict = data_csv_validation_model_instance.to_dict()
# create an instance of DataCSVValidationModel from a dict
data_csv_validation_model_from_dict = DataCSVValidationModel.from_dict(data_csv_validation_model_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


