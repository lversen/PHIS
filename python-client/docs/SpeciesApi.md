# openapi_client.SpeciesApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_all_species**](SpeciesApi.md#get_all_species) | **GET** /core/species | get species (no pagination)


# **get_all_species**
> List[SpeciesDTO] get_all_species(shared_resource_instance=shared_resource_instance, accept_language=accept_language)

get species (no pagination)

### Example


```python
import openapi_client
from openapi_client.models.species_dto import SpeciesDTO
from openapi_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost
# See configuration.py for a list of all supported configuration parameters.
configuration = openapi_client.Configuration(
    host = "http://localhost"
)


# Enter a context with an instance of the API client
with openapi_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = openapi_client.SpeciesApi(api_client)
    shared_resource_instance = 'shared_resource_instance_example' # str | Shared resource instance URI (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # get species (no pagination)
        api_response = api_instance.get_all_species(shared_resource_instance=shared_resource_instance, accept_language=accept_language)
        print("The response of SpeciesApi->get_all_species:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SpeciesApi->get_all_species: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **shared_resource_instance** | **str**| Shared resource instance URI | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[SpeciesDTO]**](SpeciesDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return Species list |  -  |
**500** | Internal Server Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

