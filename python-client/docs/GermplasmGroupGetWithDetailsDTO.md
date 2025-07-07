# GermplasmGroupGetWithDetailsDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 
**germplasm_count** | **int** |  | [optional] 
**germplasm_list** | [**List[GermplasmGetAllDTO]**](GermplasmGetAllDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.germplasm_group_get_with_details_dto import GermplasmGroupGetWithDetailsDTO

# TODO update the JSON string below
json = "{}"
# create an instance of GermplasmGroupGetWithDetailsDTO from a JSON string
germplasm_group_get_with_details_dto_instance = GermplasmGroupGetWithDetailsDTO.from_json(json)
# print the JSON string representation of the object
print(GermplasmGroupGetWithDetailsDTO.to_json())

# convert the object into a dict
germplasm_group_get_with_details_dto_dict = germplasm_group_get_with_details_dto_instance.to_dict()
# create an instance of GermplasmGroupGetWithDetailsDTO from a dict
germplasm_group_get_with_details_dto_from_dict = GermplasmGroupGetWithDetailsDTO.from_dict(germplasm_group_get_with_details_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


