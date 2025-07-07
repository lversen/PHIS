# openapi_client.AgroportalAPIApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_agroportal_ontologies**](AgroportalAPIApi.md#get_agroportal_ontologies) | **GET** /core/agroportal/ontologies | Get ontologies from agroportal
[**ping_agroportal**](AgroportalAPIApi.md#ping_agroportal) | **GET** /core/agroportal/ping | Ping agroportal server
[**search_through_agroportal**](AgroportalAPIApi.md#search_through_agroportal) | **GET** /core/agroportal/search | Search through agroportal


# **get_agroportal_ontologies**
> List[OntologyAgroportalDTO] get_agroportal_ontologies(authorization, name=name, ontologies=ontologies, accept_language=accept_language)

Get ontologies from agroportal

### Example


```python
import openapi_client
from openapi_client.models.ontology_agroportal_dto import OntologyAgroportalDTO
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
    api_instance = openapi_client.AgroportalAPIApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = '.*' # str | Name (regex) (optional) (default to '.*')
    ontologies = ['AGROVOC'] # List[str] | List of ontologies to get (acronyms) (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get ontologies from agroportal
        api_response = api_instance.get_agroportal_ontologies(authorization, name=name, ontologies=ontologies, accept_language=accept_language)
        print("The response of AgroportalAPIApi->get_agroportal_ontologies:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AgroportalAPIApi->get_agroportal_ontologies: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Name (regex) | [optional] [default to &#39;.*&#39;]
 **ontologies** | [**List[str]**](str.md)| List of ontologies to get (acronyms) | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[OntologyAgroportalDTO]**](OntologyAgroportalDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return ontologies |  -  |
**500** | Internal Server Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ping_agroportal**
> bool ping_agroportal(authorization, timeout=timeout, accept_language=accept_language)

Ping agroportal server

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
    api_instance = openapi_client.AgroportalAPIApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    timeout = 1000 # int | Timeout (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Ping agroportal server
        api_response = api_instance.ping_agroportal(authorization, timeout=timeout, accept_language=accept_language)
        print("The response of AgroportalAPIApi->ping_agroportal:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AgroportalAPIApi->ping_agroportal: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **timeout** | **int**| Timeout | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Agroportal status |  -  |
**500** | Internal Server Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_through_agroportal**
> List[AgroportalTermDTO] search_through_agroportal(authorization, name=name, ontologies=ontologies, accept_language=accept_language)

Search through agroportal

### Example


```python
import openapi_client
from openapi_client.models.agroportal_term_dto import AgroportalTermDTO
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
    api_instance = openapi_client.AgroportalAPIApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = 'plant' # str | Name (regex) (optional)
    ontologies = ['AGROVOC'] # List[str] | List of ontologies (acronym) (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search through agroportal
        api_response = api_instance.search_through_agroportal(authorization, name=name, ontologies=ontologies, accept_language=accept_language)
        print("The response of AgroportalAPIApi->search_through_agroportal:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AgroportalAPIApi->search_through_agroportal: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Name (regex) | [optional] 
 **ontologies** | [**List[str]**](str.md)| List of ontologies (acronym) | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[AgroportalTermDTO]**](AgroportalTermDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return entities |  -  |
**500** | Internal Server Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

