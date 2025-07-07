# ObjectUriResponse


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**metadata** | [**MetadataDTO**](MetadataDTO.md) |  | [optional] 
**result** | **str** |  | [optional] 

## Example

```python
from openapi_client.models.object_uri_response import ObjectUriResponse

# TODO update the JSON string below
json = "{}"
# create an instance of ObjectUriResponse from a JSON string
object_uri_response_instance = ObjectUriResponse.from_json(json)
# print the JSON string representation of the object
print(ObjectUriResponse.to_json())

# convert the object into a dict
object_uri_response_dict = object_uri_response_instance.to_dict()
# create an instance of ObjectUriResponse from a dict
object_uri_response_from_dict = ObjectUriResponse.from_dict(object_uri_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


