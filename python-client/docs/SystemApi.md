# openapi_client.SystemApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_version_info**](SystemApi.md#get_version_info) | **GET** /core/system/info | get system information


# **get_version_info**
> VersionInfoDTO get_version_info()

get system information

### Example


```python
import openapi_client
from openapi_client.models.version_info_dto import VersionInfoDTO
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
    api_instance = openapi_client.SystemApi(api_client)

    try:
        # get system information
        api_response = api_instance.get_version_info()
        print("The response of SystemApi->get_version_info:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SystemApi->get_version_info: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

### Return type

[**VersionInfoDTO**](VersionInfoDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return API version info |  -  |
**500** | Internal Server Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

