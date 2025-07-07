# openapi_client.AuthenticationApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authenticate**](AuthenticationApi.md#authenticate) | **POST** /security/authenticate | Authenticate a user and return an access token
[**authenticate_open_id**](AuthenticationApi.md#authenticate_open_id) | **GET** /security/openid | Authenticate a user and return an access token
[**authenticate_saml**](AuthenticationApi.md#authenticate_saml) | **GET** /security/saml | Authenticate a user and return an access token from SAML response
[**forgot_password**](AuthenticationApi.md#forgot_password) | **POST** /security/forgot-password | Send an e-mail confirmation
[**get_credentials_groups**](AuthenticationApi.md#get_credentials_groups) | **GET** /security/credentials | Get list of existing credentials indexed by Swagger @API concepts in the application
[**logout**](AuthenticationApi.md#logout) | **DELETE** /security/logout | Logout by discarding a user token
[**renew_password**](AuthenticationApi.md#renew_password) | **PUT** /security/renew-password | Update user password
[**renew_token**](AuthenticationApi.md#renew_token) | **PUT** /security/renew-token | Send back a new token if the provided one is still valid


# **authenticate**
> TokenGetDTO authenticate(body=body)

Authenticate a user and return an access token

### Example


```python
import openapi_client
from openapi_client.models.authentication_dto import AuthenticationDTO
from openapi_client.models.token_get_dto import TokenGetDTO
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
    api_instance = openapi_client.AuthenticationApi(api_client)
    body = openapi_client.AuthenticationDTO() # AuthenticationDTO | User authentication informations (optional)

    try:
        # Authenticate a user and return an access token
        api_response = api_instance.authenticate(body=body)
        print("The response of AuthenticationApi->authenticate:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AuthenticationApi->authenticate: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**AuthenticationDTO**](AuthenticationDTO.md)| User authentication informations | [optional] 

### Return type

[**TokenGetDTO**](TokenGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | User sucessfully authenticated |  -  |
**403** | Invalid credentials (user does not exists or invalid password) |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authenticate_open_id**
> TokenGetDTO authenticate_open_id(code=code)

Authenticate a user and return an access token

### Example


```python
import openapi_client
from openapi_client.models.token_get_dto import TokenGetDTO
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
    api_instance = openapi_client.AuthenticationApi(api_client)
    code = 'code_example' # str | Authorization code (optional)

    try:
        # Authenticate a user and return an access token
        api_response = api_instance.authenticate_open_id(code=code)
        print("The response of AuthenticationApi->authenticate_open_id:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AuthenticationApi->authenticate_open_id: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **str**| Authorization code | [optional] 

### Return type

[**TokenGetDTO**](TokenGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | User successfully authenticated |  -  |
**403** | Invalid credentials (Bad token provided) |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authenticate_saml**
> authenticate_saml()

Authenticate a user and return an access token from SAML response

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
    api_instance = openapi_client.AuthenticationApi(api_client)

    try:
        # Authenticate a user and return an access token from SAML response
        api_instance.authenticate_saml()
    except Exception as e:
        print("Exception when calling AuthenticationApi->authenticate_saml: %s\n" % e)
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
**302** | User successfully authenticated |  -  |
**403** | Invalid SAML authentication |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **forgot_password**
> forgot_password(identifier)

Send an e-mail confirmation

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
    api_instance = openapi_client.AuthenticationApi(api_client)
    identifier = 'identifier_example' # str | User e-mail or uri

    try:
        # Send an e-mail confirmation
        api_instance.forgot_password(identifier)
    except Exception as e:
        print("Exception when calling AuthenticationApi->forgot_password: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifier** | **str**| User e-mail or uri | 

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
**200** | Email successfully sent |  -  |
**400** | Email not send |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_credentials_groups**
> List[CredentialsGroupDTO] get_credentials_groups()

Get list of existing credentials indexed by Swagger @API concepts in the application

### Example


```python
import openapi_client
from openapi_client.models.credentials_group_dto import CredentialsGroupDTO
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
    api_instance = openapi_client.AuthenticationApi(api_client)

    try:
        # Get list of existing credentials indexed by Swagger @API concepts in the application
        api_response = api_instance.get_credentials_groups()
        print("The response of AuthenticationApi->get_credentials_groups:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AuthenticationApi->get_credentials_groups: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

### Return type

[**List[CredentialsGroupDTO]**](CredentialsGroupDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | List of existing credentials by group in the application |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **logout**
> logout(authorization, accept_language=accept_language)

Logout by discarding a user token

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
    api_instance = openapi_client.AuthenticationApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Logout by discarding a user token
        api_instance.logout(authorization, accept_language=accept_language)
    except Exception as e:
        print("Exception when calling AuthenticationApi->logout: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
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
**200** | User sucessfully logout |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **renew_password**
> TokenGetDTO renew_password(renew_token, check_only=check_only, password=password)

Update user password

### Example


```python
import openapi_client
from openapi_client.models.token_get_dto import TokenGetDTO
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
    api_instance = openapi_client.AuthenticationApi(api_client)
    renew_token = 'renew_token_example' # str | User renew token
    check_only = False # bool | Check only renew token (optional) (default to False)
    password = 'password_example' # str | User password (optional)

    try:
        # Update user password
        api_response = api_instance.renew_password(renew_token, check_only=check_only, password=password)
        print("The response of AuthenticationApi->renew_password:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AuthenticationApi->renew_password: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **renew_token** | **str**| User renew token | 
 **check_only** | **bool**| Check only renew token | [optional] [default to False]
 **password** | **str**| User password | [optional] 

### Return type

[**TokenGetDTO**](TokenGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Password sucessfully renewed |  -  |
**400** | Invalid password |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **renew_token**
> TokenGetDTO renew_token(authorization, accept_language=accept_language)

Send back a new token if the provided one is still valid

### Example


```python
import openapi_client
from openapi_client.models.token_get_dto import TokenGetDTO
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
    api_instance = openapi_client.AuthenticationApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Send back a new token if the provided one is still valid
        api_response = api_instance.renew_token(authorization, accept_language=accept_language)
        print("The response of AuthenticationApi->renew_token:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AuthenticationApi->renew_token: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**TokenGetDTO**](TokenGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Token sucessfully renewed |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

