# openapi_client.DevicesApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**count_device_data**](DevicesApi.md#count_device_data) | **GET** /core/devices/{uri}/data/count | Count device data
[**create_device**](DevicesApi.md#create_device) | **POST** /core/devices | Create a device
[**delete_device**](DevicesApi.md#delete_device) | **DELETE** /core/devices/{uri} | Delete a device
[**export_devices**](DevicesApi.md#export_devices) | **GET** /core/devices/export | export devices
[**export_geospatial1**](DevicesApi.md#export_geospatial1) | **POST** /core/devices/export_geospatial | Export a given list of devices URIs to shapefile
[**export_list**](DevicesApi.md#export_list) | **POST** /core/devices/export_by_uris | export devices
[**get_device**](DevicesApi.md#get_device) | **GET** /core/devices/{uri} | Get device detail
[**get_device_by_uris**](DevicesApi.md#get_device_by_uris) | **GET** /core/devices/by_uris | Get devices by uris
[**get_device_data_files_provenances**](DevicesApi.md#get_device_data_files_provenances) | **GET** /core/devices/{uri}/datafiles/provenances | Get provenances of datafiles linked to this device
[**get_device_data_provenances**](DevicesApi.md#get_device_data_provenances) | **GET** /core/devices/{uri}/data/provenances | Get provenances of data that have been measured on this device
[**get_device_variables**](DevicesApi.md#get_device_variables) | **GET** /core/devices/{uri}/variables | Get variables linked to the device
[**get_devices_by_facility**](DevicesApi.md#get_devices_by_facility) | **GET** /core/devices/{uri}/facility | Get devices by facility
[**import_csv**](DevicesApi.md#import_csv) | **POST** /core/devices/import | Import a CSV file with one device per line
[**search_device_data**](DevicesApi.md#search_device_data) | **GET** /core/devices/{uri}/data | Search device data
[**search_device_datafiles**](DevicesApi.md#search_device_datafiles) | **GET** /core/devices/{uri}/datafiles | Search device datafiles descriptions
[**search_devices**](DevicesApi.md#search_devices) | **GET** /core/devices | Search devices
[**update_device**](DevicesApi.md#update_device) | **PUT** /core/devices | Update a device
[**validate_csv1**](DevicesApi.md#validate_csv1) | **POST** /core/devices/import_validation | Validate the import of a CSV file with one device per line


# **count_device_data**
> int count_device_data(uri, authorization, start_date=start_date, end_date=end_date, timezone=timezone, experiment=experiment, variable=variable, min_confidence=min_confidence, max_confidence=max_confidence, provenance=provenance, metadata=metadata, operators=operators, accept_language=accept_language)

Count device data

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
    api_instance = openapi_client.DevicesApi(api_client)
    uri = 'http://example.com/' # str | Device URI
    authorization = 'authorization_example' # str | Authentication token
    start_date = '2020-08-21T00:00:00+01:00' # str | Search by minimal date (optional)
    end_date = '2020-09-21T00:00:00+01:00' # str | Search by maximal date (optional)
    timezone = 'Europe/Paris' # str | Precise the timezone corresponding to the given dates (optional)
    experiment = ['http://opensilex/experiment/id/ZA17'] # List[str] | Search by experiment uris (optional)
    variable = ['http://opensilex.dev/variable#variable.2020-08-21_11-21-23entity6_method6_quality6_unit6'] # List[str] | Search by variables (optional)
    min_confidence = 0.5 # float | Search by minimal confidence index (optional)
    max_confidence = 0.5 # float | Search by maximal confidence index (optional)
    provenance = ['http://opensilex.dev/provenance/1598001689415'] # List[str] | Search by provenance uri (optional)
    metadata = '{ \"LabelView\" : \"side90\", \"paramA\" : \"90\"}' # str | Search by metadata (optional)
    operators = ['dev:id/user/isa.droits'] # List[str] | Search by operators (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Count device data
        api_response = api_instance.count_device_data(uri, authorization, start_date=start_date, end_date=end_date, timezone=timezone, experiment=experiment, variable=variable, min_confidence=min_confidence, max_confidence=max_confidence, provenance=provenance, metadata=metadata, operators=operators, accept_language=accept_language)
        print("The response of DevicesApi->count_device_data:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DevicesApi->count_device_data: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Device URI | 
 **authorization** | **str**| Authentication token | 
 **start_date** | **str**| Search by minimal date | [optional] 
 **end_date** | **str**| Search by maximal date | [optional] 
 **timezone** | **str**| Precise the timezone corresponding to the given dates | [optional] 
 **experiment** | [**List[str]**](str.md)| Search by experiment uris | [optional] 
 **variable** | [**List[str]**](str.md)| Search by variables | [optional] 
 **min_confidence** | **float**| Search by minimal confidence index | [optional] 
 **max_confidence** | **float**| Search by maximal confidence index | [optional] 
 **provenance** | [**List[str]**](str.md)| Search by provenance uri | [optional] 
 **metadata** | **str**| Search by metadata | [optional] 
 **operators** | [**List[str]**](str.md)| Search by operators | [optional] 
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
**200** | Return the number of data |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_device**
> str create_device(authorization, check_only=check_only, accept_language=accept_language, body=body)

Create a device

### Example


```python
import openapi_client
from openapi_client.models.device_creation_dto import DeviceCreationDTO
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
    api_instance = openapi_client.DevicesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    check_only = False # bool | Checking only (optional) (default to False)
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.DeviceCreationDTO() # DeviceCreationDTO | Device description (optional)

    try:
        # Create a device
        api_response = api_instance.create_device(authorization, check_only=check_only, accept_language=accept_language, body=body)
        print("The response of DevicesApi->create_device:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DevicesApi->create_device: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **check_only** | **bool**| Checking only | [optional] [default to False]
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**DeviceCreationDTO**](DeviceCreationDTO.md)| Device description | [optional] 

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
**201** | A device is created |  -  |
**409** | A device with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_device**
> str delete_device(uri, authorization, accept_language=accept_language)

Delete a device

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
    api_instance = openapi_client.DevicesApi(api_client)
    uri = 'http://opensilex.dev/set/device/sensingdevice-sensor_01' # str | Device URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a device
        api_response = api_instance.delete_device(uri, authorization, accept_language=accept_language)
        print("The response of DevicesApi->delete_device:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DevicesApi->delete_device: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Device URI | 
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
**200** | Device deleted |  -  |
**400** | Device is linked to some data, datafile or provenance and could not be deleted {result.title: &#39;LINKED_DEVICE_ERROR&#39;}. |  -  |
**404** | Device URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **export_devices**
> export_devices(authorization, rdf_type=rdf_type, include_subtypes=include_subtypes, name=name, year=year, existence_date=existence_date, brand=brand, model=model, serial_number=serial_number, metadata=metadata, accept_language=accept_language)

export devices

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
    api_instance = openapi_client.DevicesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    rdf_type = 'vocabulary:SensingDevice' # str | RDF type filter (optional)
    include_subtypes = False # bool | Set this param to true when filtering on rdf_type to also retrieve sub-types (optional) (default to False)
    name = '.*' # str | Regex pattern for filtering by name (optional) (default to '.*')
    year = 2017 # int | Search by year (optional)
    existence_date = '2013-10-20' # date | Date to filter device existence (optional)
    brand = '.*' # str | Regex pattern for filtering by brand (optional)
    model = '.*' # str | Regex pattern for filtering by model (optional)
    serial_number = '.*' # str | Regex pattern for filtering by serial number (optional)
    metadata = '{ \"Group\" : \"weather station\", \"Group2\" : \"A\"}' # str | Search by metadata (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # export devices
        api_instance.export_devices(authorization, rdf_type=rdf_type, include_subtypes=include_subtypes, name=name, year=year, existence_date=existence_date, brand=brand, model=model, serial_number=serial_number, metadata=metadata, accept_language=accept_language)
    except Exception as e:
        print("Exception when calling DevicesApi->export_devices: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **rdf_type** | **str**| RDF type filter | [optional] 
 **include_subtypes** | **bool**| Set this param to true when filtering on rdf_type to also retrieve sub-types | [optional] [default to False]
 **name** | **str**| Regex pattern for filtering by name | [optional] [default to &#39;.*&#39;]
 **year** | **int**| Search by year | [optional] 
 **existence_date** | **date**| Date to filter device existence | [optional] 
 **brand** | **str**| Regex pattern for filtering by brand | [optional] 
 **model** | **str**| Regex pattern for filtering by model | [optional] 
 **serial_number** | **str**| Regex pattern for filtering by serial number | [optional] 
 **metadata** | **str**| Search by metadata | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return a csv file with device list |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **export_geospatial1**
> export_geospatial1(authorization, selected_props=selected_props, format=format, page_size=page_size, accept_language=accept_language, body=body)

Export a given list of devices URIs to shapefile

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
    api_instance = openapi_client.DevicesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    selected_props = ['test'] # List[str] | properties selected (optional)
    format = 'shp' # str | export format (shp/geojson) (optional)
    page_size = 10000 # int | Page size limited to 10,000 objects (optional)
    accept_language = 'en' # str | Request accepted language (optional)
    body = [openapi_client.GeometryDTO()] # List[GeometryDTO] | Devices (optional)

    try:
        # Export a given list of devices URIs to shapefile
        api_instance.export_geospatial1(authorization, selected_props=selected_props, format=format, page_size=page_size, accept_language=accept_language, body=body)
    except Exception as e:
        print("Exception when calling DevicesApi->export_geospatial1: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **selected_props** | [**List[str]**](str.md)| properties selected | [optional] 
 **format** | **str**| export format (shp/geojson) | [optional] 
 **page_size** | **int**| Page size limited to 10,000 objects | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**List[GeometryDTO]**](GeometryDTO.md)| Devices | [optional] 

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

# **export_list**
> export_list(authorization, accept_language=accept_language, body=body)

export devices

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
    api_instance = openapi_client.DevicesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.URIsListPostDTO() # URIsListPostDTO | List of device URI (optional)

    try:
        # export devices
        api_instance.export_list(authorization, accept_language=accept_language, body=body)
    except Exception as e:
        print("Exception when calling DevicesApi->export_list: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**URIsListPostDTO**](URIsListPostDTO.md)| List of device URI | [optional] 

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
**200** | Return a csv file with device list |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_device**
> DeviceGetDetailsDTO get_device(uri, authorization, accept_language=accept_language)

Get device detail

### Example


```python
import openapi_client
from openapi_client.models.device_get_details_dto import DeviceGetDetailsDTO
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
    api_instance = openapi_client.DevicesApi(api_client)
    uri = 'http://opensilex.dev/set/device/sensingdevice-sensor_01' # str | device URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get device detail
        api_response = api_instance.get_device(uri, authorization, accept_language=accept_language)
        print("The response of DevicesApi->get_device:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DevicesApi->get_device: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| device URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**DeviceGetDetailsDTO**](DeviceGetDetailsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return device details corresponding to the device URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_device_by_uris**
> List[DeviceGetDTO] get_device_by_uris(uris, authorization, accept_language=accept_language)

Get devices by uris

### Example


```python
import openapi_client
from openapi_client.models.device_get_dto import DeviceGetDTO
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
    api_instance = openapi_client.DevicesApi(api_client)
    uris = ['uris_example'] # List[str] | Device URIs
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get devices by uris
        api_response = api_instance.get_device_by_uris(uris, authorization, accept_language=accept_language)
        print("The response of DevicesApi->get_device_by_uris:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DevicesApi->get_device_by_uris: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Device URIs | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[DeviceGetDTO]**](DeviceGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return devices |  -  |
**400** | Invalid parameters |  -  |
**404** | Device not found (if any provided URIs is not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_device_data_files_provenances**
> List[ProvenanceGetDTO] get_device_data_files_provenances(uri, authorization, accept_language=accept_language)

Get provenances of datafiles linked to this device

### Example


```python
import openapi_client
from openapi_client.models.provenance_get_dto import ProvenanceGetDTO
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
    api_instance = openapi_client.DevicesApi(api_client)
    uri = 'http://example.com/' # str | Device URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get provenances of datafiles linked to this device
        api_response = api_instance.get_device_data_files_provenances(uri, authorization, accept_language=accept_language)
        print("The response of DevicesApi->get_device_data_files_provenances:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DevicesApi->get_device_data_files_provenances: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Device URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ProvenanceGetDTO]**](ProvenanceGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return provenances list |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_device_data_provenances**
> List[ProvenanceGetDTO] get_device_data_provenances(uri, authorization, accept_language=accept_language)

Get provenances of data that have been measured on this device

### Example


```python
import openapi_client
from openapi_client.models.provenance_get_dto import ProvenanceGetDTO
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
    api_instance = openapi_client.DevicesApi(api_client)
    uri = 'http://example.com/' # str | Device URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get provenances of data that have been measured on this device
        api_response = api_instance.get_device_data_provenances(uri, authorization, accept_language=accept_language)
        print("The response of DevicesApi->get_device_data_provenances:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DevicesApi->get_device_data_provenances: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Device URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ProvenanceGetDTO]**](ProvenanceGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return provenances list |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_device_variables**
> List[NamedResourceDTO] get_device_variables(uri, authorization, accept_language=accept_language)

Get variables linked to the device

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
    api_instance = openapi_client.DevicesApi(api_client)
    uri = 'http://opensilex.dev/set/device/sensingdevice-sensor_01' # str | Device URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get variables linked to the device
        api_response = api_instance.get_device_variables(uri, authorization, accept_language=accept_language)
        print("The response of DevicesApi->get_device_variables:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DevicesApi->get_device_variables: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Device URI | 
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
**200** | Return variables list |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_devices_by_facility**
> List[DeviceGetDTO] get_devices_by_facility(uri, authorization, accept_language=accept_language)

Get devices by facility

### Example


```python
import openapi_client
from openapi_client.models.device_get_dto import DeviceGetDTO
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
    api_instance = openapi_client.DevicesApi(api_client)
    uri = 'http://example.com/' # str | target URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get devices by facility
        api_response = api_instance.get_devices_by_facility(uri, authorization, accept_language=accept_language)
        print("The response of DevicesApi->get_devices_by_facility:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DevicesApi->get_devices_by_facility: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| target URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[DeviceGetDTO]**](DeviceGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return devices by facility |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **import_csv**
> CSVValidationDTO import_csv(authorization, description, file, accept_language=accept_language)

Import a CSV file with one device per line

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
    api_instance = openapi_client.DevicesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    description = openapi_client.Ref() # Ref | CSV import settings
    file = None # bytearray | Device file
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Import a CSV file with one device per line
        api_response = api_instance.import_csv(authorization, description, file, accept_language=accept_language)
        print("The response of DevicesApi->import_csv:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DevicesApi->import_csv: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **description** | [**Ref**](Ref.md)| CSV import settings | 
 **file** | **bytearray**| Device file | 
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
**201** | Device(s) imported with success |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_device_data**
> List[DataGetDTO] search_device_data(uri, authorization, start_date=start_date, end_date=end_date, timezone=timezone, experiment=experiment, variable=variable, min_confidence=min_confidence, max_confidence=max_confidence, provenance=provenance, metadata=metadata, operators=operators, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search device data

### Example


```python
import openapi_client
from openapi_client.models.data_get_dto import DataGetDTO
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
    api_instance = openapi_client.DevicesApi(api_client)
    uri = 'http://example.com/' # str | Device URI
    authorization = 'authorization_example' # str | Authentication token
    start_date = '2020-08-21T00:00:00+01:00' # str | Search by minimal date (optional)
    end_date = '2020-09-21T00:00:00+01:00' # str | Search by maximal date (optional)
    timezone = 'Europe/Paris' # str | Precise the timezone corresponding to the given dates (optional)
    experiment = ['http://opensilex/experiment/id/ZA17'] # List[str] | Search by experiment uris (optional)
    variable = ['http://opensilex.dev/variable#variable.2020-08-21_11-21-23entity6_method6_quality6_unit6'] # List[str] | Search by variables (optional)
    min_confidence = 0.5 # float | Search by minimal confidence index (optional)
    max_confidence = 0.5 # float | Search by maximal confidence index (optional)
    provenance = ['http://opensilex.dev/provenance/1598001689415'] # List[str] | Search by provenance uri (optional)
    metadata = '{ \"LabelView\" : \"side90\", \"paramA\" : \"90\"}' # str | Search by metadata (optional)
    operators = ['dev:id/user/isa.droits'] # List[str] | Search by operators (optional)
    order_by = ['date=desc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search device data
        api_response = api_instance.search_device_data(uri, authorization, start_date=start_date, end_date=end_date, timezone=timezone, experiment=experiment, variable=variable, min_confidence=min_confidence, max_confidence=max_confidence, provenance=provenance, metadata=metadata, operators=operators, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of DevicesApi->search_device_data:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DevicesApi->search_device_data: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Device URI | 
 **authorization** | **str**| Authentication token | 
 **start_date** | **str**| Search by minimal date | [optional] 
 **end_date** | **str**| Search by maximal date | [optional] 
 **timezone** | **str**| Precise the timezone corresponding to the given dates | [optional] 
 **experiment** | [**List[str]**](str.md)| Search by experiment uris | [optional] 
 **variable** | [**List[str]**](str.md)| Search by variables | [optional] 
 **min_confidence** | **float**| Search by minimal confidence index | [optional] 
 **max_confidence** | **float**| Search by maximal confidence index | [optional] 
 **provenance** | [**List[str]**](str.md)| Search by provenance uri | [optional] 
 **metadata** | **str**| Search by metadata | [optional] 
 **operators** | [**List[str]**](str.md)| Search by operators | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[DataGetDTO]**](DataGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return data list |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_device_datafiles**
> List[DataGetDTO] search_device_datafiles(uri, authorization, rdf_type=rdf_type, start_date=start_date, end_date=end_date, timezone=timezone, experiment=experiment, scientific_objects=scientific_objects, provenances=provenances, metadata=metadata, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search device datafiles descriptions

### Example


```python
import openapi_client
from openapi_client.models.data_get_dto import DataGetDTO
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
    api_instance = openapi_client.DevicesApi(api_client)
    uri = 'http://example.com/' # str | Device URI
    authorization = 'authorization_example' # str | Authentication token
    rdf_type = 'rdf_type_example' # str | Search by rdf type uri (optional)
    start_date = '2020-08-21T00:00:00+01:00' # str | Search by minimal date (optional)
    end_date = '2020-09-21T00:00:00+01:00' # str | Search by maximal date (optional)
    timezone = 'Europe/Paris' # str | Precise the timezone corresponding to the given dates (optional)
    experiment = ['http://opensilex/experiment/id/ZA17'] # List[str] | Search by experiments (optional)
    scientific_objects = ['http://opensilex.dev/opensilex/2020/o20000345'] # List[str] | Search by object uris list (optional)
    provenances = ['http://opensilex.dev/provenance/1598001689415'] # List[str] | Search by provenance uris list (optional)
    metadata = '{ \"LabelView\" : \"side90\", \"paramA\" : \"90\"}' # str | Search by metadata (optional)
    order_by = ['date=desc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search device datafiles descriptions
        api_response = api_instance.search_device_datafiles(uri, authorization, rdf_type=rdf_type, start_date=start_date, end_date=end_date, timezone=timezone, experiment=experiment, scientific_objects=scientific_objects, provenances=provenances, metadata=metadata, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of DevicesApi->search_device_datafiles:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DevicesApi->search_device_datafiles: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Device URI | 
 **authorization** | **str**| Authentication token | 
 **rdf_type** | **str**| Search by rdf type uri | [optional] 
 **start_date** | **str**| Search by minimal date | [optional] 
 **end_date** | **str**| Search by maximal date | [optional] 
 **timezone** | **str**| Precise the timezone corresponding to the given dates | [optional] 
 **experiment** | [**List[str]**](str.md)| Search by experiments | [optional] 
 **scientific_objects** | [**List[str]**](str.md)| Search by object uris list | [optional] 
 **provenances** | [**List[str]**](str.md)| Search by provenance uris list | [optional] 
 **metadata** | **str**| Search by metadata | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[DataGetDTO]**](DataGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return datafiles list |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_devices**
> List[DeviceGetDTO] search_devices(authorization, rdf_type=rdf_type, include_subtypes=include_subtypes, name=name, variable=variable, year=year, existence_date=existence_date, facility=facility, brand=brand, model=model, serial_number=serial_number, metadata=metadata, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search devices

### Example


```python
import openapi_client
from openapi_client.models.device_get_dto import DeviceGetDTO
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
    api_instance = openapi_client.DevicesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    rdf_type = 'vocabulary:SensingDevice' # str | RDF type filter (optional)
    include_subtypes = False # bool | Set this param to true when filtering on rdf_type to also retrieve sub-types (optional) (default to False)
    name = '.*' # str | Regex pattern for filtering by name (optional) (default to '.*')
    variable = 'test:set/variables#air_temperature_thermocouple_degree-celsius' # str | Variable (optional)
    year = 2017 # int | Search by year (optional)
    existence_date = '2013-10-20' # date | Date to filter device existence (optional)
    facility = 'http://example.com' # str | Search by facility (optional)
    brand = '.*' # str | Regex pattern for filtering by brand (optional)
    model = '.*' # str | Regex pattern for filtering by model (optional)
    serial_number = '.*' # str | Regex pattern for filtering by serial number (optional)
    metadata = '{ \"Group\" : \"weather station\", \"Group2\" : \"A\"}' # str | Search by metadata (optional)
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search devices
        api_response = api_instance.search_devices(authorization, rdf_type=rdf_type, include_subtypes=include_subtypes, name=name, variable=variable, year=year, existence_date=existence_date, facility=facility, brand=brand, model=model, serial_number=serial_number, metadata=metadata, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of DevicesApi->search_devices:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DevicesApi->search_devices: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **rdf_type** | **str**| RDF type filter | [optional] 
 **include_subtypes** | **bool**| Set this param to true when filtering on rdf_type to also retrieve sub-types | [optional] [default to False]
 **name** | **str**| Regex pattern for filtering by name | [optional] [default to &#39;.*&#39;]
 **variable** | **str**| Variable | [optional] 
 **year** | **int**| Search by year | [optional] 
 **existence_date** | **date**| Date to filter device existence | [optional] 
 **facility** | **str**| Search by facility | [optional] 
 **brand** | **str**| Regex pattern for filtering by brand | [optional] 
 **model** | **str**| Regex pattern for filtering by model | [optional] 
 **serial_number** | **str**| Regex pattern for filtering by serial number | [optional] 
 **metadata** | **str**| Search by metadata | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[DeviceGetDTO]**](DeviceGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return devices corresponding to the given search parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_device**
> str update_device(authorization, body, accept_language=accept_language)

Update a device

### Example


```python
import openapi_client
from openapi_client.models.device_creation_dto import DeviceCreationDTO
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
    api_instance = openapi_client.DevicesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    body = openapi_client.DeviceCreationDTO() # DeviceCreationDTO | Device description
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Update a device
        api_response = api_instance.update_device(authorization, body, accept_language=accept_language)
        print("The response of DevicesApi->update_device:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DevicesApi->update_device: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **body** | [**DeviceCreationDTO**](DeviceCreationDTO.md)| Device description | 
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
**200** | Device updated |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **validate_csv1**
> CSVValidationDTO validate_csv1(authorization, description, file, accept_language=accept_language)

Validate the import of a CSV file with one device per line

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
    api_instance = openapi_client.DevicesApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    description = openapi_client.Ref() # Ref | CSV import settings
    file = None # bytearray | Device file
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Validate the import of a CSV file with one device per line
        api_response = api_instance.validate_csv1(authorization, description, file, accept_language=accept_language)
        print("The response of DevicesApi->validate_csv1:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling DevicesApi->validate_csv1: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **description** | [**Ref**](Ref.md)| CSV import settings | 
 **file** | **bytearray**| Device file | 
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
**201** | Device(s) checked |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

