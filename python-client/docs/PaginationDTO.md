# PaginationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**page_size** | **int** |  | [optional] 
**current_page** | **int** |  | [optional] 
**total_count** | **int** |  | [optional] 
**total_pages** | **int** |  | [optional] 
**limit_count** | **int** |  | [optional] 
**has_next_page** | **bool** |  | [optional] 

## Example

```python
from openapi_client.models.pagination_dto import PaginationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of PaginationDTO from a JSON string
pagination_dto_instance = PaginationDTO.from_json(json)
# print the JSON string representation of the object
print(PaginationDTO.to_json())

# convert the object into a dict
pagination_dto_dict = pagination_dto_instance.to_dict()
# create an instance of PaginationDTO from a dict
pagination_dto_from_dict = PaginationDTO.from_dict(pagination_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


