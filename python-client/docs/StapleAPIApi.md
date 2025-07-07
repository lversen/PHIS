# openapi_client.StapleAPIApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**export_ontology_file**](StapleAPIApi.md#export_ontology_file) | **GET** /staple/ontology_file | Export ontology file for Staple API as turtle syntax
[**get_resource_graphs**](StapleAPIApi.md#get_resource_graphs) | **GET** /staple/resource_graph | Get all graphs associated with resources


# **export_ontology_file**
> export_ontology_file()

Export ontology file for Staple API as turtle syntax

### Example


```python
import openapi_client
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
    api_instance = openapi_client.StapleAPIApi(api_client)

    try:
        # Export ontology file for Staple API as turtle syntax
        api_instance.export_ontology_file()
    except Exception as e:
        print("Exception when calling StapleAPIApi->export_ontology_file: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**0** | successful operation |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_resource_graphs**
> get_resource_graphs()

Get all graphs associated with resources

### Example


```python
import openapi_client
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
    api_instance = openapi_client.StapleAPIApi(api_client)

    try:
        # Get all graphs associated with resources
        api_instance.get_resource_graphs()
    except Exception as e:
        print("Exception when calling StapleAPIApi->get_resource_graphs: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**0** | successful operation |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

