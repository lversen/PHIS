# openapi_client.VariablesApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**classic_export_variable_by_uris**](VariablesApi.md#classic_export_variable_by_uris) | **POST** /core/variables/export_classic_by_uris | export variable by list of uris
[**copy_from_shared_resource_instance**](VariablesApi.md#copy_from_shared_resource_instance) | **POST** /core/variables/copy_from_shared_resource_instance | Copy the selected variables from the shared resource instance
[**create_characteristic**](VariablesApi.md#create_characteristic) | **POST** /core/characteristics | Add a characteristic
[**create_entity**](VariablesApi.md#create_entity) | **POST** /core/entities | Add an entity
[**create_interest_entity**](VariablesApi.md#create_interest_entity) | **POST** /core/entities_of_interest | Add an entity of interest
[**create_method**](VariablesApi.md#create_method) | **POST** /core/methods | Add a method
[**create_unit**](VariablesApi.md#create_unit) | **POST** /core/units | Add an unit
[**create_variable**](VariablesApi.md#create_variable) | **POST** /core/variables | Add a variable
[**create_variables_group**](VariablesApi.md#create_variables_group) | **POST** /core/variables_group | Add a variables group
[**delete_characteristic**](VariablesApi.md#delete_characteristic) | **DELETE** /core/characteristics/{uri} | Delete a characteristic
[**delete_entity**](VariablesApi.md#delete_entity) | **DELETE** /core/entities/{uri} | Delete an entity
[**delete_interest_entity**](VariablesApi.md#delete_interest_entity) | **DELETE** /core/entities_of_interest/{uri} | Delete an entity of interest
[**delete_method**](VariablesApi.md#delete_method) | **DELETE** /core/methods/{uri} | Delete a method
[**delete_unit**](VariablesApi.md#delete_unit) | **DELETE** /core/units/{uri} | Delete an unit
[**delete_variable**](VariablesApi.md#delete_variable) | **DELETE** /core/variables/{uri} | Delete a variable
[**delete_variables_group**](VariablesApi.md#delete_variables_group) | **DELETE** /core/variables_group/{uri} | Delete a variables group
[**details_export_variable_by_uris**](VariablesApi.md#details_export_variable_by_uris) | **POST** /core/variables/export_details_by_uris | export detailed variable by list of uris
[**get_characteristic**](VariablesApi.md#get_characteristic) | **GET** /core/characteristics/{uri} | Get a characteristic
[**get_characteristics_by_uris**](VariablesApi.md#get_characteristics_by_uris) | **GET** /core/characteristics/by_uris | Get detailed characteristics by uris
[**get_datatypes**](VariablesApi.md#get_datatypes) | **GET** /core/variables/datatypes | Get variables datatypes
[**get_entities_by_uris**](VariablesApi.md#get_entities_by_uris) | **GET** /core/entities/by_uris | Get detailed entities by uris
[**get_entity**](VariablesApi.md#get_entity) | **GET** /core/entities/{uri} | Get an entity
[**get_interest_entities_by_uris**](VariablesApi.md#get_interest_entities_by_uris) | **GET** /core/entities_of_interest/by_uris | Get detailed entities of interest by uris
[**get_interest_entity**](VariablesApi.md#get_interest_entity) | **GET** /core/entities_of_interest/{uri} | Get an entity of interest
[**get_method**](VariablesApi.md#get_method) | **GET** /core/methods/{uri} | Get a method
[**get_methods_by_uris**](VariablesApi.md#get_methods_by_uris) | **GET** /core/methods/by_uris | Get detailed methods by uris
[**get_unit**](VariablesApi.md#get_unit) | **GET** /core/units/{uri} | Get an unit
[**get_units_by_uris**](VariablesApi.md#get_units_by_uris) | **GET** /core/units/by_uris | Get detailed units by uris
[**get_variable**](VariablesApi.md#get_variable) | **GET** /core/variables/{uri} | Get a variable
[**get_variables_by_uris**](VariablesApi.md#get_variables_by_uris) | **GET** /core/variables/by_uris | Get detailed variables by uris
[**get_variables_group**](VariablesApi.md#get_variables_group) | **GET** /core/variables_group/{uri} | Get a variables group
[**get_variables_group_by_uris**](VariablesApi.md#get_variables_group_by_uris) | **GET** /core/variables_group/by_uris | Get variables groups by their URIs
[**search_characteristics**](VariablesApi.md#search_characteristics) | **GET** /core/characteristics | Search characteristics by name
[**search_entities**](VariablesApi.md#search_entities) | **GET** /core/entities | Search entities by name
[**search_interest_entity**](VariablesApi.md#search_interest_entity) | **GET** /core/entities_of_interest | Search entities of interest by name
[**search_methods**](VariablesApi.md#search_methods) | **GET** /core/methods | Search methods by name
[**search_units**](VariablesApi.md#search_units) | **GET** /core/units | Search units by name
[**search_variables**](VariablesApi.md#search_variables) | **GET** /core/variables | Search variables
[**search_variables_details**](VariablesApi.md#search_variables_details) | **GET** /core/variables/details | Search detailed variables by name, long name, entity, characteristic, method or unit name
[**search_variables_groups**](VariablesApi.md#search_variables_groups) | **GET** /core/variables_group | Search variables groups
[**update_characteristic**](VariablesApi.md#update_characteristic) | **PUT** /core/characteristics | Update a characteristic
[**update_entity**](VariablesApi.md#update_entity) | **PUT** /core/entities | Update an entity
[**update_interest_entity**](VariablesApi.md#update_interest_entity) | **PUT** /core/entities_of_interest | Update an entity of interest
[**update_method**](VariablesApi.md#update_method) | **PUT** /core/methods | Update a method
[**update_unit**](VariablesApi.md#update_unit) | **PUT** /core/units | Update an unit
[**update_variable**](VariablesApi.md#update_variable) | **PUT** /core/variables | Update a variable
[**update_variables_group**](VariablesApi.md#update_variables_group) | **PUT** /core/variables_group | Update a variables group


# **classic_export_variable_by_uris**
> classic_export_variable_by_uris(authorization, accept_language=accept_language, body=body)

export variable by list of uris

### Example


```python
import openapi_client
from openapi_client.models.uris_list_post_dto import URIsListPostDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.URIsListPostDTO() # URIsListPostDTO | List of variable URI (optional)

    try:
        # export variable by list of uris
        api_instance.classic_export_variable_by_uris(authorization, accept_language=accept_language, body=body)
    except Exception as e:
        print("Exception when calling VariablesApi->classic_export_variable_by_uris: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**URIsListPostDTO**](URIsListPostDTO.md)| List of variable URI | [optional] 

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
**200** | Return a csv file with variable list |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **copy_from_shared_resource_instance**
> VariableCopyResponseDTO copy_from_shared_resource_instance(authorization, body, accept_language=accept_language)

Copy the selected variables from the shared resource instance

### Example


```python
import openapi_client
from openapi_client.models.copy_resource_dto import CopyResourceDTO
from openapi_client.models.variable_copy_response_dto import VariableCopyResponseDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    body = openapi_client.CopyResourceDTO() # CopyResourceDTO | List of variable URI to copy
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Copy the selected variables from the shared resource instance
        api_response = api_instance.copy_from_shared_resource_instance(authorization, body, accept_language=accept_language)
        print("The response of VariablesApi->copy_from_shared_resource_instance:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->copy_from_shared_resource_instance: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **body** | [**CopyResourceDTO**](CopyResourceDTO.md)| List of variable URI to copy | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**VariableCopyResponseDTO**](VariableCopyResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Copy variables |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_characteristic**
> str create_characteristic(authorization, accept_language=accept_language, body=body)

Add a characteristic

### Example


```python
import openapi_client
from openapi_client.models.characteristic_creation_dto import CharacteristicCreationDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.CharacteristicCreationDTO() # CharacteristicCreationDTO | Characteristic description (optional)

    try:
        # Add a characteristic
        api_response = api_instance.create_characteristic(authorization, accept_language=accept_language, body=body)
        print("The response of VariablesApi->create_characteristic:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->create_characteristic: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**CharacteristicCreationDTO**](CharacteristicCreationDTO.md)| Characteristic description | [optional] 

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
**201** | A characteristic is created |  -  |
**409** | A characteristic with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_entity**
> str create_entity(authorization, accept_language=accept_language, body=body)

Add an entity

### Example


```python
import openapi_client
from openapi_client.models.entity_creation_dto import EntityCreationDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.EntityCreationDTO() # EntityCreationDTO | Entity description (optional)

    try:
        # Add an entity
        api_response = api_instance.create_entity(authorization, accept_language=accept_language, body=body)
        print("The response of VariablesApi->create_entity:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->create_entity: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**EntityCreationDTO**](EntityCreationDTO.md)| Entity description | [optional] 

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
**201** | An entity is created |  -  |
**409** | An entity with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_interest_entity**
> str create_interest_entity(authorization, accept_language=accept_language, body=body)

Add an entity of interest

### Example


```python
import openapi_client
from openapi_client.models.interest_entity_creation_dto import InterestEntityCreationDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.InterestEntityCreationDTO() # InterestEntityCreationDTO | Entity of interest description (optional)

    try:
        # Add an entity of interest
        api_response = api_instance.create_interest_entity(authorization, accept_language=accept_language, body=body)
        print("The response of VariablesApi->create_interest_entity:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->create_interest_entity: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**InterestEntityCreationDTO**](InterestEntityCreationDTO.md)| Entity of interest description | [optional] 

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
**201** | An entity of interest is created |  -  |
**409** | An entity of interest with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_method**
> str create_method(authorization, accept_language=accept_language, body=body)

Add a method

### Example


```python
import openapi_client
from openapi_client.models.method_creation_dto import MethodCreationDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.MethodCreationDTO() # MethodCreationDTO | Method description (optional)

    try:
        # Add a method
        api_response = api_instance.create_method(authorization, accept_language=accept_language, body=body)
        print("The response of VariablesApi->create_method:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->create_method: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**MethodCreationDTO**](MethodCreationDTO.md)| Method description | [optional] 

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
**201** | A method is created |  -  |
**409** | A method with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_unit**
> str create_unit(authorization, accept_language=accept_language, body=body)

Add an unit

### Example


```python
import openapi_client
from openapi_client.models.unit_creation_dto import UnitCreationDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.UnitCreationDTO() # UnitCreationDTO | Unit description (optional)

    try:
        # Add an unit
        api_response = api_instance.create_unit(authorization, accept_language=accept_language, body=body)
        print("The response of VariablesApi->create_unit:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->create_unit: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**UnitCreationDTO**](UnitCreationDTO.md)| Unit description | [optional] 

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
**201** | An unit is created |  -  |
**409** | An unit with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_variable**
> str create_variable(authorization, accept_language=accept_language, body=body)

Add a variable

### Example


```python
import openapi_client
from openapi_client.models.variable_creation_dto import VariableCreationDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.VariableCreationDTO() # VariableCreationDTO | Variable description (optional)

    try:
        # Add a variable
        api_response = api_instance.create_variable(authorization, accept_language=accept_language, body=body)
        print("The response of VariablesApi->create_variable:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->create_variable: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**VariableCreationDTO**](VariableCreationDTO.md)| Variable description | [optional] 

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
**201** | A variable is created |  -  |
**409** | A Variable with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_variables_group**
> str create_variables_group(authorization, accept_language=accept_language, body=body)

Add a variables group

### Example


```python
import openapi_client
from openapi_client.models.variables_group_creation_dto import VariablesGroupCreationDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.VariablesGroupCreationDTO() # VariablesGroupCreationDTO | Variables group description (optional)

    try:
        # Add a variables group
        api_response = api_instance.create_variables_group(authorization, accept_language=accept_language, body=body)
        print("The response of VariablesApi->create_variables_group:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->create_variables_group: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**VariablesGroupCreationDTO**](VariablesGroupCreationDTO.md)| Variables group description | [optional] 

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
**201** | A variables group is created |  -  |
**409** | A variables group with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_characteristic**
> str delete_characteristic(uri, authorization, accept_language=accept_language)

Delete a characteristic

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
    api_instance = openapi_client.VariablesApi(api_client)
    uri = 'http://opensilex.dev/set/variables/characteristic/Height' # str | Characteristic URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a characteristic
        api_response = api_instance.delete_characteristic(uri, authorization, accept_language=accept_language)
        print("The response of VariablesApi->delete_characteristic:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->delete_characteristic: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Characteristic URI | 
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
**200** | Characteristic deleted |  -  |
**404** | Unknown characteristic URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_entity**
> str delete_entity(uri, authorization, accept_language=accept_language)

Delete an entity

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
    api_instance = openapi_client.VariablesApi(api_client)
    uri = 'http://opensilex.dev/set/variables/entity/Plant' # str | Entity URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete an entity
        api_response = api_instance.delete_entity(uri, authorization, accept_language=accept_language)
        print("The response of VariablesApi->delete_entity:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->delete_entity: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Entity URI | 
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
**200** | Entity deleted |  -  |
**404** | Unknown entity URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_interest_entity**
> str delete_interest_entity(uri, authorization, accept_language=accept_language)

Delete an entity of interest

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
    api_instance = openapi_client.VariablesApi(api_client)
    uri = 'http://opensilex.dev/set/variables/entity_of_interest/Plot' # str | Entity of interest URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete an entity of interest
        api_response = api_instance.delete_interest_entity(uri, authorization, accept_language=accept_language)
        print("The response of VariablesApi->delete_interest_entity:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->delete_interest_entity: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Entity of interest URI | 
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
**200** | Entity of interest deleted |  -  |
**404** | Unknown entity of interest URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_method**
> str delete_method(uri, authorization, accept_language=accept_language)

Delete a method

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
    api_instance = openapi_client.VariablesApi(api_client)
    uri = 'http://opensilex.dev/set/variables/method/ImageAnalysis' # str | Method URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a method
        api_response = api_instance.delete_method(uri, authorization, accept_language=accept_language)
        print("The response of VariablesApi->delete_method:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->delete_method: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Method URI | 
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
**200** | Method deleted |  -  |
**404** | Unknown method URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_unit**
> str delete_unit(uri, authorization, accept_language=accept_language)

Delete an unit

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
    api_instance = openapi_client.VariablesApi(api_client)
    uri = 'http://opensilex.dev/set/variables/unit/Centimeter' # str | Unit URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete an unit
        api_response = api_instance.delete_unit(uri, authorization, accept_language=accept_language)
        print("The response of VariablesApi->delete_unit:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->delete_unit: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Unit URI | 
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
**200** | Unit deleted |  -  |
**404** | Unknown unit URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_variable**
> str delete_variable(uri, authorization, accept_language=accept_language)

Delete a variable

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
    api_instance = openapi_client.VariablesApi(api_client)
    uri = 'http://opensilex.dev/set/variables/Plant_Height' # str | Variable URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a variable
        api_response = api_instance.delete_variable(uri, authorization, accept_language=accept_language)
        print("The response of VariablesApi->delete_variable:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->delete_variable: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Variable URI | 
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
**200** | Variable deleted |  -  |
**404** | Unknown variable URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_variables_group**
> str delete_variables_group(uri, authorization, accept_language=accept_language)

Delete a variables group

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
    api_instance = openapi_client.VariablesApi(api_client)
    uri = 'uri_example' # str | Variables group URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a variables group
        api_response = api_instance.delete_variables_group(uri, authorization, accept_language=accept_language)
        print("The response of VariablesApi->delete_variables_group:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->delete_variables_group: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Variables group URI | 
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
**200** | Variables group deleted |  -  |
**404** | Unknown variables group URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **details_export_variable_by_uris**
> details_export_variable_by_uris(authorization, accept_language=accept_language, body=body)

export detailed variable by list of uris

### Example


```python
import openapi_client
from openapi_client.models.uris_list_post_dto import URIsListPostDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.URIsListPostDTO() # URIsListPostDTO | List of variable URI (optional)

    try:
        # export detailed variable by list of uris
        api_instance.details_export_variable_by_uris(authorization, accept_language=accept_language, body=body)
    except Exception as e:
        print("Exception when calling VariablesApi->details_export_variable_by_uris: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**URIsListPostDTO**](URIsListPostDTO.md)| List of variable URI | [optional] 

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
**200** | Return a csv file with detailed variable list |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_characteristic**
> CharacteristicDetailsDTO get_characteristic(uri, authorization, accept_language=accept_language)

Get a characteristic

### Example


```python
import openapi_client
from openapi_client.models.characteristic_details_dto import CharacteristicDetailsDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    uri = 'http://opensilex.dev/set/variables/characteristic/Height' # str | Characteristic URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a characteristic
        api_response = api_instance.get_characteristic(uri, authorization, accept_language=accept_language)
        print("The response of VariablesApi->get_characteristic:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->get_characteristic: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Characteristic URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**CharacteristicDetailsDTO**](CharacteristicDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Characteristic retrieved |  -  |
**404** | Unknown characteristic URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_characteristics_by_uris**
> List[CharacteristicDetailsDTO] get_characteristics_by_uris(uris, authorization, shared_resource_instance=shared_resource_instance, accept_language=accept_language)

Get detailed characteristics by uris

### Example


```python
import openapi_client
from openapi_client.models.characteristic_details_dto import CharacteristicDetailsDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    uris = ['uris_example'] # List[str] | Characteristics URIs
    authorization = 'authorization_example' # str | Authentication token
    shared_resource_instance = 'shared_resource_instance_example' # str | Shared resource instance (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get detailed characteristics by uris
        api_response = api_instance.get_characteristics_by_uris(uris, authorization, shared_resource_instance=shared_resource_instance, accept_language=accept_language)
        print("The response of VariablesApi->get_characteristics_by_uris:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->get_characteristics_by_uris: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Characteristics URIs | 
 **authorization** | **str**| Authentication token | 
 **shared_resource_instance** | **str**| Shared resource instance | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[CharacteristicDetailsDTO]**](CharacteristicDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return characteristics |  -  |
**400** | Invalid parameters |  -  |
**404** | Characteristic not found (if any provided URIs is not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_datatypes**
> List[VariableDatatypeDTO] get_datatypes()

Get variables datatypes

### Example


```python
import openapi_client
from openapi_client.models.variable_datatype_dto import VariableDatatypeDTO
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
    api_instance = openapi_client.VariablesApi(api_client)

    try:
        # Get variables datatypes
        api_response = api_instance.get_datatypes()
        print("The response of VariablesApi->get_datatypes:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->get_datatypes: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

### Return type

[**List[VariableDatatypeDTO]**](VariableDatatypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return data types |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_entities_by_uris**
> List[EntityDetailsDTO] get_entities_by_uris(uris, authorization, shared_resource_instance=shared_resource_instance, accept_language=accept_language)

Get detailed entities by uris

### Example


```python
import openapi_client
from openapi_client.models.entity_details_dto import EntityDetailsDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    uris = ['uris_example'] # List[str] | Entities URIs
    authorization = 'authorization_example' # str | Authentication token
    shared_resource_instance = 'shared_resource_instance_example' # str | Shared resource instance (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get detailed entities by uris
        api_response = api_instance.get_entities_by_uris(uris, authorization, shared_resource_instance=shared_resource_instance, accept_language=accept_language)
        print("The response of VariablesApi->get_entities_by_uris:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->get_entities_by_uris: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Entities URIs | 
 **authorization** | **str**| Authentication token | 
 **shared_resource_instance** | **str**| Shared resource instance | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[EntityDetailsDTO]**](EntityDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return entities |  -  |
**400** | Invalid parameters |  -  |
**404** | Entity not found (if any provided URIs is not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_entity**
> EntityDetailsDTO get_entity(uri, authorization, accept_language=accept_language)

Get an entity

### Example


```python
import openapi_client
from openapi_client.models.entity_details_dto import EntityDetailsDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    uri = 'http://opensilex.dev/set/variables/entity/Plant' # str | Entity URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get an entity
        api_response = api_instance.get_entity(uri, authorization, accept_language=accept_language)
        print("The response of VariablesApi->get_entity:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->get_entity: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Entity URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**EntityDetailsDTO**](EntityDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Entity retrieved |  -  |
**404** | Unknown entity URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_interest_entities_by_uris**
> List[InterestEntityDetailsDTO] get_interest_entities_by_uris(uris, authorization, shared_resource_instance=shared_resource_instance, accept_language=accept_language)

Get detailed entities of interest by uris

### Example


```python
import openapi_client
from openapi_client.models.interest_entity_details_dto import InterestEntityDetailsDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    uris = ['uris_example'] # List[str] | Entities of interest URIs
    authorization = 'authorization_example' # str | Authentication token
    shared_resource_instance = 'shared_resource_instance_example' # str | Shared resource instance (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get detailed entities of interest by uris
        api_response = api_instance.get_interest_entities_by_uris(uris, authorization, shared_resource_instance=shared_resource_instance, accept_language=accept_language)
        print("The response of VariablesApi->get_interest_entities_by_uris:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->get_interest_entities_by_uris: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Entities of interest URIs | 
 **authorization** | **str**| Authentication token | 
 **shared_resource_instance** | **str**| Shared resource instance | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[InterestEntityDetailsDTO]**](InterestEntityDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return entities of interest |  -  |
**400** | Invalid parameters |  -  |
**404** | Entity of interest not found (if any provided URIs is not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_interest_entity**
> InterestEntityDetailsDTO get_interest_entity(uri, authorization, accept_language=accept_language)

Get an entity of interest

### Example


```python
import openapi_client
from openapi_client.models.interest_entity_details_dto import InterestEntityDetailsDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    uri = 'http://opensilex.dev/set/variables/entity_of_interest/Plot' # str | Entity of interest URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get an entity of interest
        api_response = api_instance.get_interest_entity(uri, authorization, accept_language=accept_language)
        print("The response of VariablesApi->get_interest_entity:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->get_interest_entity: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Entity of interest URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**InterestEntityDetailsDTO**](InterestEntityDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Entity of interest retrieved |  -  |
**404** | Unknown entity of interest URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_method**
> MethodDetailsDTO get_method(uri, authorization, accept_language=accept_language)

Get a method

### Example


```python
import openapi_client
from openapi_client.models.method_details_dto import MethodDetailsDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    uri = 'http://opensilex.dev/set/variables/method/ImageAnalysis' # str | Method URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a method
        api_response = api_instance.get_method(uri, authorization, accept_language=accept_language)
        print("The response of VariablesApi->get_method:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->get_method: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Method URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**MethodDetailsDTO**](MethodDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Method retrieved |  -  |
**500** | Internal Server Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_methods_by_uris**
> List[MethodDetailsDTO] get_methods_by_uris(uris, authorization, shared_resource_instance=shared_resource_instance, accept_language=accept_language)

Get detailed methods by uris

### Example


```python
import openapi_client
from openapi_client.models.method_details_dto import MethodDetailsDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    uris = ['uris_example'] # List[str] | Methods URIs
    authorization = 'authorization_example' # str | Authentication token
    shared_resource_instance = 'shared_resource_instance_example' # str | Shared resource instance (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get detailed methods by uris
        api_response = api_instance.get_methods_by_uris(uris, authorization, shared_resource_instance=shared_resource_instance, accept_language=accept_language)
        print("The response of VariablesApi->get_methods_by_uris:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->get_methods_by_uris: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Methods URIs | 
 **authorization** | **str**| Authentication token | 
 **shared_resource_instance** | **str**| Shared resource instance | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[MethodDetailsDTO]**](MethodDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return methods |  -  |
**400** | Invalid parameters |  -  |
**404** | Method not found (if any provided URIs is not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_unit**
> UnitDetailsDTO get_unit(uri, authorization, accept_language=accept_language)

Get an unit

### Example


```python
import openapi_client
from openapi_client.models.unit_details_dto import UnitDetailsDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    uri = 'http://opensilex.dev/set/variables/unit/Centimeter' # str | Unit URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get an unit
        api_response = api_instance.get_unit(uri, authorization, accept_language=accept_language)
        print("The response of VariablesApi->get_unit:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->get_unit: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Unit URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**UnitDetailsDTO**](UnitDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Unit retrieved |  -  |
**404** | Unknown unit URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_units_by_uris**
> List[UnitDetailsDTO] get_units_by_uris(uris, authorization, shared_resource_instance=shared_resource_instance, accept_language=accept_language)

Get detailed units by uris

### Example


```python
import openapi_client
from openapi_client.models.unit_details_dto import UnitDetailsDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    uris = ['uris_example'] # List[str] | Units URIs
    authorization = 'authorization_example' # str | Authentication token
    shared_resource_instance = 'shared_resource_instance_example' # str | Shared resource instance (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get detailed units by uris
        api_response = api_instance.get_units_by_uris(uris, authorization, shared_resource_instance=shared_resource_instance, accept_language=accept_language)
        print("The response of VariablesApi->get_units_by_uris:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->get_units_by_uris: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Units URIs | 
 **authorization** | **str**| Authentication token | 
 **shared_resource_instance** | **str**| Shared resource instance | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[UnitDetailsDTO]**](UnitDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return units |  -  |
**400** | Invalid parameters |  -  |
**404** | Unit not found (if any provided URIs is not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_variable**
> VariableDetailsDTO get_variable(uri, authorization, shared_resource_instance=shared_resource_instance, accept_language=accept_language)

Get a variable

### Example


```python
import openapi_client
from openapi_client.models.variable_details_dto import VariableDetailsDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    uri = 'http://opensilex.dev/set/variables/Plant_Height' # str | Variable URI
    authorization = 'authorization_example' # str | Authentication token
    shared_resource_instance = 'shared_resource_instance_example' # str | Shared resource instance (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a variable
        api_response = api_instance.get_variable(uri, authorization, shared_resource_instance=shared_resource_instance, accept_language=accept_language)
        print("The response of VariablesApi->get_variable:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->get_variable: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Variable URI | 
 **authorization** | **str**| Authentication token | 
 **shared_resource_instance** | **str**| Shared resource instance | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**VariableDetailsDTO**](VariableDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Variable retrieved |  -  |
**404** | Unknown variable URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_variables_by_uris**
> List[VariableDetailsDTO] get_variables_by_uris(uris, authorization, accept_language=accept_language)

Get detailed variables by uris

### Example


```python
import openapi_client
from openapi_client.models.variable_details_dto import VariableDetailsDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    uris = ['uris_example'] # List[str] | Variables URIs
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get detailed variables by uris
        api_response = api_instance.get_variables_by_uris(uris, authorization, accept_language=accept_language)
        print("The response of VariablesApi->get_variables_by_uris:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->get_variables_by_uris: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Variables URIs | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[VariableDetailsDTO]**](VariableDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return variables |  -  |
**400** | Invalid parameters |  -  |
**404** | Variable not found (if any provided URIs is not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_variables_group**
> VariablesGroupGetDTO get_variables_group(uri, authorization, accept_language=accept_language)

Get a variables group

### Example


```python
import openapi_client
from openapi_client.models.variables_group_get_dto import VariablesGroupGetDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    uri = 'uri_example' # str | Variables group URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a variables group
        api_response = api_instance.get_variables_group(uri, authorization, accept_language=accept_language)
        print("The response of VariablesApi->get_variables_group:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->get_variables_group: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Variables group URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**VariablesGroupGetDTO**](VariablesGroupGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Variables group retrieved |  -  |
**404** | Unknown variables group URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_variables_group_by_uris**
> List[VariablesGroupGetDTO] get_variables_group_by_uris(uris, authorization, shared_resource_instance=shared_resource_instance, accept_language=accept_language)

Get variables groups by their URIs

### Example


```python
import openapi_client
from openapi_client.models.variables_group_get_dto import VariablesGroupGetDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    uris = ['uris_example'] # List[str] | Variables group URIs
    authorization = 'authorization_example' # str | Authentication token
    shared_resource_instance = 'shared_resource_instance_example' # str | Shared resource instance (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get variables groups by their URIs
        api_response = api_instance.get_variables_group_by_uris(uris, authorization, shared_resource_instance=shared_resource_instance, accept_language=accept_language)
        print("The response of VariablesApi->get_variables_group_by_uris:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->get_variables_group_by_uris: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Variables group URIs | 
 **authorization** | **str**| Authentication token | 
 **shared_resource_instance** | **str**| Shared resource instance | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[VariablesGroupGetDTO]**](VariablesGroupGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return variables groups |  -  |
**400** | Invalid parameters |  -  |
**404** | Variables group not found (if any provided URIs is not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_characteristics**
> List[CharacteristicGetDTO] search_characteristics(authorization, name=name, order_by=order_by, page=page, page_size=page_size, shared_resource_instance=shared_resource_instance, accept_language=accept_language)

Search characteristics by name

### Example


```python
import openapi_client
from openapi_client.models.characteristic_get_dto import CharacteristicGetDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = 'Height' # str | Name (regex) (optional)
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional)
    shared_resource_instance = 'shared_resource_instance_example' # str | Shared resource instance (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search characteristics by name
        api_response = api_instance.search_characteristics(authorization, name=name, order_by=order_by, page=page, page_size=page_size, shared_resource_instance=shared_resource_instance, accept_language=accept_language)
        print("The response of VariablesApi->search_characteristics:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->search_characteristics: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Name (regex) | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] 
 **shared_resource_instance** | **str**| Shared resource instance | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[CharacteristicGetDTO]**](CharacteristicGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return characteristic list |  -  |
**500** | Internal Server Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_entities**
> List[EntityGetDTO] search_entities(authorization, name=name, order_by=order_by, page=page, page_size=page_size, shared_resource_instance=shared_resource_instance, accept_language=accept_language)

Search entities by name

### Example


```python
import openapi_client
from openapi_client.models.entity_get_dto import EntityGetDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = 'plant' # str | Name (regex) (optional)
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional)
    shared_resource_instance = 'shared_resource_instance_example' # str | Shared resource instance (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search entities by name
        api_response = api_instance.search_entities(authorization, name=name, order_by=order_by, page=page, page_size=page_size, shared_resource_instance=shared_resource_instance, accept_language=accept_language)
        print("The response of VariablesApi->search_entities:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->search_entities: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Name (regex) | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] 
 **shared_resource_instance** | **str**| Shared resource instance | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[EntityGetDTO]**](EntityGetDTO.md)

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

# **search_interest_entity**
> List[InterestEntityGetDTO] search_interest_entity(authorization, name=name, order_by=order_by, page=page, page_size=page_size, shared_resource_instance=shared_resource_instance, accept_language=accept_language)

Search entities of interest by name

### Example


```python
import openapi_client
from openapi_client.models.interest_entity_get_dto import InterestEntityGetDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = 'plot' # str | Name (regex) (optional)
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional)
    shared_resource_instance = 'shared_resource_instance_example' # str | Shared resource instance (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search entities of interest by name
        api_response = api_instance.search_interest_entity(authorization, name=name, order_by=order_by, page=page, page_size=page_size, shared_resource_instance=shared_resource_instance, accept_language=accept_language)
        print("The response of VariablesApi->search_interest_entity:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->search_interest_entity: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Name (regex) | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] 
 **shared_resource_instance** | **str**| Shared resource instance | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[InterestEntityGetDTO]**](InterestEntityGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return entities of interest |  -  |
**500** | Internal Server Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_methods**
> List[MethodGetDTO] search_methods(authorization, name=name, order_by=order_by, page=page, page_size=page_size, shared_resource_instance=shared_resource_instance, accept_language=accept_language)

Search methods by name

### Example


```python
import openapi_client
from openapi_client.models.method_get_dto import MethodGetDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = 'ImageAnalysis' # str | Name (regex) (optional)
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional)
    shared_resource_instance = 'shared_resource_instance_example' # str | Shared resource instance (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search methods by name
        api_response = api_instance.search_methods(authorization, name=name, order_by=order_by, page=page, page_size=page_size, shared_resource_instance=shared_resource_instance, accept_language=accept_language)
        print("The response of VariablesApi->search_methods:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->search_methods: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Name (regex) | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] 
 **shared_resource_instance** | **str**| Shared resource instance | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[MethodGetDTO]**](MethodGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return methods |  -  |
**500** | Internal Server Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_units**
> List[UnitGetDTO] search_units(authorization, name=name, order_by=order_by, page=page, page_size=page_size, shared_resource_instance=shared_resource_instance, accept_language=accept_language)

Search units by name

### Example


```python
import openapi_client
from openapi_client.models.unit_get_dto import UnitGetDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = 'Centimeter' # str | Name (regex) (optional)
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional)
    shared_resource_instance = 'shared_resource_instance_example' # str | Shared resource instance (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search units by name
        api_response = api_instance.search_units(authorization, name=name, order_by=order_by, page=page, page_size=page_size, shared_resource_instance=shared_resource_instance, accept_language=accept_language)
        print("The response of VariablesApi->search_units:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->search_units: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Name (regex) | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] 
 **shared_resource_instance** | **str**| Shared resource instance | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[UnitGetDTO]**](UnitGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return Unit list |  -  |
**500** | Internal Server Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_variables**
> List[VariableGetDTO] search_variables(authorization, name=name, entity=entity, entity_of_interest=entity_of_interest, characteristic=characteristic, method=method, unit=unit, group_of_variables=group_of_variables, not_included_in_group_of_variables=not_included_in_group_of_variables, data_type=data_type, time_interval=time_interval, species=species, with_associated_data=with_associated_data, experiments=experiments, scientific_objects=scientific_objects, devices=devices, order_by=order_by, page=page, page_size=page_size, shared_resource_instance=shared_resource_instance, accept_language=accept_language)

Search variables

The following fields could be used for sorting : 

 _entity_name/entityName : the name of the variable entity

 _characteristic_name/characteristicName : the name of the variable characteristic

 _method_name/methodName : the name of the variable method

 _unit_name/unitName : the name of the variable unit



### Example


```python
import openapi_client
from openapi_client.models.variable_get_dto import VariableGetDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = 'plant_height' # str | Name regex pattern (optional)
    entity = 'entity_example' # str | Entity filter (optional)
    entity_of_interest = 'entity_of_interest_example' # str | Entity of interest filter (optional)
    characteristic = 'characteristic_example' # str | Characteristic filter (optional)
    method = 'method_example' # str | Method filter (optional)
    unit = 'unit_example' # str | Unit filter (optional)
    group_of_variables = 'group_of_variables_example' # str | Included in group filter (optional)
    not_included_in_group_of_variables = 'not_included_in_group_of_variables_example' # str | Not included in group filter (optional)
    data_type = 'data_type_example' # str | Data type filter (optional)
    time_interval = 'time_interval_example' # str | Time interval filter (optional)
    species = ['species_example'] # List[str] | Species filter (optional)
    with_associated_data = False # bool | Set this param to true to get associated data (optional) (default to False)
    experiments = ['experiments_example'] # List[str] | Experiment filter (optional)
    scientific_objects = ['scientific_objects_example'] # List[str] | Scientific object filter (optional)
    devices = ['devices_example'] # List[str] | Device filter (optional)
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    shared_resource_instance = 'shared_resource_instance_example' # str | Shared resource instance (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search variables
        api_response = api_instance.search_variables(authorization, name=name, entity=entity, entity_of_interest=entity_of_interest, characteristic=characteristic, method=method, unit=unit, group_of_variables=group_of_variables, not_included_in_group_of_variables=not_included_in_group_of_variables, data_type=data_type, time_interval=time_interval, species=species, with_associated_data=with_associated_data, experiments=experiments, scientific_objects=scientific_objects, devices=devices, order_by=order_by, page=page, page_size=page_size, shared_resource_instance=shared_resource_instance, accept_language=accept_language)
        print("The response of VariablesApi->search_variables:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->search_variables: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Name regex pattern | [optional] 
 **entity** | **str**| Entity filter | [optional] 
 **entity_of_interest** | **str**| Entity of interest filter | [optional] 
 **characteristic** | **str**| Characteristic filter | [optional] 
 **method** | **str**| Method filter | [optional] 
 **unit** | **str**| Unit filter | [optional] 
 **group_of_variables** | **str**| Included in group filter | [optional] 
 **not_included_in_group_of_variables** | **str**| Not included in group filter | [optional] 
 **data_type** | **str**| Data type filter | [optional] 
 **time_interval** | **str**| Time interval filter | [optional] 
 **species** | [**List[str]**](str.md)| Species filter | [optional] 
 **with_associated_data** | **bool**| Set this param to true to get associated data | [optional] [default to False]
 **experiments** | [**List[str]**](str.md)| Experiment filter | [optional] 
 **scientific_objects** | [**List[str]**](str.md)| Scientific object filter | [optional] 
 **devices** | [**List[str]**](str.md)| Device filter | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **shared_resource_instance** | **str**| Shared resource instance | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[VariableGetDTO]**](VariableGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return variables |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_variables_details**
> List[VariableDetailsDTO] search_variables_details(authorization, name=name, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search detailed variables by name, long name, entity, characteristic, method or unit name

The following fields could be used for sorting : 

 _entity_name : the name of the variable entity

 _characteristic_name : the name of the variable characteristic

 _method_name : the name of the variable method

 _unit_name : the name of the variable unit



### Example


```python
import openapi_client
from openapi_client.models.variable_details_dto import VariableDetailsDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = 'plant_height' # str | Name regex pattern (optional)
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search detailed variables by name, long name, entity, characteristic, method or unit name
        api_response = api_instance.search_variables_details(authorization, name=name, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of VariablesApi->search_variables_details:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->search_variables_details: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Name regex pattern | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[VariableDetailsDTO]**](VariableDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return detailed variables |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_variables_groups**
> List[VariablesGroupGetDTO] search_variables_groups(authorization, name=name, variable_uri=variable_uri, order_by=order_by, page=page, page_size=page_size, shared_resource_instance=shared_resource_instance, accept_language=accept_language)

Search variables groups

### Example


```python
import openapi_client
from openapi_client.models.variables_group_get_dto import VariablesGroupGetDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = 'name_example' # str | Regex pattern for filtering by name (optional)
    variable_uri = 'variable_uri_example' # str | Variable URI (optional)
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    shared_resource_instance = 'shared_resource_instance_example' # str | Shared resource instance (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search variables groups
        api_response = api_instance.search_variables_groups(authorization, name=name, variable_uri=variable_uri, order_by=order_by, page=page, page_size=page_size, shared_resource_instance=shared_resource_instance, accept_language=accept_language)
        print("The response of VariablesApi->search_variables_groups:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->search_variables_groups: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Regex pattern for filtering by name | [optional] 
 **variable_uri** | **str**| Variable URI | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **shared_resource_instance** | **str**| Shared resource instance | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[VariablesGroupGetDTO]**](VariablesGroupGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return variables groups |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_characteristic**
> str update_characteristic(authorization, accept_language=accept_language, body=body)

Update a characteristic

### Example


```python
import openapi_client
from openapi_client.models.characteristic_update_dto import CharacteristicUpdateDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.CharacteristicUpdateDTO() # CharacteristicUpdateDTO | Characteristic description (optional)

    try:
        # Update a characteristic
        api_response = api_instance.update_characteristic(authorization, accept_language=accept_language, body=body)
        print("The response of VariablesApi->update_characteristic:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->update_characteristic: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**CharacteristicUpdateDTO**](CharacteristicUpdateDTO.md)| Characteristic description | [optional] 

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
**200** | Characteristic updated |  -  |
**404** | Unknown characteristic URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_entity**
> str update_entity(authorization, accept_language=accept_language, body=body)

Update an entity

### Example


```python
import openapi_client
from openapi_client.models.entity_update_dto import EntityUpdateDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.EntityUpdateDTO() # EntityUpdateDTO | Entity description (optional)

    try:
        # Update an entity
        api_response = api_instance.update_entity(authorization, accept_language=accept_language, body=body)
        print("The response of VariablesApi->update_entity:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->update_entity: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**EntityUpdateDTO**](EntityUpdateDTO.md)| Entity description | [optional] 

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
**200** | Entity updated |  -  |
**404** | Unknown entity URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_interest_entity**
> str update_interest_entity(authorization, accept_language=accept_language, body=body)

Update an entity of interest

### Example


```python
import openapi_client
from openapi_client.models.interest_entity_update_dto import InterestEntityUpdateDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.InterestEntityUpdateDTO() # InterestEntityUpdateDTO | Entity of interest description (optional)

    try:
        # Update an entity of interest
        api_response = api_instance.update_interest_entity(authorization, accept_language=accept_language, body=body)
        print("The response of VariablesApi->update_interest_entity:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->update_interest_entity: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**InterestEntityUpdateDTO**](InterestEntityUpdateDTO.md)| Entity of interest description | [optional] 

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
**200** | Entity of interest updated |  -  |
**404** | Unknown entity of interest URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_method**
> str update_method(authorization, accept_language=accept_language, body=body)

Update a method

### Example


```python
import openapi_client
from openapi_client.models.method_update_dto import MethodUpdateDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.MethodUpdateDTO() # MethodUpdateDTO | Method description (optional)

    try:
        # Update a method
        api_response = api_instance.update_method(authorization, accept_language=accept_language, body=body)
        print("The response of VariablesApi->update_method:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->update_method: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**MethodUpdateDTO**](MethodUpdateDTO.md)| Method description | [optional] 

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
**200** | Method updated |  -  |
**404** | Unknown method URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_unit**
> str update_unit(authorization, accept_language=accept_language, body=body)

Update an unit

### Example


```python
import openapi_client
from openapi_client.models.unit_update_dto import UnitUpdateDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.UnitUpdateDTO() # UnitUpdateDTO | Unit description (optional)

    try:
        # Update an unit
        api_response = api_instance.update_unit(authorization, accept_language=accept_language, body=body)
        print("The response of VariablesApi->update_unit:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->update_unit: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**UnitUpdateDTO**](UnitUpdateDTO.md)| Unit description | [optional] 

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
**200** | Unit updated |  -  |
**404** | Unknown unit URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_variable**
> str update_variable(authorization, accept_language=accept_language, body=body)

Update a variable

### Example


```python
import openapi_client
from openapi_client.models.variable_update_dto import VariableUpdateDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.VariableUpdateDTO() # VariableUpdateDTO | Variable description (optional)

    try:
        # Update a variable
        api_response = api_instance.update_variable(authorization, accept_language=accept_language, body=body)
        print("The response of VariablesApi->update_variable:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->update_variable: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**VariableUpdateDTO**](VariableUpdateDTO.md)| Variable description | [optional] 

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
**200** | Variable updated |  -  |
**404** | Unknown variable URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_variables_group**
> str update_variables_group(authorization, accept_language=accept_language, body=body)

Update a variables group

### Example


```python
import openapi_client
from openapi_client.models.variables_group_update_dto import VariablesGroupUpdateDTO
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
    api_instance = openapi_client.VariablesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.VariablesGroupUpdateDTO() # VariablesGroupUpdateDTO | Variables group description (optional)

    try:
        # Update a variables group
        api_response = api_instance.update_variables_group(authorization, accept_language=accept_language, body=body)
        print("The response of VariablesApi->update_variables_group:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling VariablesApi->update_variables_group: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**VariablesGroupUpdateDTO**](VariablesGroupUpdateDTO.md)| Variables group description | [optional] 

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
**200** | Variables group updated |  -  |
**404** | Unknown variables group URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

