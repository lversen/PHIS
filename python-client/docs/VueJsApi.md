# openapi_client.VueJsApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_config**](VueJsApi.md#get_config) | **GET** /vuejs/config | Return the current configuration
[**get_extension**](VueJsApi.md#get_extension) | **GET** /vuejs/extension/js/{module}.js | Return the front Vue JS extension file to include
[**get_extension_style**](VueJsApi.md#get_extension_style) | **GET** /vuejs/extension/css/{module}.css | Return the front Vue JS extension css file to include
[**get_theme_config**](VueJsApi.md#get_theme_config) | **GET** /vuejs/theme/{moduleId}/{themeId}/config | Return the front Vue JS theme configuration
[**get_theme_css**](VueJsApi.md#get_theme_css) | **GET** /vuejs/theme/{moduleId}/{themeId}/style.css | Return the theme css file
[**get_theme_resource**](VueJsApi.md#get_theme_resource) | **GET** /vuejs/theme/{moduleId}/{themeId}/resource | Return the theme requested resource
[**get_user_config**](VueJsApi.md#get_user_config) | **GET** /vuejs/user_config | Return the user-specific configuration


# **get_config**
> FrontConfigDTO get_config(accept_language=accept_language)

Return the current configuration

### Example


```python
import openapi_client
from openapi_client.models.front_config_dto import FrontConfigDTO
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
    api_instance = openapi_client.VueJsApi(api_client)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Return the current configuration
        api_response = api_instance.get_config(accept_language=accept_language)
        print("The response of VueJsApi->get_config:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsApi->get_config: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**FrontConfigDTO**](FrontConfigDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Front application configuration |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_extension**
> bytearray get_extension(module)

Return the front Vue JS extension file to include

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
    api_instance = openapi_client.VueJsApi(api_client)
    module = 'opensilex' # str | Module identifier

    try:
        # Return the front Vue JS extension file to include
        api_response = api_instance.get_extension(module)
        print("The response of VueJsApi->get_extension:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsApi->get_extension: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **module** | **str**| Module identifier | 

### Return type

**bytearray**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return the extension file |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_extension_style**
> bytearray get_extension_style(module)

Return the front Vue JS extension css file to include

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
    api_instance = openapi_client.VueJsApi(api_client)
    module = 'opensilex' # str | Module identifier

    try:
        # Return the front Vue JS extension css file to include
        api_response = api_instance.get_extension_style(module)
        print("The response of VueJsApi->get_extension_style:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsApi->get_extension_style: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **module** | **str**| Module identifier | 

### Return type

**bytearray**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return the extension css file |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_theme_config**
> ThemeConfigDTO get_theme_config(module_id, theme_id)

Return the front Vue JS theme configuration

### Example


```python
import openapi_client
from openapi_client.models.theme_config_dto import ThemeConfigDTO
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
    api_instance = openapi_client.VueJsApi(api_client)
    module_id = 'opensilex-front' # str | Module identifier
    theme_id = 'phis' # str | Theme identifier

    try:
        # Return the front Vue JS theme configuration
        api_response = api_instance.get_theme_config(module_id, theme_id)
        print("The response of VueJsApi->get_theme_config:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsApi->get_theme_config: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **module_id** | **str**| Module identifier | 
 **theme_id** | **str**| Theme identifier | 

### Return type

[**ThemeConfigDTO**](ThemeConfigDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return the theme configuration |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_theme_css**
> bytearray get_theme_css(module_id, theme_id)

Return the theme css file

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
    api_instance = openapi_client.VueJsApi(api_client)
    module_id = 'opensilex-front' # str | Module identifier
    theme_id = 'phis' # str | Theme identifier

    try:
        # Return the theme css file
        api_response = api_instance.get_theme_css(module_id, theme_id)
        print("The response of VueJsApi->get_theme_css:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsApi->get_theme_css: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **module_id** | **str**| Module identifier | 
 **theme_id** | **str**| Theme identifier | 

### Return type

**bytearray**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return the theme css file |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_theme_resource**
> bytearray get_theme_resource(module_id, theme_id, file_path=file_path, accepted_extensions=accepted_extensions)

Return the theme requested resource

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
    api_instance = openapi_client.VueJsApi(api_client)
    module_id = 'opensilex-front' # str | Module identifier
    theme_id = 'phis' # str | Theme identifier
    file_path = 'images/opensilex.png' # str | Resource path (optional)
    accepted_extensions = ['png'] # List[str] | List of supported file extensions (optional)

    try:
        # Return the theme requested resource
        api_response = api_instance.get_theme_resource(module_id, theme_id, file_path=file_path, accepted_extensions=accepted_extensions)
        print("The response of VueJsApi->get_theme_resource:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsApi->get_theme_resource: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **module_id** | **str**| Module identifier | 
 **theme_id** | **str**| Theme identifier | 
 **file_path** | **str**| Resource path | [optional] 
 **accepted_extensions** | [**List[str]**](str.md)| List of supported file extensions | [optional] 

### Return type

**bytearray**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return the resource |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_user_config**
> UserFrontConfigDTO get_user_config(accept_language=accept_language)

Return the user-specific configuration

### Example


```python
import openapi_client
from openapi_client.models.user_front_config_dto import UserFrontConfigDTO
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
    api_instance = openapi_client.VueJsApi(api_client)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Return the user-specific configuration
        api_response = api_instance.get_user_config(accept_language=accept_language)
        print("The response of VueJsApi->get_user_config:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VueJsApi->get_user_config: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**UserFrontConfigDTO**](UserFrontConfigDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Front application configuration |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

