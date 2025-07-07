# DataCSVValidationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**errors** | [**CSVValidationModel**](CSVValidationModel.md) |  | [optional] 
**data_errors** | [**DataCSVValidationModel**](DataCSVValidationModel.md) |  | [optional] 
**size_max** | **int** |  | [optional] 
**validation_token** | **str** |  | [optional] 
**nb_lines_imported** | **int** |  | [optional] 

## Example

```python
from openapi_client.models.data_csv_validation_dto import DataCSVValidationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of DataCSVValidationDTO from a JSON string
data_csv_validation_dto_instance = DataCSVValidationDTO.from_json(json)
# print the JSON string representation of the object
print(DataCSVValidationDTO.to_json())

# convert the object into a dict
data_csv_validation_dto_dict = data_csv_validation_dto_instance.to_dict()
# create an instance of DataCSVValidationDTO from a dict
data_csv_validation_dto_from_dict = DataCSVValidationDTO.from_dict(data_csv_validation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


