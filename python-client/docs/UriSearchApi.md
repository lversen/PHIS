# openapi_client.UriSearchApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**search_by_uri**](UriSearchApi.md#search_by_uri) | **GET** /core/uri_search/{uri} | Get a list of objects that match the passed URI


# **search_by_uri**
> URIGlobalSearchDTO search_by_uri(uri, authorization, accept_language=accept_language)

Get a list of objects that match the passed URI

### Example


```python
import openapi_client
from openapi_client.models.uri_global_search_dto import URIGlobalSearchDTO
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
    api_instance = openapi_client.UriSearchApi(api_client)
    uri = 'http://www.phenome-fppn.fr/id/species/zeamays' # str | URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a list of objects that match the passed URI
        api_response = api_instance.search_by_uri(uri, authorization, accept_language=accept_language)
        print("The response of UriSearchApi->search_by_uri:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling UriSearchApi->search_by_uri: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**URIGlobalSearchDTO**](URIGlobalSearchDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return dto list |  -  |
**400** | Bad user request |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

