# PropertiesByDomainDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**domain** | **str** |  | [optional] 
**properties** | [**List[ResourceTreeDTO]**](ResourceTreeDTO.md) |  | [optional] 

## Example

```python
from openapi_client.models.properties_by_domain_dto import PropertiesByDomainDTO

# TODO update the JSON string below
json = "{}"
# create an instance of PropertiesByDomainDTO from a JSON string
properties_by_domain_dto_instance = PropertiesByDomainDTO.from_json(json)
# print the JSON string representation of the object
print(PropertiesByDomainDTO.to_json())

# convert the object into a dict
properties_by_domain_dto_dict = properties_by_domain_dto_instance.to_dict()
# create an instance of PropertiesByDomainDTO from a dict
properties_by_domain_dto_from_dict = PropertiesByDomainDTO.from_dict(properties_by_domain_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


