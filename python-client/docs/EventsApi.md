# openapi_client.EventsApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**count_events**](EventsApi.md#count_events) | **GET** /core/events/count | Count events
[**create_events**](EventsApi.md#create_events) | **POST** /core/events | Create a list of event
[**create_moves**](EventsApi.md#create_moves) | **POST** /core/events/moves | Create a list of move event
[**delete_event**](EventsApi.md#delete_event) | **DELETE** /core/events/{uri} | Delete an event
[**delete_move_event**](EventsApi.md#delete_move_event) | **DELETE** /core/events/moves/{uri} | Delete a move event
[**get_event**](EventsApi.md#get_event) | **GET** /core/events/{uri} | Get an event
[**get_event_details**](EventsApi.md#get_event_details) | **GET** /core/events/{uri}/details | Get an event with all it&#39;s properties
[**get_move_event**](EventsApi.md#get_move_event) | **GET** /core/events/moves/{uri} | Get a move with all it&#39;s properties
[**get_move_event_by_uris**](EventsApi.md#get_move_event_by_uris) | **GET** /core/events/moves/by_uris | Get a list of moves with all positional information
[**import_event_csv**](EventsApi.md#import_event_csv) | **POST** /core/events/import | Import a CSV file with one move and one target per line
[**import_move_csv**](EventsApi.md#import_move_csv) | **POST** /core/events/moves/import | Import a CSV file with one move and one target per line
[**search_events**](EventsApi.md#search_events) | **GET** /core/events | Search events
[**update_event**](EventsApi.md#update_event) | **PUT** /core/events | Update an event
[**update_move_event**](EventsApi.md#update_move_event) | **PUT** /core/events/moves | Update a move event
[**validate_event_csv**](EventsApi.md#validate_event_csv) | **POST** /core/events/import_validation | Check a CSV file with one move and one target per line
[**validate_move_csv**](EventsApi.md#validate_move_csv) | **POST** /core/events/moves/import_validation | Check a CSV file with one move and one target per line


# **count_events**
> int count_events(targets, authorization, accept_language=accept_language)

Count events

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
    api_instance = openapi_client.EventsApi(api_client)
    targets = ['targets_example'] # List[str] | Targets URIs
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Count events
        api_response = api_instance.count_events(targets, authorization, accept_language=accept_language)
        print("The response of EventsApi->count_events:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->count_events: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **targets** | [**List[str]**](str.md)| Targets URIs | 
 **authorization** | **str**| Authentication token | 
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
**200** | Return the number of events associated to targets |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_events**
> str create_events(authorization, accept_language=accept_language, body=body)

Create a list of event

### Example


```python
import openapi_client
from openapi_client.models.event_creation_dto import EventCreationDTO
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
    api_instance = openapi_client.EventsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = [openapi_client.EventCreationDTO()] # List[EventCreationDTO] |  (optional)

    try:
        # Create a list of event
        api_response = api_instance.create_events(authorization, accept_language=accept_language, body=body)
        print("The response of EventsApi->create_events:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->create_events: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**List[EventCreationDTO]**](EventCreationDTO.md)|  | [optional] 

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
**201** | Create a list of event |  -  |
**409** | An event with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_moves**
> str create_moves(authorization, accept_language=accept_language, body=body)

Create a list of move event

### Example


```python
import openapi_client
from openapi_client.models.move_creation_dto import MoveCreationDTO
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
    api_instance = openapi_client.EventsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = [openapi_client.MoveCreationDTO()] # List[MoveCreationDTO] |  (optional)

    try:
        # Create a list of move event
        api_response = api_instance.create_moves(authorization, accept_language=accept_language, body=body)
        print("The response of EventsApi->create_moves:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->create_moves: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**List[MoveCreationDTO]**](MoveCreationDTO.md)|  | [optional] 

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
**201** | Create a list of move |  -  |
**409** | A move with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_event**
> str delete_event(uri, authorization, accept_language=accept_language)

Delete an event

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
    api_instance = openapi_client.EventsApi(api_client)
    uri = 'http://opensilex.dev/events/deplacement/1865162374' # str | Event URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete an event
        api_response = api_instance.delete_event(uri, authorization, accept_language=accept_language)
        print("The response of EventsApi->delete_event:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->delete_event: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Event URI | 
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
**200** | Event deleted |  -  |
**404** | Event URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_move_event**
> str delete_move_event(uri, authorization, accept_language=accept_language)

Delete a move event

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
    api_instance = openapi_client.EventsApi(api_client)
    uri = 'http://opensilex.dev/events/deplacement/1865162374' # str | Event URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a move event
        api_response = api_instance.delete_move_event(uri, authorization, accept_language=accept_language)
        print("The response of EventsApi->delete_move_event:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->delete_move_event: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Event URI | 
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
**200** | Move deleted |  -  |
**404** | Move URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_event**
> EventGetDTO get_event(uri, authorization, accept_language=accept_language)

Get an event

### Example


```python
import openapi_client
from openapi_client.models.event_get_dto import EventGetDTO
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
    api_instance = openapi_client.EventsApi(api_client)
    uri = 'http://opensilex.dev/events/1865162374' # str | Event URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get an event
        api_response = api_instance.get_event(uri, authorization, accept_language=accept_language)
        print("The response of EventsApi->get_event:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->get_event: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Event URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**EventGetDTO**](EventGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Event retrieved |  -  |
**404** | Event URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_event_details**
> EventDetailsDTO get_event_details(uri, authorization, accept_language=accept_language)

Get an event with all it's properties

### Example


```python
import openapi_client
from openapi_client.models.event_details_dto import EventDetailsDTO
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
    api_instance = openapi_client.EventsApi(api_client)
    uri = 'http://opensilex.dev/events/1865162374' # str | Event URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get an event with all it's properties
        api_response = api_instance.get_event_details(uri, authorization, accept_language=accept_language)
        print("The response of EventsApi->get_event_details:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->get_event_details: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Event URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**EventDetailsDTO**](EventDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Event retrieved |  -  |
**404** | Event URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_move_event**
> MoveDetailsDTO get_move_event(uri, authorization, accept_language=accept_language)

Get a move with all it's properties

### Example


```python
import openapi_client
from openapi_client.models.move_details_dto import MoveDetailsDTO
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
    api_instance = openapi_client.EventsApi(api_client)
    uri = 'http://opensilex.dev/events/1865162374' # str | Move URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a move with all it's properties
        api_response = api_instance.get_move_event(uri, authorization, accept_language=accept_language)
        print("The response of EventsApi->get_move_event:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->get_move_event: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Move URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**MoveDetailsDTO**](MoveDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Move retrieved |  -  |
**404** | Move URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_move_event_by_uris**
> List[MoveDetailsDTO] get_move_event_by_uris(uris, authorization, accept_language=accept_language)

Get a list of moves with all positional information

### Example


```python
import openapi_client
from openapi_client.models.move_details_dto import MoveDetailsDTO
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
    api_instance = openapi_client.EventsApi(api_client)
    uris = ['uris_example'] # List[str] | Move URIs
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get a list of moves with all positional information
        api_response = api_instance.get_move_event_by_uris(uris, authorization, accept_language=accept_language)
        print("The response of EventsApi->get_move_event_by_uris:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->get_move_event_by_uris: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Move URIs | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[MoveDetailsDTO]**](MoveDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Moves retrieved |  -  |
**404** | Move URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **import_event_csv**
> CSVValidationDTO import_event_csv(authorization, description, file, accept_language=accept_language)

Import a CSV file with one move and one target per line

### Example


```python
import openapi_client
from openapi_client.models.csv_validation_dto import CSVValidationDTO
from openapi_client.models.ref import Ref
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
    api_instance = openapi_client.EventsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    description = openapi_client.Ref() # Ref | CSV import settings
    file = None # bytearray | Event file
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Import a CSV file with one move and one target per line
        api_response = api_instance.import_event_csv(authorization, description, file, accept_language=accept_language)
        print("The response of EventsApi->import_event_csv:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->import_event_csv: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **description** | [**Ref**](Ref.md)| CSV import settings | 
 **file** | **bytearray**| Event file | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**CSVValidationDTO**](CSVValidationDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**201** | Move file saved |  -  |
**409** | A move with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **import_move_csv**
> CSVValidationDTO import_move_csv(authorization, file, accept_language=accept_language)

Import a CSV file with one move and one target per line

### Example


```python
import openapi_client
from openapi_client.models.csv_validation_dto import CSVValidationDTO
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
    api_instance = openapi_client.EventsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    file = None # bytearray | Move file
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Import a CSV file with one move and one target per line
        api_response = api_instance.import_move_csv(authorization, file, accept_language=accept_language)
        print("The response of EventsApi->import_move_csv:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->import_move_csv: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **file** | **bytearray**| Move file | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**CSVValidationDTO**](CSVValidationDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**201** | Move file saved |  -  |
**409** | A move with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_events**
> List[EventGetDTO] search_events(authorization, rdf_type=rdf_type, start=start, end=end, target=target, description=description, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search events

### Example


```python
import openapi_client
from openapi_client.models.event_get_dto import EventGetDTO
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
    api_instance = openapi_client.EventsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    rdf_type = 'http://www.opensilex.org/vocabulary/oeev#MoveFrom' # str | Event type (optional)
    start = '2019-09-08T12:00:00+01:00' # str | Start date : match event after the given start date (optional)
    end = '2021-09-08T12:00:00+01:00' # str | End date : match event before the given end date (optional)
    target = 'http://www.opensilex.org/demo/2018/o18000076(exact match) or o18000076(partial match)' # str | Target partial/exact URI (optional)
    description = 'The pest attack' # str | Description regex pattern (optional)
    order_by = ['end=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 56 # int | Page number (optional)
    page_size = 56 # int | Page size (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search events
        api_response = api_instance.search_events(authorization, rdf_type=rdf_type, start=start, end=end, target=target, description=description, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of EventsApi->search_events:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->search_events: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **rdf_type** | **str**| Event type | [optional] 
 **start** | **str**| Start date : match event after the given start date | [optional] 
 **end** | **str**| End date : match event before the given end date | [optional] 
 **target** | **str**| Target partial/exact URI | [optional] 
 **description** | **str**| Description regex pattern | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] 
 **page_size** | **int**| Page size | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[EventGetDTO]**](EventGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return event list |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_event**
> str update_event(authorization, accept_language=accept_language, body=body)

Update an event

### Example


```python
import openapi_client
from openapi_client.models.event_update_dto import EventUpdateDTO
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
    api_instance = openapi_client.EventsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.EventUpdateDTO() # EventUpdateDTO | Event description (optional)

    try:
        # Update an event
        api_response = api_instance.update_event(authorization, accept_language=accept_language, body=body)
        print("The response of EventsApi->update_event:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->update_event: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**EventUpdateDTO**](EventUpdateDTO.md)| Event description | [optional] 

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
**200** | Return updated event |  -  |
**404** | Event URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_move_event**
> str update_move_event(authorization, accept_language=accept_language, body=body)

Update a move event

### Example


```python
import openapi_client
from openapi_client.models.move_update_dto import MoveUpdateDTO
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
    api_instance = openapi_client.EventsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.MoveUpdateDTO() # MoveUpdateDTO | Event description (optional)

    try:
        # Update a move event
        api_response = api_instance.update_move_event(authorization, accept_language=accept_language, body=body)
        print("The response of EventsApi->update_move_event:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->update_move_event: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**MoveUpdateDTO**](MoveUpdateDTO.md)| Event description | [optional] 

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
**200** | Return updated move |  -  |
**404** | Move URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **validate_event_csv**
> CSVValidationDTO validate_event_csv(authorization, description, file, accept_language=accept_language)

Check a CSV file with one move and one target per line

### Example


```python
import openapi_client
from openapi_client.models.csv_validation_dto import CSVValidationDTO
from openapi_client.models.ref import Ref
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
    api_instance = openapi_client.EventsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    description = openapi_client.Ref() # Ref | CSV import settings
    file = None # bytearray | Event file
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Check a CSV file with one move and one target per line
        api_response = api_instance.validate_event_csv(authorization, description, file, accept_language=accept_language)
        print("The response of EventsApi->validate_event_csv:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->validate_event_csv: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **description** | [**Ref**](Ref.md)| CSV import settings | 
 **file** | **bytearray**| Event file | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**CSVValidationDTO**](CSVValidationDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Event file checked |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **validate_move_csv**
> CSVValidationDTO validate_move_csv(authorization, file, accept_language=accept_language)

Check a CSV file with one move and one target per line

### Example


```python
import openapi_client
from openapi_client.models.csv_validation_dto import CSVValidationDTO
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
    api_instance = openapi_client.EventsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    file = None # bytearray | Move file
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Check a CSV file with one move and one target per line
        api_response = api_instance.validate_move_csv(authorization, file, accept_language=accept_language)
        print("The response of EventsApi->validate_move_csv:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling EventsApi->validate_move_csv: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **file** | **bytearray**| Move file | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**CSVValidationDTO**](CSVValidationDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Event file checked |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

