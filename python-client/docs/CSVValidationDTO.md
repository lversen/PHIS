# CSVValidationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**errors** | [**CSVValidationModel**](CSVValidationModel.md) |  | [optional] 
**validation_token** | **str** |  | [optional] 
**nb_lines_imported** | **int** |  | [optional] 

## Example

```python
from openapi_client.models.csv_validation_dto import CSVValidationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of CSVValidationDTO from a JSON string
csv_validation_dto_instance = CSVValidationDTO.from_json(json)
# print the JSON string representation of the object
print(CSVValidationDTO.to_json())

# convert the object into a dict
csv_validation_dto_dict = csv_validation_dto_instance.to_dict()
# create an instance of CSVValidationDTO from a dict
csv_validation_dto_from_dict = CSVValidationDTO.from_dict(csv_validation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


