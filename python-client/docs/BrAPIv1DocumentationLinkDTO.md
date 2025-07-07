# BrAPIv1DocumentationLinkDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **str** |  | [optional] 
**url** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.br_apiv1_documentation_link_dto import BrAPIv1DocumentationLinkDTO

# TODO update the JSON string below
json = "{}"
# create an instance of BrAPIv1DocumentationLinkDTO from a JSON string
br_apiv1_documentation_link_dto_instance = BrAPIv1DocumentationLinkDTO.from_json(json)
# print the JSON string representation of the object
print(BrAPIv1DocumentationLinkDTO.to_json())

# convert the object into a dict
br_apiv1_documentation_link_dto_dict = br_apiv1_documentation_link_dto_instance.to_dict()
# create an instance of BrAPIv1DocumentationLinkDTO from a dict
br_apiv1_documentation_link_dto_from_dict = BrAPIv1DocumentationLinkDTO.from_dict(br_apiv1_documentation_link_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


