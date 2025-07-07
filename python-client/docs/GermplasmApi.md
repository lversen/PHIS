# openapi_client.GermplasmApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_germplasm**](GermplasmApi.md#create_germplasm) | **POST** /core/germplasm | Add a germplasm
[**create_germplasm_group**](GermplasmApi.md#create_germplasm_group) | **POST** /core/germplasm_group | Add a germplasm group
[**delete_germplasm**](GermplasmApi.md#delete_germplasm) | **DELETE** /core/germplasm/{uri} | Delete a germplasm
[**delete_germplasm_group**](GermplasmApi.md#delete_germplasm_group) | **DELETE** /core/germplasm_group/{uri} | Delete a germplasm group
[**export_germplasm**](GermplasmApi.md#export_germplasm) | **POST** /core/germplasm/export | export germplasm
[**get_germplasm**](GermplasmApi.md#get_germplasm) | **GET** /core/germplasm/{uri} | Get a germplasm
[**get_germplasm_attribute_values**](GermplasmApi.md#get_germplasm_attribute_values) | **GET** /core/germplasm/attributes/{attribute} | Get attribute values of all germplasm for a given attribute
[**get_germplasm_attributes**](GermplasmApi.md#get_germplasm_attributes) | **GET** /core/germplasm/attributes | Get attributes of all germplasm
[**get_germplasm_experiments**](GermplasmApi.md#get_germplasm_experiments) | **GET** /core/germplasm/{uri}/experiments | Get experiments where a germplasm has been used
[**get_germplasm_group**](GermplasmApi.md#get_germplasm_group) | **GET** /core/germplasm_group/{uri} | Get a germplasm group
[**get_germplasm_group_by_uris**](GermplasmApi.md#get_germplasm_group_by_uris) | **GET** /core/germplasm_group/by-uris | Get germplasm groups by their URIs
[**get_germplasm_group_content**](GermplasmApi.md#get_germplasm_group_content) | **GET** /core/germplasm_group/{uri}/germplasm | Get a germplasm group&#39;s germplasm, paginated
[**get_germplasm_group_with_germplasms**](GermplasmApi.md#get_germplasm_group_with_germplasms) | **GET** /core/germplasm_group/with-germplasm/{uri} | Get a germplasm group with nested germplasm details
[**get_germplasms_by_uri**](GermplasmApi.md#get_germplasms_by_uri) | **POST** /core/germplasm/by_uris | Get a list of germplasms by their URIs
[**search_germplasm**](GermplasmApi.md#search_germplasm) | **GET** /core/germplasm | Search germplasm
[**search_germplasm_groups**](GermplasmApi.md#search_germplasm_groups) | **POST** /core/germplasm_group/search | Search germplasm groups
[**update_germplasm**](GermplasmApi.md#update_germplasm) | **PUT** /core/germplasm | Update a germplasm
[**update_germplasm_group**](GermplasmApi.md#update_germplasm_group) | **PUT** /core/germplasm_group | Update a germplasm group


# **create_germplasm**
> str create_germplasm(authorization, check_only=check_only, accept_language=accept_language, body=body)

Add a germplasm

### Example


```python
import openapi_client
from openapi_client.models.germplasm_creation_dto import GermplasmCreationDTO
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
    api_instance = openapi_client.GermplasmApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    check_only = False # bool | Checking only (optional) (default to False)
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.GermplasmCreationDTO() # GermplasmCreationDTO | Germplasm description (optional)

    try:
        # Add a germplasm
        api_response = api_instance.create_germplasm(authorization, check_only=check_only, accept_language=accept_language, body=body)
        print("The response of GermplasmApi->create_germplasm:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->create_germplasm: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **check_only** | **bool**| Checking only | [optional] [default to False]
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**GermplasmCreationDTO**](GermplasmCreationDTO.md)| Germplasm description | [optional] 

### Return type

**str**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**201** | Add a germplasm (variety, accession, plantMaterialLot) |  -  |
**400** | Bad user request |  -  |
**409** | A germplasm with the same URI already exists |  -  |
**500** | Internal Server Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_germplasm_group**
> str create_germplasm_group(authorization, accept_language=accept_language, body=body)

Add a germplasm group

### Example


```python
import openapi_client
from openapi_client.models.germplasm_group_creation_dto import GermplasmGroupCreationDTO
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
    api_instance = openapi_client.GermplasmApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.GermplasmGroupCreationDTO() # GermplasmGroupCreationDTO | Germplasm group description (optional)

    try:
        # Add a germplasm group
        api_response = api_instance.create_germplasm_group(authorization, accept_language=accept_language, body=body)
        print("The response of GermplasmApi->create_germplasm_group:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->create_germplasm_group: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**GermplasmGroupCreationDTO**](GermplasmGroupCreationDTO.md)| Germplasm group description | [optional] 

### Return type

**str**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**201** | A germplasm group is created |  -  |
**409** | A germplasm group with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_germplasm**
> delete_germplasm(uri, authorization, accept_language=accept_language)

Delete a germplasm

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
    api_instance = openapi_client.GermplasmApi(api_client)
    uri = 'http://example.com/' # str | Germplasm URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a germplasm
        api_instance.delete_germplasm(uri, authorization, accept_language=accept_language)
    except Exception as e:
        print("Exception when calling GermplasmApi->delete_germplasm: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Germplasm URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

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

# **delete_germplasm_group**
> ObjectUriResponse delete_germplasm_group(uri, authorization, accept_language=accept_language)

Delete a germplasm group

### Example


```python
import openapi_client
from openapi_client.models.object_uri_response import ObjectUriResponse
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
    api_instance = openapi_client.GermplasmApi(api_client)
    uri = 'uri_example' # str | Germplasm group URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a germplasm group
        api_response = api_instance.delete_germplasm_group(uri, authorization, accept_language=accept_language)
        print("The response of GermplasmApi->delete_germplasm_group:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->delete_germplasm_group: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Germplasm group URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**ObjectUriResponse**](ObjectUriResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Germplasm group deleted |  -  |
**404** | Unknown germplasm group URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **export_germplasm**
> export_germplasm(authorization, accept_language=accept_language, body=body)

export germplasm

### Example


```python
import openapi_client
from openapi_client.models.germplasm_search_filter import GermplasmSearchFilter
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
    api_instance = openapi_client.GermplasmApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.GermplasmSearchFilter() # GermplasmSearchFilter | CSV export configuration (optional)

    try:
        # export germplasm
        api_instance.export_germplasm(authorization, accept_language=accept_language, body=body)
    except Exception as e:
        print("Exception when calling GermplasmApi->export_germplasm: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**GermplasmSearchFilter**](GermplasmSearchFilter.md)| CSV export configuration | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: text/plain

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return a csv file with germplasm list |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_germplasm**
> GermplasmGetSingleDTO get_germplasm(uri, authorization, accept_language=accept_language)

Get a germplasm

### Example


```python
import openapi_client
from openapi_client.models.germplasm_get_single_dto import GermplasmGetSingleDTO
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
    api_instance = openapi_client.GermplasmApi(api_client)
    uri = 'http://www.phenome-fppn.fr/id/species/zeamays' # str | germplasm URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a germplasm
        api_response = api_instance.get_germplasm(uri, authorization, accept_language=accept_language)
        print("The response of GermplasmApi->get_germplasm:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->get_germplasm: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| germplasm URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**GermplasmGetSingleDTO**](GermplasmGetSingleDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return germplasm |  -  |
**400** | Bad user request |  -  |
**404** | Germplasm not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_germplasm_attribute_values**
> List[str] get_germplasm_attribute_values(attribute, authorization, attribute_value=attribute_value, page=page, page_size=page_size, accept_language=accept_language)

Get attribute values of all germplasm for a given attribute

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
    api_instance = openapi_client.GermplasmApi(api_client)
    attribute = 'attribute_example' # str | 
    authorization = 'authorization_example' # str | Authentication token
    attribute_value = '.*' # str | Regex pattern for filtering attribute value (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get attribute values of all germplasm for a given attribute
        api_response = api_instance.get_germplasm_attribute_values(attribute, authorization, attribute_value=attribute_value, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of GermplasmApi->get_germplasm_attribute_values:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->get_germplasm_attribute_values: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **attribute** | **str**|  | 
 **authorization** | **str**| Authentication token | 
 **attribute_value** | **str**| Regex pattern for filtering attribute value | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

**List[str]**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return germplasm attributes |  -  |
**404** | Germplasm attributes not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_germplasm_attributes**
> List[str] get_germplasm_attributes(authorization, accept_language=accept_language)

Get attributes of all germplasm

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
    api_instance = openapi_client.GermplasmApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get attributes of all germplasm
        api_response = api_instance.get_germplasm_attributes(authorization, accept_language=accept_language)
        print("The response of GermplasmApi->get_germplasm_attributes:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->get_germplasm_attributes: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

**List[str]**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return germplasm attributes |  -  |
**404** | Germplasm attributes not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_germplasm_experiments**
> List[ExperimentGetListDTO] get_germplasm_experiments(uri, authorization, attribute_value=attribute_value, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Get experiments where a germplasm has been used

### Example


```python
import openapi_client
from openapi_client.models.experiment_get_list_dto import ExperimentGetListDTO
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
    api_instance = openapi_client.GermplasmApi(api_client)
    uri = 'dev-germplasm:g01' # str | germplasm URI
    authorization = 'authorization_example' # str | Authentication token
    attribute_value = '.*' # str | Regex pattern for filtering experiments by name (optional) (default to '.*')
    order_by = ['name=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get experiments where a germplasm has been used
        api_response = api_instance.get_germplasm_experiments(uri, authorization, attribute_value=attribute_value, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of GermplasmApi->get_germplasm_experiments:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->get_germplasm_experiments: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| germplasm URI | 
 **authorization** | **str**| Authentication token | 
 **attribute_value** | **str**| Regex pattern for filtering experiments by name | [optional] [default to &#39;.*&#39;]
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ExperimentGetListDTO]**](ExperimentGetListDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return germplasm |  -  |
**400** | Bad user request |  -  |
**404** | Germplasm not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_germplasm_group**
> GermplasmGroupGetDTO get_germplasm_group(uri, authorization, accept_language=accept_language)

Get a germplasm group

### Example


```python
import openapi_client
from openapi_client.models.germplasm_group_get_dto import GermplasmGroupGetDTO
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
    api_instance = openapi_client.GermplasmApi(api_client)
    uri = 'uri_example' # str | Germplasm group URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a germplasm group
        api_response = api_instance.get_germplasm_group(uri, authorization, accept_language=accept_language)
        print("The response of GermplasmApi->get_germplasm_group:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->get_germplasm_group: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Germplasm group URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**GermplasmGroupGetDTO**](GermplasmGroupGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Germplasm group retrieved |  -  |
**404** | Unknown germplasm group URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_germplasm_group_by_uris**
> List[GermplasmGroupGetDTO] get_germplasm_group_by_uris(uris, authorization, accept_language=accept_language)

Get germplasm groups by their URIs

### Example


```python
import openapi_client
from openapi_client.models.germplasm_group_get_dto import GermplasmGroupGetDTO
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
    api_instance = openapi_client.GermplasmApi(api_client)
    uris = ['uris_example'] # List[str] | Germplasm group URIs
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get germplasm groups by their URIs
        api_response = api_instance.get_germplasm_group_by_uris(uris, authorization, accept_language=accept_language)
        print("The response of GermplasmApi->get_germplasm_group_by_uris:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->get_germplasm_group_by_uris: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Germplasm group URIs | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[GermplasmGroupGetDTO]**](GermplasmGroupGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return germplasm groups |  -  |
**400** | Invalid parameters |  -  |
**404** | Germplasm group not found (if any provided URIs is not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_germplasm_group_content**
> List[GermplasmGetAllDTO] get_germplasm_group_content(uri, authorization, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Get a germplasm group's germplasm, paginated

### Example


```python
import openapi_client
from openapi_client.models.germplasm_get_all_dto import GermplasmGetAllDTO
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
    api_instance = openapi_client.GermplasmApi(api_client)
    uri = 'uri_example' # str | Germplasm group URI
    authorization = 'authorization_example' # str | Authentication token
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a germplasm group's germplasm, paginated
        api_response = api_instance.get_germplasm_group_content(uri, authorization, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of GermplasmApi->get_germplasm_group_content:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->get_germplasm_group_content: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Germplasm group URI | 
 **authorization** | **str**| Authentication token | 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[GermplasmGetAllDTO]**](GermplasmGetAllDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Germplasm group content retrieved |  -  |
**404** | Unknown germplasm group URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_germplasm_group_with_germplasms**
> GermplasmGroupGetWithDetailsDTO get_germplasm_group_with_germplasms(uri, authorization, accept_language=accept_language)

Get a germplasm group with nested germplasm details

### Example


```python
import openapi_client
from openapi_client.models.germplasm_group_get_with_details_dto import GermplasmGroupGetWithDetailsDTO
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
    api_instance = openapi_client.GermplasmApi(api_client)
    uri = 'uri_example' # str | Germplasm group URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a germplasm group with nested germplasm details
        api_response = api_instance.get_germplasm_group_with_germplasms(uri, authorization, accept_language=accept_language)
        print("The response of GermplasmApi->get_germplasm_group_with_germplasms:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->get_germplasm_group_with_germplasms: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Germplasm group URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**GermplasmGroupGetWithDetailsDTO**](GermplasmGroupGetWithDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Germplasm group retrieved |  -  |
**404** | Unknown germplasm group URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_germplasms_by_uri**
> List[GermplasmGetAllDTO] get_germplasms_by_uri(authorization, accept_language=accept_language, body=body)

Get a list of germplasms by their URIs

### Example


```python
import openapi_client
from openapi_client.models.germplasm_get_all_dto import GermplasmGetAllDTO
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
    api_instance = openapi_client.GermplasmApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = ['body_example'] # List[str] | Germplasms URIs (optional)

    try:
        # Get a list of germplasms by their URIs
        api_response = api_instance.get_germplasms_by_uri(authorization, accept_language=accept_language, body=body)
        print("The response of GermplasmApi->get_germplasms_by_uri:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->get_germplasms_by_uri: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**List[str]**](str.md)| Germplasms URIs | [optional] 

### Return type

[**List[GermplasmGetAllDTO]**](GermplasmGetAllDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return factors list |  -  |
**400** | Invalid parameters |  -  |
**404** | Germplasm not found (if any provided URIs is not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_germplasm**
> List[GermplasmGetAllDTO] search_germplasm(authorization, uri=uri, rdf_type=rdf_type, name=name, code=code, production_year=production_year, species=species, variety=variety, accession=accession, group_of_germplasm=group_of_germplasm, institute=institute, experiment=experiment, parent_germplasms=parent_germplasms, parent_germplasms_m=parent_germplasms_m, parent_germplasms_f=parent_germplasms_f, metadata=metadata, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search germplasm

### Example


```python
import openapi_client
from openapi_client.models.germplasm_get_all_dto import GermplasmGetAllDTO
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
    api_instance = openapi_client.GermplasmApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    uri = 'http://opensilex/set/experiments/ZA17' # str | Regex pattern for filtering list by uri (optional)
    rdf_type = 'http://www.opensilex.org/vocabulary/oeso#Variety' # str | Search by type (optional)
    name = '.*' # str | Regex pattern for filtering list by name and synonyms (optional) (default to '.*')
    code = '.*' # str | Regex pattern for filtering list by code (optional) (default to '.*')
    production_year = 2020 # int | Search by production year (optional)
    species = 'http://www.phenome-fppn.fr/id/species/zeamays' # str | Search by species (optional)
    variety = 'http://opensilex.test/id/germplasm/variety.huachano' # str | Search by variety (optional)
    accession = 'http://opensilex.test/id/germplasm/accession.v_a_x_v_b' # str | Search by accession (optional)
    group_of_germplasm = 'group_of_germplasm_example' # str | Group filter (optional)
    institute = 'INRA' # str | Search by institute (optional)
    experiment = 'experiment_example' # str | Search by experiment (optional)
    parent_germplasms = ['parent_germplasms_example'] # List[str] | Search by parent varieties A or B (optional)
    parent_germplasms_m = ['parent_germplasms_m_example'] # List[str] | Search by parent varieties A (optional)
    parent_germplasms_f = ['parent_germplasms_f_example'] # List[str] | Search by parent varieties B (optional)
    metadata = '{ \"water_stress\" : \"resistant\", \"yield\" : \"moderate\"}' # str | Search by metadata (optional)
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search germplasm
        api_response = api_instance.search_germplasm(authorization, uri=uri, rdf_type=rdf_type, name=name, code=code, production_year=production_year, species=species, variety=variety, accession=accession, group_of_germplasm=group_of_germplasm, institute=institute, experiment=experiment, parent_germplasms=parent_germplasms, parent_germplasms_m=parent_germplasms_m, parent_germplasms_f=parent_germplasms_f, metadata=metadata, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of GermplasmApi->search_germplasm:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->search_germplasm: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **uri** | **str**| Regex pattern for filtering list by uri | [optional] 
 **rdf_type** | **str**| Search by type | [optional] 
 **name** | **str**| Regex pattern for filtering list by name and synonyms | [optional] [default to &#39;.*&#39;]
 **code** | **str**| Regex pattern for filtering list by code | [optional] [default to &#39;.*&#39;]
 **production_year** | **int**| Search by production year | [optional] 
 **species** | **str**| Search by species | [optional] 
 **variety** | **str**| Search by variety | [optional] 
 **accession** | **str**| Search by accession | [optional] 
 **group_of_germplasm** | **str**| Group filter | [optional] 
 **institute** | **str**| Search by institute | [optional] 
 **experiment** | **str**| Search by experiment | [optional] 
 **parent_germplasms** | [**List[str]**](str.md)| Search by parent varieties A or B | [optional] 
 **parent_germplasms_m** | [**List[str]**](str.md)| Search by parent varieties A | [optional] 
 **parent_germplasms_f** | [**List[str]**](str.md)| Search by parent varieties B | [optional] 
 **metadata** | **str**| Search by metadata | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[GermplasmGetAllDTO]**](GermplasmGetAllDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return germplasm list |  -  |
**400** | Bad user request |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_germplasm_groups**
> List[GermplasmGroupGetDTO] search_germplasm_groups(authorization, name=name, germplasm=germplasm, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search germplasm groups

### Example


```python
import openapi_client
from openapi_client.models.germplasm_group_get_dto import GermplasmGroupGetDTO
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
    api_instance = openapi_client.GermplasmApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = 'name_example' # str | Regex pattern for filtering by name (optional)
    germplasm = ['http://aims.fao.org/aos/agrovoc/c_1066'] # List[str] | Germplasm URIs (optional)
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search germplasm groups
        api_response = api_instance.search_germplasm_groups(authorization, name=name, germplasm=germplasm, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of GermplasmApi->search_germplasm_groups:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->search_germplasm_groups: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Regex pattern for filtering by name | [optional] 
 **germplasm** | [**List[str]**](str.md)| Germplasm URIs | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[GermplasmGroupGetDTO]**](GermplasmGroupGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return germplasm groups |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_germplasm**
> str update_germplasm(authorization, accept_language=accept_language, body=body)

Update a germplasm

### Example


```python
import openapi_client
from openapi_client.models.germplasm_update_dto import GermplasmUpdateDTO
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
    api_instance = openapi_client.GermplasmApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.GermplasmUpdateDTO() # GermplasmUpdateDTO | Germplasm description (optional)

    try:
        # Update a germplasm
        api_response = api_instance.update_germplasm(authorization, accept_language=accept_language, body=body)
        print("The response of GermplasmApi->update_germplasm:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->update_germplasm: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**GermplasmUpdateDTO**](GermplasmUpdateDTO.md)| Germplasm description | [optional] 

### Return type

**str**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Germplasm updated |  -  |
**400** | Invalid or unknown Germplasm URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_germplasm_group**
> str update_germplasm_group(authorization, accept_language=accept_language, body=body)

Update a germplasm group

### Example


```python
import openapi_client
from openapi_client.models.germplasm_group_update_dto import GermplasmGroupUpdateDTO
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
    api_instance = openapi_client.GermplasmApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.GermplasmGroupUpdateDTO() # GermplasmGroupUpdateDTO | Germplasm group description (optional)

    try:
        # Update a germplasm group
        api_response = api_instance.update_germplasm_group(authorization, accept_language=accept_language, body=body)
        print("The response of GermplasmApi->update_germplasm_group:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling GermplasmApi->update_germplasm_group: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**GermplasmGroupUpdateDTO**](GermplasmGroupUpdateDTO.md)| Germplasm group description | [optional] 

### Return type

**str**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Germplasm group updated |  -  |
**404** | Unknown germplasm group URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

