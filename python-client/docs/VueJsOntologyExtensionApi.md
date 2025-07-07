# openapi_client.VueJsOntologyExtensionApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_rdf_type**](VueJsOntologyExtensionApi.md#create_rdf_type) | **POST** /vuejs/owl_extension/rdf_type | Create a custom class
[**delete_rdf_type**](VueJsOntologyExtensionApi.md#delete_rdf_type) | **DELETE** /vuejs/owl_extension/rdf_type/{uri} | Delete a RDF type
[**get_data_types1**](VueJsOntologyExtensionApi.md#get_data_types1) | **GET** /vuejs/owl_extension/data_types | Return literal datatypes definition
[**get_object_types**](VueJsOntologyExtensionApi.md#get_object_types) | **GET** /vuejs/owl_extension/object_types | Return object types definition
[**get_rdf_type1**](VueJsOntologyExtensionApi.md#get_rdf_type1) | **GET** /vuejs/owl_extension/rdf_type | Return rdf type model definition with properties
[**get_rdf_type_properties**](VueJsOntologyExtensionApi.md#get_rdf_type_properties) | **GET** /vuejs/owl_extension/rdf_type_properties | Return class model properties definitions
[**get_rdf_types_parameters**](VueJsOntologyExtensionApi.md#get_rdf_types_parameters) | **GET** /vuejs/owl_extension/rdf_types_parameters | Return RDF types parameters for Vue.js application
[**set_rdf_type_properties_order**](VueJsOntologyExtensionApi.md#set_rdf_type_properties_order) | **PUT** /vuejs/owl_extension/properties_order | Define properties order
[**update_rdf_type**](VueJsOntologyExtensionApi.md#update_rdf_type) | **PUT** /vuejs/owl_extension/rdf_type | Update a custom class


# **create_rdf_type**
> str create_rdf_type(authorization, accept_language=accept_language, body=body)

Create a custom class

### Example


```python
import openapi_client
from openapi_client.models.vue_rdf_type_dto import VueRDFTypeDTO
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
    api_instance = openapi_client.VueJsOntologyExtensionApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.VueRDFTypeDTO() # VueRDFTypeDTO | Class description (optional)

    try:
        # Create a custom class
        api_response = api_instance.create_rdf_type(authorization, accept_language=accept_language, body=body)
        print("The response of VueJsOntologyExtensionApi->create_rdf_type:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsOntologyExtensionApi->create_rdf_type: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**VueRDFTypeDTO**](VueRDFTypeDTO.md)| Class description | [optional] 

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
**201** | Create a custom class |  -  |
**409** | A class with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_rdf_type**
> str delete_rdf_type(uri, authorization, accept_language=accept_language)

Delete a RDF type

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
    api_instance = openapi_client.VueJsOntologyExtensionApi(api_client)
    uri = 'uri_example' # str | RDF type
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a RDF type
        api_response = api_instance.delete_rdf_type(uri, authorization, accept_language=accept_language)
        print("The response of VueJsOntologyExtensionApi->delete_rdf_type:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsOntologyExtensionApi->delete_rdf_type: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| RDF type | 
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
**200** | Class deleted  |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_data_types1**
> List[VueDataTypeDTO] get_data_types1()

Return literal datatypes definition

### Example


```python
import openapi_client
from openapi_client.models.vue_data_type_dto import VueDataTypeDTO
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
    api_instance = openapi_client.VueJsOntologyExtensionApi(api_client)

    try:
        # Return literal datatypes definition
        api_response = api_instance.get_data_types1()
        print("The response of VueJsOntologyExtensionApi->get_data_types1:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsOntologyExtensionApi->get_data_types1: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

### Return type

[**List[VueDataTypeDTO]**](VueDataTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return literal datatypes definition  |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_object_types**
> List[VueObjectTypeDTO] get_object_types()

Return object types definition

### Example


```python
import openapi_client
from openapi_client.models.vue_object_type_dto import VueObjectTypeDTO
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
    api_instance = openapi_client.VueJsOntologyExtensionApi(api_client)

    try:
        # Return object types definition
        api_response = api_instance.get_object_types()
        print("The response of VueJsOntologyExtensionApi->get_object_types:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsOntologyExtensionApi->get_object_types: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

### Return type

[**List[VueObjectTypeDTO]**](VueObjectTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return object types definition  |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_rdf_type1**
> VueRDFTypeDTO get_rdf_type1(rdf_type, authorization, parent_type=parent_type, accept_language=accept_language)

Return rdf type model definition with properties

### Example


```python
import openapi_client
from openapi_client.models.vue_rdf_type_dto import VueRDFTypeDTO
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
    api_instance = openapi_client.VueJsOntologyExtensionApi(api_client)
    rdf_type = 'rdf_type_example' # str | RDF type URI
    authorization = 'authorization_example' # str | Authentication token
    parent_type = 'parent_type_example' # str | Parent RDF class URI (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Return rdf type model definition with properties
        api_response = api_instance.get_rdf_type1(rdf_type, authorization, parent_type=parent_type, accept_language=accept_language)
        print("The response of VueJsOntologyExtensionApi->get_rdf_type1:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsOntologyExtensionApi->get_rdf_type1: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rdf_type** | **str**| RDF type URI | 
 **authorization** | **str**| Authentication token | 
 **parent_type** | **str**| Parent RDF class URI | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**VueRDFTypeDTO**](VueRDFTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return class model definition  |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_rdf_type_properties**
> VueRDFTypeDTO get_rdf_type_properties(rdf_type, parent_type, authorization, accept_language=accept_language)

Return class model properties definitions

### Example


```python
import openapi_client
from openapi_client.models.vue_rdf_type_dto import VueRDFTypeDTO
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
    api_instance = openapi_client.VueJsOntologyExtensionApi(api_client)
    rdf_type = 'rdf_type_example' # str | RDF class URI
    parent_type = 'parent_type_example' # str | Parent RDF class URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Return class model properties definitions
        api_response = api_instance.get_rdf_type_properties(rdf_type, parent_type, authorization, accept_language=accept_language)
        print("The response of VueJsOntologyExtensionApi->get_rdf_type_properties:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsOntologyExtensionApi->get_rdf_type_properties: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rdf_type** | **str**| RDF class URI | 
 **parent_type** | **str**| Parent RDF class URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**VueRDFTypeDTO**](VueRDFTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return class model properties definitions  |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_rdf_types_parameters**
> List[VueRDFTypeParameterDTO] get_rdf_types_parameters()

Return RDF types parameters for Vue.js application

### Example


```python
import openapi_client
from openapi_client.models.vue_rdf_type_parameter_dto import VueRDFTypeParameterDTO
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
    api_instance = openapi_client.VueJsOntologyExtensionApi(api_client)

    try:
        # Return RDF types parameters for Vue.js application
        api_response = api_instance.get_rdf_types_parameters()
        print("The response of VueJsOntologyExtensionApi->get_rdf_types_parameters:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsOntologyExtensionApi->get_rdf_types_parameters: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

### Return type

[**List[VueRDFTypeParameterDTO]**](VueRDFTypeParameterDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return rdf types parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **set_rdf_type_properties_order**
> str set_rdf_type_properties_order(rdf_type, authorization, accept_language=accept_language, body=body)

Define properties order

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
    api_instance = openapi_client.VueJsOntologyExtensionApi(api_client)
    rdf_type = 'rdf_type_example' # str | RDF type
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = ['body_example'] # List[str] | Array of properties (optional)

    try:
        # Define properties order
        api_response = api_instance.set_rdf_type_properties_order(rdf_type, authorization, accept_language=accept_language, body=body)
        print("The response of VueJsOntologyExtensionApi->set_rdf_type_properties_order:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsOntologyExtensionApi->set_rdf_type_properties_order: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rdf_type** | **str**| RDF type | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**List[str]**](str.md)| Array of properties | [optional] 

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
**200** | Define properties order |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_rdf_type**
> str update_rdf_type(authorization, accept_language=accept_language, body=body)

Update a custom class

### Example


```python
import openapi_client
from openapi_client.models.vue_rdf_type_dto import VueRDFTypeDTO
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
    api_instance = openapi_client.VueJsOntologyExtensionApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.VueRDFTypeDTO() # VueRDFTypeDTO | RDF type definition (optional)

    try:
        # Update a custom class
        api_response = api_instance.update_rdf_type(authorization, accept_language=accept_language, body=body)
        print("The response of VueJsOntologyExtensionApi->update_rdf_type:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsOntologyExtensionApi->update_rdf_type: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**VueRDFTypeDTO**](VueRDFTypeDTO.md)| RDF type definition | [optional] 

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
**200** | Update a RDF property |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

