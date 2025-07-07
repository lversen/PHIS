# openapi_client.SecurityApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**add_favorite**](SecurityApi.md#add_favorite) | **POST** /security/accounts/favorites | Add a favorite
[**add_favorite1**](SecurityApi.md#add_favorite1) | **POST** /security/users/favorites | Add a favorite
[**create_account**](SecurityApi.md#create_account) | **POST** /security/accounts | Add an account
[**create_group**](SecurityApi.md#create_group) | **POST** /security/groups | Add a group
[**create_person**](SecurityApi.md#create_person) | **POST** /security/persons | Add a person
[**create_profile**](SecurityApi.md#create_profile) | **POST** /security/profiles | Add a profile
[**create_user**](SecurityApi.md#create_user) | **POST** /security/users | Add a user
[**delete_account**](SecurityApi.md#delete_account) | **DELETE** /security/accounts/{accountURI} | Delete an account
[**delete_favorite**](SecurityApi.md#delete_favorite) | **DELETE** /security/accounts/favorites/{uriFavorite} | Delete a favorite
[**delete_favorite1**](SecurityApi.md#delete_favorite1) | **DELETE** /security/users/favorites/{uriFavorite} | Delete a favorite
[**delete_group**](SecurityApi.md#delete_group) | **DELETE** /security/groups/{uri} | Delete a group
[**delete_profile**](SecurityApi.md#delete_profile) | **DELETE** /security/profiles/{uri} | Delete a profile
[**get_account**](SecurityApi.md#get_account) | **GET** /security/accounts/{uri} | Get an account
[**get_accounts_by_uri**](SecurityApi.md#get_accounts_by_uri) | **GET** /security/accounts/by_uris | Get accounts by their URIs
[**get_all_profiles**](SecurityApi.md#get_all_profiles) | **GET** /security/profiles/all | Get all profiles
[**get_favorites**](SecurityApi.md#get_favorites) | **GET** /security/accounts/favorites | Get list of favorites for a user
[**get_favorites1**](SecurityApi.md#get_favorites1) | **GET** /security/users/favorites | Get list of favorites for a user
[**get_gdpr_file**](SecurityApi.md#get_gdpr_file) | **GET** /security/persons/GDPR | Get RGPD PDF
[**get_group**](SecurityApi.md#get_group) | **GET** /security/groups/{uri} | Get a group
[**get_groups_by_uri**](SecurityApi.md#get_groups_by_uri) | **GET** /security/groups/by_uris | Get groups by their URIs
[**get_orcid_record**](SecurityApi.md#get_orcid_record) | **GET** /security/persons/orcid_record | Get infos from an ORCID
[**get_person**](SecurityApi.md#get_person) | **GET** /security/persons/{uri} | Get a Person
[**get_persons_by_uri**](SecurityApi.md#get_persons_by_uri) | **GET** /security/persons/by_uris | Get persons by their URIs
[**get_profile**](SecurityApi.md#get_profile) | **GET** /security/profiles/{uri} | Get a profile
[**get_user**](SecurityApi.md#get_user) | **GET** /security/users/{uri} | Get a user
[**get_user_groups**](SecurityApi.md#get_user_groups) | **GET** /security/accounts/{uri}/groups | Get groups of a user
[**get_user_groups1**](SecurityApi.md#get_user_groups1) | **GET** /security/users/{uri}/groups | Get groups of a user
[**get_users_by_uri**](SecurityApi.md#get_users_by_uri) | **GET** /security/users/by_uris | Get users by their URIs
[**search_accounts**](SecurityApi.md#search_accounts) | **GET** /security/accounts | Search accounts
[**search_groups**](SecurityApi.md#search_groups) | **GET** /security/groups | Search groups
[**search_persons**](SecurityApi.md#search_persons) | **GET** /security/persons | Search persons
[**search_profiles**](SecurityApi.md#search_profiles) | **GET** /security/profiles | Search profiles
[**search_users**](SecurityApi.md#search_users) | **GET** /security/users | Search users
[**update_account**](SecurityApi.md#update_account) | **PUT** /security/accounts | Update an account
[**update_group**](SecurityApi.md#update_group) | **PUT** /security/groups | Update a group
[**update_person**](SecurityApi.md#update_person) | **PUT** /security/persons | Update a person
[**update_profile**](SecurityApi.md#update_profile) | **PUT** /security/profiles | Update a profile
[**update_user**](SecurityApi.md#update_user) | **PUT** /security/users | Update a user


# **add_favorite**
> add_favorite(authorization, accept_language=accept_language, body=body)

Add a favorite

### Example


```python
import openapi_client
from openapi_client.models.favorite_creation_dto import FavoriteCreationDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.FavoriteCreationDTO() # FavoriteCreationDTO | Favorite object URI (optional)

    try:
        # Add a favorite
        api_instance.add_favorite(authorization, accept_language=accept_language, body=body)
    except Exception as e:
        print("Exception when calling SecurityApi->add_favorite: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**FavoriteCreationDTO**](FavoriteCreationDTO.md)| Favorite object URI | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**0** | successful operation |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **add_favorite1**
> add_favorite1(authorization, accept_language=accept_language, body=body)

Add a favorite

### Example


```python
import openapi_client
from openapi_client.models.favorite_creation_dto import FavoriteCreationDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.FavoriteCreationDTO() # FavoriteCreationDTO | Favorite object URI (optional)

    try:
        # Add a favorite
        api_instance.add_favorite1(authorization, accept_language=accept_language, body=body)
    except Exception as e:
        print("Exception when calling SecurityApi->add_favorite1: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**FavoriteCreationDTO**](FavoriteCreationDTO.md)| Favorite object URI | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**0** | successful operation |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_account**
> create_account(authorization, accept_language=accept_language, body=body)

Add an account

### Example


```python
import openapi_client
from openapi_client.models.account_creation_dto import AccountCreationDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.AccountCreationDTO() # AccountCreationDTO | Account description (optional)

    try:
        # Add an account
        api_instance.create_account(authorization, accept_language=accept_language, body=body)
    except Exception as e:
        print("Exception when calling SecurityApi->create_account: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**AccountCreationDTO**](AccountCreationDTO.md)| Account description | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**201** | account created |  -  |
**403** | you don&#39;t have permission to create an account |  -  |
**409** | The account already exists (duplicate email) |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_group**
> create_group(authorization, accept_language=accept_language, body=body)

Add a group

### Example


```python
import openapi_client
from openapi_client.models.group_creation_dto import GroupCreationDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.GroupCreationDTO() # GroupCreationDTO | Group description (optional)

    try:
        # Add a group
        api_instance.create_group(authorization, accept_language=accept_language, body=body)
    except Exception as e:
        print("Exception when calling SecurityApi->create_group: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**GroupCreationDTO**](GroupCreationDTO.md)| Group description | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**201** | A group is created |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_person**
> create_person(authorization, accept_language=accept_language, body=body)

Add a person

### Example


```python
import openapi_client
from openapi_client.models.person_dto import PersonDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.PersonDTO() # PersonDTO | Person description (optional)

    try:
        # Add a person
        api_instance.create_person(authorization, accept_language=accept_language, body=body)
    except Exception as e:
        print("Exception when calling SecurityApi->create_person: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**PersonDTO**](PersonDTO.md)| Person description | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**201** | A person is created |  -  |
**409** | The person already exists (duplicate URI) |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_profile**
> create_profile(authorization, accept_language=accept_language, body=body)

Add a profile

### Example


```python
import openapi_client
from openapi_client.models.profile_creation_dto import ProfileCreationDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.ProfileCreationDTO() # ProfileCreationDTO | Profile description (optional)

    try:
        # Add a profile
        api_instance.create_profile(authorization, accept_language=accept_language, body=body)
    except Exception as e:
        print("Exception when calling SecurityApi->create_profile: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**ProfileCreationDTO**](ProfileCreationDTO.md)| Profile description | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**201** | A profile is created |  -  |
**403** | This current user can&#39;t create profiles |  -  |
**409** | The profile name already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_user**
> create_user(authorization, accept_language=accept_language, body=body)

Add a user

### Example


```python
import openapi_client
from openapi_client.models.user_creation_dto import UserCreationDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.UserCreationDTO() # UserCreationDTO | User description (optional)

    try:
        # Add a user
        api_instance.create_user(authorization, accept_language=accept_language, body=body)
    except Exception as e:
        print("Exception when calling SecurityApi->create_user: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**UserCreationDTO**](UserCreationDTO.md)| User description | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**201** | A user is created |  -  |
**403** | This current user can&#39;t create other users with given parameters |  -  |
**409** | The user already exists (duplicate email) |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_account**
> str delete_account(account_uri, authorization, accept_language=accept_language)

Delete an account

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
    api_instance = openapi_client.SecurityApi(api_client)
    account_uri = 'account_uri_example' # str | Account URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete an account
        api_response = api_instance.delete_account(account_uri, authorization, accept_language=accept_language)
        print("The response of SecurityApi->delete_account:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->delete_account: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_uri** | **str**| Account URI | 
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
**200** | Account deleted successfully |  -  |
**400** | Invalid parameters |  -  |
**404** | Account not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_favorite**
> delete_favorite(uri_favorite, authorization, accept_language=accept_language)

Delete a favorite

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
    api_instance = openapi_client.SecurityApi(api_client)
    uri_favorite = 'http://example.com/' # str | Favorite URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a favorite
        api_instance.delete_favorite(uri_favorite, authorization, accept_language=accept_language)
    except Exception as e:
        print("Exception when calling SecurityApi->delete_favorite: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri_favorite** | **str**| Favorite URI | 
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

# **delete_favorite1**
> delete_favorite1(uri_favorite, authorization, accept_language=accept_language)

Delete a favorite

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
    api_instance = openapi_client.SecurityApi(api_client)
    uri_favorite = 'http://example.com/' # str | Favorite URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a favorite
        api_instance.delete_favorite1(uri_favorite, authorization, accept_language=accept_language)
    except Exception as e:
        print("Exception when calling SecurityApi->delete_favorite1: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri_favorite** | **str**| Favorite URI | 
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

# **delete_group**
> delete_group(uri, authorization, accept_language=accept_language)

Delete a group

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
    api_instance = openapi_client.SecurityApi(api_client)
    uri = 'http://example.com/' # str | Group URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a group
        api_instance.delete_group(uri, authorization, accept_language=accept_language)
    except Exception as e:
        print("Exception when calling SecurityApi->delete_group: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Group URI | 
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

# **delete_profile**
> delete_profile(uri, authorization, accept_language=accept_language)

Delete a profile

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
    api_instance = openapi_client.SecurityApi(api_client)
    uri = 'http://example.com/' # str | Profile URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a profile
        api_instance.delete_profile(uri, authorization, accept_language=accept_language)
    except Exception as e:
        print("Exception when calling SecurityApi->delete_profile: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Profile URI | 
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

# **get_account**
> AccountGetDTO get_account(uri, authorization, accept_language=accept_language)

Get an account

### Example


```python
import openapi_client
from openapi_client.models.account_get_dto import AccountGetDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    uri = 'http://opensilex.dev/users#jean.michel.inrae' # str | Account URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get an account
        api_response = api_instance.get_account(uri, authorization, accept_language=accept_language)
        print("The response of SecurityApi->get_account:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->get_account: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Account URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**AccountGetDTO**](AccountGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Account retrieved |  -  |
**400** | Invalid parameters |  -  |
**404** | Account not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_accounts_by_uri**
> List[AccountGetDTO] get_accounts_by_uri(uris, authorization, accept_language=accept_language)

Get accounts by their URIs

### Example


```python
import openapi_client
from openapi_client.models.account_get_dto import AccountGetDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    uris = ['uris_example'] # List[str] | Accounts URIs
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get accounts by their URIs
        api_response = api_instance.get_accounts_by_uri(uris, authorization, accept_language=accept_language)
        print("The response of SecurityApi->get_accounts_by_uri:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->get_accounts_by_uri: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Accounts URIs | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[AccountGetDTO]**](AccountGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return accounts |  -  |
**400** | Invalid parameters |  -  |
**404** | accounts not found (if any provided URIs is not found) |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_all_profiles**
> List[ProfileGetDTO] get_all_profiles(authorization, order_by=order_by, accept_language=accept_language)

Get all profiles

### Example


```python
import openapi_client
from openapi_client.models.profile_get_dto import ProfileGetDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    order_by = ['email=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get all profiles
        api_response = api_instance.get_all_profiles(authorization, order_by=order_by, accept_language=accept_language)
        print("The response of SecurityApi->get_all_profiles:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->get_all_profiles: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ProfileGetDTO]**](ProfileGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return all profiles |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_favorites**
> List[FavoriteGetDTO] get_favorites(types, authorization, accept_language=accept_language)

Get list of favorites for a user

### Example


```python
import openapi_client
from openapi_client.models.favorite_get_dto import FavoriteGetDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    types = ['types_example'] # List[str] | Types
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get list of favorites for a user
        api_response = api_instance.get_favorites(types, authorization, accept_language=accept_language)
        print("The response of SecurityApi->get_favorites:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->get_favorites: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **types** | [**List[str]**](str.md)| Types | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[FavoriteGetDTO]**](FavoriteGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | OK |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_favorites1**
> List[FavoriteGetDTO] get_favorites1(types, authorization, accept_language=accept_language)

Get list of favorites for a user

### Example


```python
import openapi_client
from openapi_client.models.favorite_get_dto import FavoriteGetDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    types = ['types_example'] # List[str] | Types
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get list of favorites for a user
        api_response = api_instance.get_favorites1(types, authorization, accept_language=accept_language)
        print("The response of SecurityApi->get_favorites1:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->get_favorites1: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **types** | [**List[str]**](str.md)| Types | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[FavoriteGetDTO]**](FavoriteGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | OK |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_gdpr_file**
> get_gdpr_file(language=language)

Get RGPD PDF

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
    api_instance = openapi_client.SecurityApi(api_client)
    language = 'fr' # str | preferred language of the file (optional)

    try:
        # Get RGPD PDF
        api_instance.get_gdpr_file(language=language)
    except Exception as e:
        print("Exception when calling SecurityApi->get_gdpr_file: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **language** | **str**| preferred language of the file | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/pdf

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Retrieve file |  -  |
**404** | File does not exists at the location precised in the configuration file |  -  |
**503** | Location of file was not provided in the OpenSilex configuration |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_group**
> GroupDTO get_group(uri, authorization, accept_language=accept_language)

Get a group

### Example


```python
import openapi_client
from openapi_client.models.group_dto import GroupDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    uri = 'dev-groups:admin_group' # str | Group URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a group
        api_response = api_instance.get_group(uri, authorization, accept_language=accept_language)
        print("The response of SecurityApi->get_group:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->get_group: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Group URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**GroupDTO**](GroupDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Group retrieved |  -  |
**400** | Invalid parameters |  -  |
**404** | Group not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_groups_by_uri**
> List[GroupDTO] get_groups_by_uri(uris, authorization, accept_language=accept_language)

Get groups by their URIs

### Example


```python
import openapi_client
from openapi_client.models.group_dto import GroupDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    uris = ['uris_example'] # List[str] | Groups URIs
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get groups by their URIs
        api_response = api_instance.get_groups_by_uri(uris, authorization, accept_language=accept_language)
        print("The response of SecurityApi->get_groups_by_uri:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->get_groups_by_uri: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Groups URIs | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[GroupDTO]**](GroupDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return groups |  -  |
**400** | Invalid parameters |  -  |
**404** | Group not found (if any provided URIs is not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_orcid_record**
> OrcidRecordDTO get_orcid_record(orcid)

Get infos from an ORCID

### Example


```python
import openapi_client
from openapi_client.models.orcid_record_dto import OrcidRecordDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    orcid = 'orcid_example' # str | orcid

    try:
        # Get infos from an ORCID
        api_response = api_instance.get_orcid_record(orcid)
        print("The response of SecurityApi->get_orcid_record:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->get_orcid_record: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orcid** | **str**| orcid | 

### Return type

[**OrcidRecordDTO**](OrcidRecordDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return orcid record |  -  |
**404** | orcid is not found by ORCID API  |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_person**
> PersonDTO get_person(uri, authorization, accept_language=accept_language)

Get a Person

### Example


```python
import openapi_client
from openapi_client.models.person_dto import PersonDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    uri = 'http://opensilex.dev/person#harold.haddock.mistea' # str | Person URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a Person
        api_response = api_instance.get_person(uri, authorization, accept_language=accept_language)
        print("The response of SecurityApi->get_person:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->get_person: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Person URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**PersonDTO**](PersonDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Person retrieved |  -  |
**400** | Invalid parameters |  -  |
**404** | Person not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_persons_by_uri**
> List[PersonDTO] get_persons_by_uri(uris, authorization, accept_language=accept_language)

Get persons by their URIs

### Example


```python
import openapi_client
from openapi_client.models.person_dto import PersonDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    uris = ['uris_example'] # List[str] | Persons URIs
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get persons by their URIs
        api_response = api_instance.get_persons_by_uri(uris, authorization, accept_language=accept_language)
        print("The response of SecurityApi->get_persons_by_uri:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->get_persons_by_uri: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Persons URIs | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[PersonDTO]**](PersonDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return persons |  -  |
**400** | Invalid parameters |  -  |
**404** | Persons not found (if any provided URIs is not found) |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_profile**
> ProfileGetDTO get_profile(uri, authorization, accept_language=accept_language)

Get a profile

### Example


```python
import openapi_client
from openapi_client.models.profile_get_dto import ProfileGetDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    uri = 'dev-users:Admin_OpenSilex' # str | Profile URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a profile
        api_response = api_instance.get_profile(uri, authorization, accept_language=accept_language)
        print("The response of SecurityApi->get_profile:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->get_profile: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Profile URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**ProfileGetDTO**](ProfileGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Profile retrieved |  -  |
**400** | Invalid parameters |  -  |
**404** | Profile not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_user**
> UserGetDTO get_user(uri, authorization, accept_language=accept_language)

Get a user

### Example


```python
import openapi_client
from openapi_client.models.user_get_dto import UserGetDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    uri = 'http://opensilex.dev/users#jean.michel.inrae' # str | User URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a user
        api_response = api_instance.get_user(uri, authorization, accept_language=accept_language)
        print("The response of SecurityApi->get_user:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->get_user: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| User URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**UserGetDTO**](UserGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | User retrieved |  -  |
**400** | Invalid parameters |  -  |
**404** | User not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_user_groups**
> List[NamedResourceDTO] get_user_groups(uri, authorization, accept_language=accept_language)

Get groups of a user

### Example


```python
import openapi_client
from openapi_client.models.named_resource_dto import NamedResourceDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    uri = 'http://example.com/' # str | User URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get groups of a user
        api_response = api_instance.get_user_groups(uri, authorization, accept_language=accept_language)
        print("The response of SecurityApi->get_user_groups:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->get_user_groups: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| User URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[NamedResourceDTO]**](NamedResourceDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return user&#39;s  groups |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_user_groups1**
> List[NamedResourceDTO] get_user_groups1(uri, authorization, accept_language=accept_language)

Get groups of a user

### Example


```python
import openapi_client
from openapi_client.models.named_resource_dto import NamedResourceDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    uri = 'http://example.com/' # str | User URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get groups of a user
        api_response = api_instance.get_user_groups1(uri, authorization, accept_language=accept_language)
        print("The response of SecurityApi->get_user_groups1:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->get_user_groups1: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| User URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[NamedResourceDTO]**](NamedResourceDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return user&#39;s  groups |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_users_by_uri**
> List[UserGetDTO] get_users_by_uri(uris, authorization, accept_language=accept_language)

Get users by their URIs

### Example


```python
import openapi_client
from openapi_client.models.user_get_dto import UserGetDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    uris = ['uris_example'] # List[str] | Users URIs
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get users by their URIs
        api_response = api_instance.get_users_by_uri(uris, authorization, accept_language=accept_language)
        print("The response of SecurityApi->get_users_by_uri:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->get_users_by_uri: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Users URIs | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[UserGetDTO]**](UserGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return users |  -  |
**400** | Invalid parameters |  -  |
**404** | Users not found (if any provided URIs is not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_accounts**
> List[AccountGetDTO] search_accounts(authorization, name=name, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search accounts

### Example


```python
import openapi_client
from openapi_client.models.account_get_dto import AccountGetDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = '.*' # str | Regex pattern for filtering list by name or email (optional) (default to '.*')
    order_by = ['email=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search accounts
        api_response = api_instance.search_accounts(authorization, name=name, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of SecurityApi->search_accounts:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->search_accounts: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Regex pattern for filtering list by name or email | [optional] [default to &#39;.*&#39;]
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[AccountGetDTO]**](AccountGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return accounts |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_groups**
> List[GroupDTO] search_groups(authorization, name=name, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search groups

### Example


```python
import openapi_client
from openapi_client.models.group_dto import GroupDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = '.*' # str | Regex pattern for filtering list by name (optional) (default to '.*')
    order_by = ['email=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search groups
        api_response = api_instance.search_groups(authorization, name=name, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of SecurityApi->search_groups:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->search_groups: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Regex pattern for filtering list by name | [optional] [default to &#39;.*&#39;]
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[GroupDTO]**](GroupDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return groups |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_persons**
> List[PersonDTO] search_persons(authorization, name=name, only_without_account=only_without_account, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search persons

### Example


```python
import openapi_client
from openapi_client.models.person_dto import PersonDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = '.*' # str | Regex pattern for filtering list by name or email (optional) (default to '.*')
    only_without_account = False # bool | set 'true' if you want to select only persons without account (optional) (default to False)
    order_by = ['email=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search persons
        api_response = api_instance.search_persons(authorization, name=name, only_without_account=only_without_account, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of SecurityApi->search_persons:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->search_persons: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Regex pattern for filtering list by name or email | [optional] [default to &#39;.*&#39;]
 **only_without_account** | **bool**| set &#39;true&#39; if you want to select only persons without account | [optional] [default to False]
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[PersonDTO]**](PersonDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return persons |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_profiles**
> List[ProfileGetDTO] search_profiles(authorization, name=name, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search profiles

### Example


```python
import openapi_client
from openapi_client.models.profile_get_dto import ProfileGetDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = '.*' # str | Regex pattern for filtering list by name (optional) (default to '.*')
    order_by = ['email=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search profiles
        api_response = api_instance.search_profiles(authorization, name=name, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of SecurityApi->search_profiles:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->search_profiles: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Regex pattern for filtering list by name | [optional] [default to &#39;.*&#39;]
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ProfileGetDTO]**](ProfileGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return profiles |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_users**
> List[UserGetDTO] search_users(authorization, name=name, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search users

### Example


```python
import openapi_client
from openapi_client.models.user_get_dto import UserGetDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = '.*' # str | Regex pattern for filtering list by name or email (optional) (default to '.*')
    order_by = ['email=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search users
        api_response = api_instance.search_users(authorization, name=name, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of SecurityApi->search_users:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->search_users: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Regex pattern for filtering list by name or email | [optional] [default to &#39;.*&#39;]
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[UserGetDTO]**](UserGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return users |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_account**
> str update_account(authorization, accept_language=accept_language, body=body)

Update an account

### Example


```python
import openapi_client
from openapi_client.models.account_update_dto import AccountUpdateDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.AccountUpdateDTO() # AccountUpdateDTO | Account description (optional)

    try:
        # Update an account
        api_response = api_instance.update_account(authorization, accept_language=accept_language, body=body)
        print("The response of SecurityApi->update_account:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->update_account: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**AccountUpdateDTO**](AccountUpdateDTO.md)| Account description | [optional] 

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
**200** | Account updated |  -  |
**400** | Invalid parameters, remind that changing the linked person is forbidden |  -  |
**404** | Account not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_group**
> str update_group(authorization, accept_language=accept_language, body=body)

Update a group

### Example


```python
import openapi_client
from openapi_client.models.group_update_dto import GroupUpdateDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.GroupUpdateDTO() # GroupUpdateDTO | Group description (optional)

    try:
        # Update a group
        api_response = api_instance.update_group(authorization, accept_language=accept_language, body=body)
        print("The response of SecurityApi->update_group:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->update_group: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**GroupUpdateDTO**](GroupUpdateDTO.md)| Group description | [optional] 

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
**200** | Group updated |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_person**
> str update_person(authorization, accept_language=accept_language, body=body)

Update a person

### Example


```python
import openapi_client
from openapi_client.models.person_dto import PersonDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.PersonDTO() # PersonDTO | Person description (optional)

    try:
        # Update a person
        api_response = api_instance.update_person(authorization, accept_language=accept_language, body=body)
        print("The response of SecurityApi->update_person:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->update_person: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**PersonDTO**](PersonDTO.md)| Person description | [optional] 

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
**200** | Person updated |  -  |
**400** | Invalid parameters |  -  |
**404** | Person not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_profile**
> str update_profile(authorization, accept_language=accept_language, body=body)

Update a profile

### Example


```python
import openapi_client
from openapi_client.models.profile_update_dto import ProfileUpdateDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.ProfileUpdateDTO() # ProfileUpdateDTO | Profile description (optional)

    try:
        # Update a profile
        api_response = api_instance.update_profile(authorization, accept_language=accept_language, body=body)
        print("The response of SecurityApi->update_profile:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->update_profile: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**ProfileUpdateDTO**](ProfileUpdateDTO.md)| Profile description | [optional] 

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
**200** | Return profile uri of the updated profile |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_user**
> str update_user(authorization, accept_language=accept_language, body=body)

Update a user

### Example


```python
import openapi_client
from openapi_client.models.user_update_dto import UserUpdateDTO
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
    api_instance = openapi_client.SecurityApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.UserUpdateDTO() # UserUpdateDTO | User description (optional)

    try:
        # Update a user
        api_response = api_instance.update_user(authorization, accept_language=accept_language, body=body)
        print("The response of SecurityApi->update_user:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling SecurityApi->update_user: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**UserUpdateDTO**](UserUpdateDTO.md)| User description | [optional] 

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
**200** | User updated |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

