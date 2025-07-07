# GermplasmGroupCreationDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uri** | **str** |  | [optional] 
**name** | **str** |  | [optional] 
**description** | **str** |  | [optional] 
**germplasm_list** | **List[str]** |  | [optional] 
**publisher** | [**UserGetDTO**](UserGetDTO.md) |  | [optional] 
**publication_date** | **datetime** |  | [optional] 
**last_updated_date** | **datetime** |  | [optional] 

## Example

```python
from openapi_client.models.germplasm_group_creation_dto import GermplasmGroupCreationDTO

# TODO update the JSON string below
json = "{}"
# create an instance of GermplasmGroupCreationDTO from a JSON string
germplasm_group_creation_dto_instance = GermplasmGroupCreationDTO.from_json(json)
# print the JSON string representation of the object
print(GermplasmGroupCreationDTO.to_json())

# convert the object into a dict
germplasm_group_creation_dto_dict = germplasm_group_creation_dto_instance.to_dict()
# create an instance of GermplasmGroupCreationDTO from a dict
germplasm_group_creation_dto_from_dict = GermplasmGroupCreationDTO.from_dict(germplasm_group_creation_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


