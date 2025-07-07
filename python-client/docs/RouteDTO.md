# RouteDTO


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**path** | **str** | Route path | 
**component** | **str** | Route component | 
**credentials** | **List[str]** | Required credentials list for this route | [optional] 
**icon** | **str** | Route icon | [optional] 
**title** | **str** | Route title | [optional] 
**description** | **str** | Route description | [optional] 
**rdf_type** | **str** | Route rdf type | [optional] 

## Example

```python
from openapi_client.models.route_dto import RouteDTO

# TODO update the JSON string below
json = "{}"
# create an instance of RouteDTO from a JSON string
route_dto_instance = RouteDTO.from_json(json)
# print the JSON string representation of the object
print(RouteDTO.to_json())

# convert the object into a dict
route_dto_dict = route_dto_instance.to_dict()
# create an instance of RouteDTO from a dict
route_dto_from_dict = RouteDTO.from_dict(route_dto_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


