# openapi_client.AreaApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_area**](AreaApi.md#create_area) | **POST** /core/area | Add an area
[**delete_area**](AreaApi.md#delete_area) | **DELETE** /core/area/{uri} | Delete an area
[**export_geospatial**](AreaApi.md#export_geospatial) | **POST** /core/area/export_geospatial | Export a given list of areas URIs to shapefile
[**get_by_uri**](AreaApi.md#get_by_uri) | **GET** /core/area/{uri} | Get an area
[**search_intersects**](AreaApi.md#search_intersects) | **POST** /core/area/intersects | Get area whose geometry corresponds to the Intersections
[**update_area**](AreaApi.md#update_area) | **PUT** /core/area | Update an area


# **create_area**
> str create_area(authorization, accept_language=accept_language, body=body)

Add an area

### Example


```python
import openapi_client
from openapi_client.models.area_creation_dto import AreaCreationDTO
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
    api_instance = openapi_client.AreaApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.AreaCreationDTO() # AreaCreationDTO | Area description (optional)

    try:
        # Add an area
        api_response = api_instance.create_area(authorization, accept_language=accept_language, body=body)
        print("The response of AreaApi->create_area:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AreaApi->create_area: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**AreaCreationDTO**](AreaCreationDTO.md)| Area description | [optional] 

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
**201** | Add an area |  -  |
**400** | Bad user request |  -  |
**409** | An area with the same URI already exists |  -  |
**500** | Internal Server Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_area**
> str delete_area(uri, authorization, accept_language=accept_language)

Delete an area

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
    api_instance = openapi_client.AreaApi(api_client)
    uri = 'uri_example' # str | Area URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete an area
        api_response = api_instance.delete_area(uri, authorization, accept_language=accept_language)
        print("The response of AreaApi->delete_area:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AreaApi->delete_area: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Area URI | 
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
**200** | Delete an area |  -  |
**404** | The URI for the area was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **export_geospatial**
> export_geospatial(authorization, selected_props=selected_props, format=format, page_size=page_size, accept_language=accept_language, body=body)

Export a given list of areas URIs to shapefile

### Example


```python
import openapi_client
from openapi_client.models.geometry_dto import GeometryDTO
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
    api_instance = openapi_client.AreaApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    selected_props = ['test'] # List[str] | properties selected (optional)
    format = 'shp' # str | export format (shp/geojson) (optional)
    page_size = 10000 # int | Page size limited to 10,000 objects (optional)
    accept_language = 'en' # str | Request accepted language (optional)
    body = [openapi_client.GeometryDTO()] # List[GeometryDTO] | Areas (optional)

    try:
        # Export a given list of areas URIs to shapefile
        api_instance.export_geospatial(authorization, selected_props=selected_props, format=format, page_size=page_size, accept_language=accept_language, body=body)
    except Exception as e:
        print("Exception when calling AreaApi->export_geospatial: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **selected_props** | [**List[str]**](str.md)| properties selected | [optional] 
 **format** | **str**| export format (shp/geojson) | [optional] 
 **page_size** | **int**| Page size limited to 10,000 objects | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**List[GeometryDTO]**](GeometryDTO.md)| Areas | [optional] 

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
**200** | Data shapefile exported |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_by_uri**
> AreaGetDTO get_by_uri(uri, authorization, accept_language=accept_language)

Get an area

### Example


```python
import openapi_client
from openapi_client.models.area_get_dto import AreaGetDTO
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
    api_instance = openapi_client.AreaApi(api_client)
    uri = 'uri_example' # str | area URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get an area
        api_response = api_instance.get_by_uri(uri, authorization, accept_language=accept_language)
        print("The response of AreaApi->get_by_uri:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AreaApi->get_by_uri: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| area URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**AreaGetDTO**](AreaGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return area |  -  |
**400** | Invalid parameters |  -  |
**404** | Area not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_intersects**
> List[AreaGetDTO] search_intersects(authorization, body, start=start, end=end, accept_language=accept_language)

Get area whose geometry corresponds to the Intersections

### Example


```python
import openapi_client
from openapi_client.models.area_get_dto import AreaGetDTO
from openapi_client.models.geo_json_object import GeoJsonObject
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
    api_instance = openapi_client.AreaApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    body = openapi_client.GeoJsonObject() # GeoJsonObject | geometry GeoJSON
    start = '2019-09-08T12:00:00+01:00' # str | Start date : match temporal area after the given start date (optional)
    end = '2021-09-08T12:00:00+01:00' # str | End date : match temporal area before the given end date (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get area whose geometry corresponds to the Intersections
        api_response = api_instance.search_intersects(authorization, body, start=start, end=end, accept_language=accept_language)
        print("The response of AreaApi->search_intersects:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AreaApi->search_intersects: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **body** | [**GeoJsonObject**](GeoJsonObject.md)| geometry GeoJSON | 
 **start** | **str**| Start date : match temporal area after the given start date | [optional] 
 **end** | **str**| End date : match temporal area before the given end date | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[AreaGetDTO]**](AreaGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Get area whose geometry corresponds to the Intersections |  -  |
**400** | Invalid parameters |  -  |
**404** | Area not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_area**
> str update_area(authorization, body, accept_language=accept_language)

Update an area

### Example


```python
import openapi_client
from openapi_client.models.area_update_dto import AreaUpdateDTO
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
    api_instance = openapi_client.AreaApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    body = openapi_client.AreaUpdateDTO() # AreaUpdateDTO | Area description
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Update an area
        api_response = api_instance.update_area(authorization, body, accept_language=accept_language)
        print("The response of AreaApi->update_area:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AreaApi->update_area: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **body** | [**AreaUpdateDTO**](AreaUpdateDTO.md)| Area description | 
 **accept_language** | **str**| Request accepted language | [optional] 

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
**200** | Update an area |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

