# Faidarev1GermplasmListResponse


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**metadata** | [**MetadataDTO**](MetadataDTO.md) |  | [optional] 
**result** | [**BrapiDataResponsePartListFaidarev1GermplasmDTO**](BrapiDataResponsePartListFaidarev1GermplasmDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.faidarev1_germplasm_list_response import Faidarev1GermplasmListResponse

# TODO update the JSON string below
json = "{}"
# create an instance of Faidarev1GermplasmListResponse from a JSON string
faidarev1_germplasm_list_response_instance = Faidarev1GermplasmListResponse.from_json(json)
# print the JSON string representation of the object
print(Faidarev1GermplasmListResponse.to_json())

# convert the object into a dict
faidarev1_germplasm_list_response_dict = faidarev1_germplasm_list_response_instance.to_dict()
# create an instance of Faidarev1GermplasmListResponse from a dict
faidarev1_germplasm_list_response_from_dict = Faidarev1GermplasmListResponse.from_dict(faidarev1_germplasm_list_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


