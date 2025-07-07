# openapi_client.DocumentsApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**count_documents**](DocumentsApi.md#count_documents) | **GET** /core/documents/count | Count documents
[**create_document**](DocumentsApi.md#create_document) | **POST** /core/documents | Add a document
[**delete_document**](DocumentsApi.md#delete_document) | **DELETE** /core/documents/{uri} | Delete a document
[**get_document_file**](DocumentsApi.md#get_document_file) | **GET** /core/documents/{uri} | Get document
[**get_document_metadata**](DocumentsApi.md#get_document_metadata) | **GET** /core/documents/{uri}/description | Get document&#39;s description
[**search_documents**](DocumentsApi.md#search_documents) | **GET** /core/documents | Search documents
[**update_document**](DocumentsApi.md#update_document) | **PUT** /core/documents | Update document&#39;s description


# **count_documents**
> int count_documents(authorization, target=target, accept_language=accept_language)

Count documents

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
    api_instance = openapi_client.DocumentsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    target = 'http://www.opensilex.org/demo/2018/o18000076' # str | Target URI (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Count documents
        api_response = api_instance.count_documents(authorization, target=target, accept_language=accept_language)
        print("The response of DocumentsApi->count_documents:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DocumentsApi->count_documents: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **target** | **str**| Target URI | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return the number of documents associated to a given target |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_document**
> str create_document(authorization, description, accept_language=accept_language, file=file)

Add a document

{ uri: http://opensilex.dev/set/documents#ProtocolExperimental, identifier: doi:10.1340/309registries, rdf_type: http://www.opensilex.org/vocabulary/oeso#ScientificDocument, title: title, date: 2020-06-01, description: description, targets: http://opensilex.dev/opensilex/id/variables/v001, authors: Author name, language: fr, format: jpg, deprecated: false, keywords: keywords}

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
    api_instance = openapi_client.DocumentsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    description = 'description_example' # str | File description with metadata
    accept_language = 'en' # str | Request accepted language (optional)
    file = None # bytearray | file (optional)

    try:
        # Add a document
        api_response = api_instance.create_document(authorization, description, accept_language=accept_language, file=file)
        print("The response of DocumentsApi->create_document:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DocumentsApi->create_document: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **description** | **str**| File description with metadata | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **file** | **bytearray**| file | [optional] 

### Return type

**str**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**201** | Document Inserted |  -  |
**409** | A document with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_document**
> str delete_document(uri, authorization, accept_language=accept_language)

Delete a document

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
    api_instance = openapi_client.DocumentsApi(api_client)
    uri = 'uri_example' # str | Document URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a document
        api_response = api_instance.delete_document(uri, authorization, accept_language=accept_language)
        print("The response of DocumentsApi->delete_document:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DocumentsApi->delete_document: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Document URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

**str**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Document deleted |  -  |
**404** | Document URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_document_file**
> get_document_file(uri, authorization, accept_language=accept_language)

Get document

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
    api_instance = openapi_client.DocumentsApi(api_client)
    uri = 'http://opensilex.dev/set/documents/ZA17' # str | Document URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get document
        api_instance.get_document_file(uri, authorization, accept_language=accept_language)
    except Exception as e:
        print("Exception when calling DocumentsApi->get_document_file: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Document URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Document retrieved |  -  |
**404** | Document URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_document_metadata**
> DocumentGetDTO get_document_metadata(uri, authorization, accept_language=accept_language)

Get document's description

### Example


```python
import openapi_client
from openapi_client.models.document_get_dto import DocumentGetDTO
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
    api_instance = openapi_client.DocumentsApi(api_client)
    uri = 'http://opensilex.dev/set/documents/ZA17' # str | Document URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get document's description
        api_response = api_instance.get_document_metadata(uri, authorization, accept_language=accept_language)
        print("The response of DocumentsApi->get_document_metadata:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DocumentsApi->get_document_metadata: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Document URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**DocumentGetDTO**](DocumentGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Document retrieved |  -  |
**404** | Document URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_documents**
> List[DocumentGetDTO] search_documents(authorization, rdf_type=rdf_type, title=title, var_date=var_date, targets=targets, authors=authors, keyword=keyword, multiple=multiple, deprecated=deprecated, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search documents

### Example


```python
import openapi_client
from openapi_client.models.document_get_dto import DocumentGetDTO
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
    api_instance = openapi_client.DocumentsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    rdf_type = 'http://www.opensilex.org/vocabulary/oeso#ScientificDocument' # str | Search by type (optional)
    title = 'experimental_protocol_3' # str | Regex pattern for filtering list by title (optional)
    var_date = '2020' # str | Regex pattern for filtering list by date (optional)
    targets = 'dev-expe:za17' # str | Search by targets (optional)
    authors = 'Firstname Lastname' # str | Regex pattern for filtering list by author (optional)
    keyword = 'keyword' # str | Regex pattern for filtering list by keyword (optional)
    multiple = 'keyword or title' # str | Regex pattern for filtering list by keyword or title (optional)
    deprecated = 'true' # str | Search deprecated file (optional)
    order_by = ['date=asc'] # List[str] | List of fields to sort as an array of fieldTitle=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search documents
        api_response = api_instance.search_documents(authorization, rdf_type=rdf_type, title=title, var_date=var_date, targets=targets, authors=authors, keyword=keyword, multiple=multiple, deprecated=deprecated, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of DocumentsApi->search_documents:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DocumentsApi->search_documents: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **rdf_type** | **str**| Search by type | [optional] 
 **title** | **str**| Regex pattern for filtering list by title | [optional] 
 **var_date** | **str**| Regex pattern for filtering list by date | [optional] 
 **targets** | **str**| Search by targets | [optional] 
 **authors** | **str**| Regex pattern for filtering list by author | [optional] 
 **keyword** | **str**| Regex pattern for filtering list by keyword | [optional] 
 **multiple** | **str**| Regex pattern for filtering list by keyword or title | [optional] 
 **deprecated** | **str**| Search deprecated file | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldTitle&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[DocumentGetDTO]**](DocumentGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return Document list |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_document**
> str update_document(authorization, description, accept_language=accept_language)

Update document's description

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
    api_instance = openapi_client.DocumentsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    description = 'description_example' # str | description
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Update document's description
        api_response = api_instance.update_document(authorization, description, accept_language=accept_language)
        print("The response of DocumentsApi->update_document:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DocumentsApi->update_document: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **description** | **str**| description | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

**str**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Document&#39;s metadata updated |  -  |
**404** | Document URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

