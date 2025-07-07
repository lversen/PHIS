# openapi_client.AnnotationsApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**count_annotations**](AnnotationsApi.md#count_annotations) | **GET** /core/annotations/count | Count annotations
[**create_annotation**](AnnotationsApi.md#create_annotation) | **POST** /core/annotations | Create an annotation
[**delete_annotation**](AnnotationsApi.md#delete_annotation) | **DELETE** /core/annotations/{uri} | Delete an annotation
[**get_annotation**](AnnotationsApi.md#get_annotation) | **GET** /core/annotations/{uri} | Get an annotation
[**search_annotations**](AnnotationsApi.md#search_annotations) | **GET** /core/annotations | Search annotations
[**search_motivations**](AnnotationsApi.md#search_motivations) | **GET** /core/annotations/motivations | Search motivations
[**update_annotation**](AnnotationsApi.md#update_annotation) | **PUT** /core/annotations | Update an annotation


# **count_annotations**
> int count_annotations(authorization, target=target, accept_language=accept_language)

Count annotations

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
    api_instance = openapi_client.AnnotationsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    target = 'http://www.opensilex.org/demo/2018/o18000076' # str | Target URI (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Count annotations
        api_response = api_instance.count_annotations(authorization, target=target, accept_language=accept_language)
        print("The response of AnnotationsApi->count_annotations:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AnnotationsApi->count_annotations: %s\n" % e)
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
**200** | Return the number of annotations associated to a given target |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_annotation**
> str create_annotation(authorization, accept_language=accept_language, body=body)

Create an annotation

### Example


```python
import openapi_client
from openapi_client.models.annotation_creation_dto import AnnotationCreationDTO
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
    api_instance = openapi_client.AnnotationsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.AnnotationCreationDTO() # AnnotationCreationDTO |  (optional)

    try:
        # Create an annotation
        api_response = api_instance.create_annotation(authorization, accept_language=accept_language, body=body)
        print("The response of AnnotationsApi->create_annotation:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AnnotationsApi->create_annotation: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**AnnotationCreationDTO**](AnnotationCreationDTO.md)|  | [optional] 

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
**201** | An annotation is created |  -  |
**409** | An annotation with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_annotation**
> str delete_annotation(uri, authorization, accept_language=accept_language)

Delete an annotation

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
    api_instance = openapi_client.AnnotationsApi(api_client)
    uri = 'http://www.opensilex.org/annotations/12590c87-1c34-426b-a231-beb7acb33415' # str | Annotation URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete an annotation
        api_response = api_instance.delete_annotation(uri, authorization, accept_language=accept_language)
        print("The response of AnnotationsApi->delete_annotation:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AnnotationsApi->delete_annotation: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Annotation URI | 
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
**200** | Annotation deleted |  -  |
**404** | Annotation URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_annotation**
> AnnotationGetDTO get_annotation(uri, authorization, accept_language=accept_language)

Get an annotation

### Example


```python
import openapi_client
from openapi_client.models.annotation_get_dto import AnnotationGetDTO
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
    api_instance = openapi_client.AnnotationsApi(api_client)
    uri = 'http://www.opensilex.org/annotations/12590c87-1c34-426b-a231-beb7acb33415' # str | Event URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get an annotation
        api_response = api_instance.get_annotation(uri, authorization, accept_language=accept_language)
        print("The response of AnnotationsApi->get_annotation:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AnnotationsApi->get_annotation: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Event URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**AnnotationGetDTO**](AnnotationGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Annotation retrieved |  -  |
**404** | Unknown annotation URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_annotations**
> List[AnnotationGetDTO] search_annotations(authorization, description=description, target=target, motivation=motivation, author=author, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search annotations

### Example


```python
import openapi_client
from openapi_client.models.annotation_get_dto import AnnotationGetDTO
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
    api_instance = openapi_client.AnnotationsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    description = 'The pest attack' # str | Description (regex) (optional)
    target = 'http://www.opensilex.org/demo/2018/o18000076' # str | Target URI (optional)
    motivation = 'http://www.w3.org/ns/oa#describing' # str | Motivation URI (optional)
    author = 'http://opensilex.dev/users#Admin.OpenSilex' # str | Author URI (optional)
    order_by = ['author=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search annotations
        api_response = api_instance.search_annotations(authorization, description=description, target=target, motivation=motivation, author=author, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of AnnotationsApi->search_annotations:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AnnotationsApi->search_annotations: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **description** | **str**| Description (regex) | [optional] 
 **target** | **str**| Target URI | [optional] 
 **motivation** | **str**| Motivation URI | [optional] 
 **author** | **str**| Author URI | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[AnnotationGetDTO]**](AnnotationGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return annotations |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_motivations**
> List[MotivationGetDTO] search_motivations(authorization, name=name, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search motivations

### Example


```python
import openapi_client
from openapi_client.models.motivation_get_dto import MotivationGetDTO
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
    api_instance = openapi_client.AnnotationsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = 'describing' # str | Motivation name regex pattern (optional)
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search motivations
        api_response = api_instance.search_motivations(authorization, name=name, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of AnnotationsApi->search_motivations:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AnnotationsApi->search_motivations: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Motivation name regex pattern | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[MotivationGetDTO]**](MotivationGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return motivations |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_annotation**
> str update_annotation(authorization, accept_language=accept_language, body=body)

Update an annotation

### Example


```python
import openapi_client
from openapi_client.models.annotation_update_dto import AnnotationUpdateDTO
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
    api_instance = openapi_client.AnnotationsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.AnnotationUpdateDTO() # AnnotationUpdateDTO | Annotation description (optional)

    try:
        # Update an annotation
        api_response = api_instance.update_annotation(authorization, accept_language=accept_language, body=body)
        print("The response of AnnotationsApi->update_annotation:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AnnotationsApi->update_annotation: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**AnnotationUpdateDTO**](AnnotationUpdateDTO.md)| Annotation description | [optional] 

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
**200** | Annotation created |  -  |
**404** | Unknown annotation URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

