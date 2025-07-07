# GermplasmGroupUpdateDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | 
**name** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**germplasm_list** | **List[str]** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.germplasm_group_update_dto import GermplasmGroupUpdateDTO

# TODO update the JSON string below
json = "{}"
# create an instance of GermplasmGroupUpdateDTO from a JSON string
germplasm_group_update_dto_instance = GermplasmGroupUpdateDTO.from_json(json)
# print the JSON string representation of the object
print(GermplasmGroupUpdateDTO.to_json())

# convert the object into a dict
germplasm_group_update_dto_dict = germplasm_group_update_dto_instance.to_dict()
# create an instance of GermplasmGroupUpdateDTO from a dict
germplasm_group_update_dto_from_dict = GermplasmGroupUpdateDTO.from_dict(germplasm_group_update_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


