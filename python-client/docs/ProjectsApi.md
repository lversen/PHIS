# openapi_client.ProjectsApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_project**](ProjectsApi.md#create_project) | **POST** /core/projects | Add a project
[**delete_project**](ProjectsApi.md#delete_project) | **DELETE** /core/projects/{uri} | Delete a project
[**get_project**](ProjectsApi.md#get_project) | **GET** /core/projects/{uri} | Get a project
[**get_projects_by_uri**](ProjectsApi.md#get_projects_by_uri) | **GET** /core/projects/by_uris | Get projects by their URIs
[**search_projects**](ProjectsApi.md#search_projects) | **GET** /core/projects | Search projects
[**update_project**](ProjectsApi.md#update_project) | **PUT** /core/projects | Update a project


# **create_project**
> str create_project(authorization, accept_language=accept_language, body=body)

Add a project

### Example


```python
import openapi_client
from openapi_client.models.project_creation_dto import ProjectCreationDTO
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
    api_instance = openapi_client.ProjectsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.ProjectCreationDTO() # ProjectCreationDTO | Project description (optional)

    try:
        # Add a project
        api_response = api_instance.create_project(authorization, accept_language=accept_language, body=body)
        print("The response of ProjectsApi->create_project:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ProjectsApi->create_project: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**ProjectCreationDTO**](ProjectCreationDTO.md)| Project description | [optional] 

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
**201** | A project is created |  -  |
**409** | A project with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_project**
> str delete_project(uri, authorization, accept_language=accept_language)

Delete a project

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
    api_instance = openapi_client.ProjectsApi(api_client)
    uri = 'http://opensilex/set/project/BW1' # str | Project URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a project
        api_response = api_instance.delete_project(uri, authorization, accept_language=accept_language)
        print("The response of ProjectsApi->delete_project:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ProjectsApi->delete_project: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Project URI | 
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
**200** | Project deleted |  -  |
**404** | Unknown Project URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_project**
> ProjectGetDetailDTO get_project(uri, authorization, accept_language=accept_language)

Get a project

### Example


```python
import openapi_client
from openapi_client.models.project_get_detail_dto import ProjectGetDetailDTO
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
    api_instance = openapi_client.ProjectsApi(api_client)
    uri = 'http://example.com/' # str | Project URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a project
        api_response = api_instance.get_project(uri, authorization, accept_language=accept_language)
        print("The response of ProjectsApi->get_project:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ProjectsApi->get_project: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Project URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**ProjectGetDetailDTO**](ProjectGetDetailDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Project retrieved |  -  |
**404** | Unknown Project URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_projects_by_uri**
> List[ProjectGetDTO] get_projects_by_uri(uris, authorization, accept_language=accept_language)

Get projects by their URIs

### Example


```python
import openapi_client
from openapi_client.models.project_get_dto import ProjectGetDTO
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
    api_instance = openapi_client.ProjectsApi(api_client)
    uris = ['uris_example'] # List[str] | Projects URIs
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get projects by their URIs
        api_response = api_instance.get_projects_by_uri(uris, authorization, accept_language=accept_language)
        print("The response of ProjectsApi->get_projects_by_uri:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ProjectsApi->get_projects_by_uri: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Projects URIs | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ProjectGetDTO]**](ProjectGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return projects |  -  |
**400** | Invalid parameters |  -  |
**404** | Project not found (if any provided URIs is not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_projects**
> List[ProjectGetDTO] search_projects(authorization, name=name, year=year, keyword=keyword, financial_funding=financial_funding, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search projects

### Example


```python
import openapi_client
from openapi_client.models.project_get_dto import ProjectGetDTO
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
    api_instance = openapi_client.ProjectsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = 'PJ17' # str | Regex pattern for filtering by name or shortname (optional)
    year = 2017 # int | Search by year (optional)
    keyword = 'climate' # str | Regex pattern for filtering on description or objective (optional)
    financial_funding = 'ANR' # str | Regex pattern for filtering by financial funding (optional)
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search projects
        api_response = api_instance.search_projects(authorization, name=name, year=year, keyword=keyword, financial_funding=financial_funding, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of ProjectsApi->search_projects:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ProjectsApi->search_projects: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Regex pattern for filtering by name or shortname | [optional] 
 **year** | **int**| Search by year | [optional] 
 **keyword** | **str**| Regex pattern for filtering on description or objective | [optional] 
 **financial_funding** | **str**| Regex pattern for filtering by financial funding | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ProjectGetDTO]**](ProjectGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return projects |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_project**
> str update_project(authorization, accept_language=accept_language, body=body)

Update a project

### Example


```python
import openapi_client
from openapi_client.models.project_creation_dto import ProjectCreationDTO
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
    api_instance = openapi_client.ProjectsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.ProjectCreationDTO() # ProjectCreationDTO | Project description (optional)

    try:
        # Update a project
        api_response = api_instance.update_project(authorization, accept_language=accept_language, body=body)
        print("The response of ProjectsApi->update_project:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ProjectsApi->update_project: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**ProjectCreationDTO**](ProjectCreationDTO.md)| Project description | [optional] 

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
**200** | Project updated |  -  |
**404** | Unknown Project URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

