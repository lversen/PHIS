# ScientificObjectExportDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**included_uris** | **List[str]** |  | [optional] 
**page** | **int** | Page number | [optional] 
**lang** | **str** |  | [optional] 
**rdf_types** | **List[str]** |  | [optional] 
**order_by** | [**List[OrderBy]**](OrderBy.md) | List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
**page_size** | **int** | Page size | [optional] 
**uris** | **List[str]** |  | [optional] 
**excluded_uris** | **List[str]** |  | [optional] 
**experiment** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**parent** | **str** |  | [optional] 
**germplasm** | **List[str]** |  | [optional] 
**factor_levels** | **List[str]** |  | [optional] 
**facility** | **str** |  | [optional] 
**existence_date** | **date** |  | [optional] 
**creation_date** | **date** |  | [optional] 

## Example

```python
from openapi_client.models.scientific_object_export_dto import ScientificObjectExportDTO

# TODO update the JSON string below
json = "{}"
# create an instance of ScientificObjectExportDTO from a JSON string
scientific_object_export_dto_instance = ScientificObjectExportDTO.from_json(json)
# print the JSON string representation of the object
print(ScientificObjectExportDTO.to_json())

# convert the object into a dict
scientific_object_export_dto_dict = scientific_object_export_dto_instance.to_dict()
# create an instance of ScientificObjectExportDTO from a dict
scientific_object_export_dto_from_dict = ScientificObjectExportDTO.from_dict(scientific_object_export_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


