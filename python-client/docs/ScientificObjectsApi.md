# openapi_client.ScientificObjectsApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**count_scientific_objects**](ScientificObjectsApi.md#count_scientific_objects) | **GET** /core/scientific_objects/count | Count scientific objects
[**create_scientific_object**](ScientificObjectsApi.md#create_scientific_object) | **POST** /core/scientific_objects | Create a scientific object for the given experiment
[**delete_scientific_object**](ScientificObjectsApi.md#delete_scientific_object) | **DELETE** /core/scientific_objects/{uri} | Delete a scientific object
[**export_csv**](ScientificObjectsApi.md#export_csv) | **POST** /core/scientific_objects/export | Export a given list of scientific object URIs to csv data file
[**export_geospatial2**](ScientificObjectsApi.md#export_geospatial2) | **POST** /core/scientific_objects/export_geospatial | Export a given list of scientific object URIs to shapefile or geojson
[**get_scientific_object_data_files_provenances**](ScientificObjectsApi.md#get_scientific_object_data_files_provenances) | **GET** /core/scientific_objects/{uri}/datafiles/provenances | Get provenances of datafiles linked to this scientific object
[**get_scientific_object_data_provenances**](ScientificObjectsApi.md#get_scientific_object_data_provenances) | **GET** /core/scientific_objects/{uri}/data/provenances | Get provenances of data that have been measured on this scientific object
[**get_scientific_object_detail**](ScientificObjectsApi.md#get_scientific_object_detail) | **GET** /core/scientific_objects/{uri} | Get scientific object detail
[**get_scientific_object_detail_by_experiments**](ScientificObjectsApi.md#get_scientific_object_detail_by_experiments) | **GET** /core/scientific_objects/{uri}/experiments | Get scientific object detail for each experiments, a null value for experiment in response means a properties defined outside of any experiment (shared object).
[**get_scientific_object_variables**](ScientificObjectsApi.md#get_scientific_object_variables) | **GET** /core/scientific_objects/{uri}/variables | Get variables measured on this scientific object
[**get_scientific_objects_children**](ScientificObjectsApi.md#get_scientific_objects_children) | **GET** /core/scientific_objects/children | Get list of scientific object children
[**get_scientific_objects_list_by_uris**](ScientificObjectsApi.md#get_scientific_objects_list_by_uris) | **POST** /core/scientific_objects/by_uris | Get scientific objet list of a given experiment URI
[**get_used_types**](ScientificObjectsApi.md#get_used_types) | **GET** /core/scientific_objects/used_types | get used scientific object types
[**import_csv1**](ScientificObjectsApi.md#import_csv1) | **POST** /core/scientific_objects/import | Import a CSV file for the given experiment URI and scientific object type.
[**search_scientific_objects**](ScientificObjectsApi.md#search_scientific_objects) | **GET** /core/scientific_objects | Search list of scientific objects
[**search_scientific_objects_with_geometry_list_by_uris**](ScientificObjectsApi.md#search_scientific_objects_with_geometry_list_by_uris) | **GET** /core/scientific_objects/geometry | Get scientific objet list with geometry of a given experiment URI
[**update_scientific_object**](ScientificObjectsApi.md#update_scientific_object) | **PUT** /core/scientific_objects | Update a scientific object for the given experiment
[**validate_csv3**](ScientificObjectsApi.md#validate_csv3) | **POST** /core/scientific_objects/import_validation | Validate a CSV file for the given experiment URI and scientific object type.


# **count_scientific_objects**
> int count_scientific_objects(authorization, experiment=experiment, accept_language=accept_language)

Count scientific objects

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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    experiment = 'http://www.opensilex.org/demo/2018/o18000076' # str | Experiment URI (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Count scientific objects
        api_response = api_instance.count_scientific_objects(authorization, experiment=experiment, accept_language=accept_language)
        print("The response of ScientificObjectsApi->count_scientific_objects:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->count_scientific_objects: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **experiment** | **str**| Experiment URI | [optional] 
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
**200** | Return the number of scientific objects associated to a given experiment |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_scientific_object**
> str create_scientific_object(authorization, body, accept_language=accept_language)

Create a scientific object for the given experiment

### Example


```python
import openapi_client
from openapi_client.models.scientific_object_creation_dto import ScientificObjectCreationDTO
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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    body = openapi_client.ScientificObjectCreationDTO() # ScientificObjectCreationDTO | Scientific object description
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Create a scientific object for the given experiment
        api_response = api_instance.create_scientific_object(authorization, body, accept_language=accept_language)
        print("The response of ScientificObjectsApi->create_scientific_object:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->create_scientific_object: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **body** | [**ScientificObjectCreationDTO**](ScientificObjectCreationDTO.md)| Scientific object description | 
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
**201** | Create a scientific object |  -  |
**409** | A scientific object with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_scientific_object**
> str delete_scientific_object(uri, authorization, experiment=experiment, accept_language=accept_language)

Delete a scientific object

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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    uri = 'http://opensilex.org/id/Plot 12' # str | scientific object URI
    authorization = 'authorization_example' # str | Authentication token
    experiment = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a scientific object
        api_response = api_instance.delete_scientific_object(uri, authorization, experiment=experiment, accept_language=accept_language)
        print("The response of ScientificObjectsApi->delete_scientific_object:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->delete_scientific_object: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| scientific object URI | 
 **authorization** | **str**| Authentication token | 
 **experiment** | **str**| Experiment URI | [optional] 
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
**200** | Scientific object deleted |  -  |
**400** | Scientific object can&#39;t be deleted (If object is involved into an experiment or if associated to any data) |  -  |
**404** | Scientific object URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **export_csv**
> export_csv(authorization, accept_language=accept_language, body=body)

Export a given list of scientific object URIs to csv data file

### Example


```python
import openapi_client
from openapi_client.models.scientific_object_export_dto import ScientificObjectExportDTO
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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.ScientificObjectExportDTO() # ScientificObjectExportDTO | CSV export configuration (optional)

    try:
        # Export a given list of scientific object URIs to csv data file
        api_instance.export_csv(authorization, accept_language=accept_language, body=body)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->export_csv: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**ScientificObjectExportDTO**](ScientificObjectExportDTO.md)| CSV export configuration | [optional] 

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
**200** | Data file exported |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **export_geospatial2**
> export_geospatial2(authorization, experiment=experiment, selected_props=selected_props, format=format, page_size=page_size, accept_language=accept_language, body=body)

Export a given list of scientific object URIs to shapefile or geojson

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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    experiment = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI (optional)
    selected_props = ['test'] # List[str] | properties selected (optional)
    format = 'shp' # str | export format (shp/geojson) (optional)
    page_size = 10000 # int | Page size limited to 10,000 objects (optional)
    accept_language = 'en' # str | Request accepted language (optional)
    body = [openapi_client.GeometryDTO()] # List[GeometryDTO] | Scientific objects (optional)

    try:
        # Export a given list of scientific object URIs to shapefile or geojson
        api_instance.export_geospatial2(authorization, experiment=experiment, selected_props=selected_props, format=format, page_size=page_size, accept_language=accept_language, body=body)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->export_geospatial2: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **experiment** | **str**| Experiment URI | [optional] 
 **selected_props** | [**List[str]**](str.md)| properties selected | [optional] 
 **format** | **str**| export format (shp/geojson) | [optional] 
 **page_size** | **int**| Page size limited to 10,000 objects | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**List[GeometryDTO]**](GeometryDTO.md)| Scientific objects | [optional] 

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
**200** | Data exported |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_scientific_object_data_files_provenances**
> List[ProvenanceGetDTO] get_scientific_object_data_files_provenances(uri, authorization, accept_language=accept_language)

Get provenances of datafiles linked to this scientific object

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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    uri = 'http://opensilex.org/id/Plot 12' # str | Scientific Object URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get provenances of datafiles linked to this scientific object
        api_response = api_instance.get_scientific_object_data_files_provenances(uri, authorization, accept_language=accept_language)
        print("The response of ScientificObjectsApi->get_scientific_object_data_files_provenances:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->get_scientific_object_data_files_provenances: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Scientific Object URI | 
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

# **get_scientific_object_data_provenances**
> List[ProvenanceGetDTO] get_scientific_object_data_provenances(uri, authorization, accept_language=accept_language)

Get provenances of data that have been measured on this scientific object

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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    uri = 'http://opensilex.org/id/Plot 12' # str | Scientific Object URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get provenances of data that have been measured on this scientific object
        api_response = api_instance.get_scientific_object_data_provenances(uri, authorization, accept_language=accept_language)
        print("The response of ScientificObjectsApi->get_scientific_object_data_provenances:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->get_scientific_object_data_provenances: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Scientific Object URI | 
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

# **get_scientific_object_detail**
> ScientificObjectDetailDTO get_scientific_object_detail(uri, authorization, experiment=experiment, accept_language=accept_language)

Get scientific object detail

### Example


```python
import openapi_client
from openapi_client.models.scientific_object_detail_dto import ScientificObjectDetailDTO
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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    uri = 'http://opensilex.org/set/scientific-objects/so-1357dz_pg_34zm4384wwveg_323_37arch2017-03-30' # str | scientific object URI
    authorization = 'authorization_example' # str | Authentication token
    experiment = 'http://opensilex.org/set/experiments/21ik1_cims-on' # str | Experiment URI (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get scientific object detail
        api_response = api_instance.get_scientific_object_detail(uri, authorization, experiment=experiment, accept_language=accept_language)
        print("The response of ScientificObjectsApi->get_scientific_object_detail:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->get_scientific_object_detail: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| scientific object URI | 
 **authorization** | **str**| Authentication token | 
 **experiment** | **str**| Experiment URI | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**ScientificObjectDetailDTO**](ScientificObjectDetailDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return scientific object details corresponding to the given object URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_scientific_object_detail_by_experiments**
> List[ScientificObjectDetailByExperimentsDTO] get_scientific_object_detail_by_experiments(uri, authorization, accept_language=accept_language)

Get scientific object detail for each experiments, a null value for experiment in response means a properties defined outside of any experiment (shared object).

### Example


```python
import openapi_client
from openapi_client.models.scientific_object_detail_by_experiments_dto import ScientificObjectDetailByExperimentsDTO
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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    uri = 'http://opensilex.org/id/Plot 12' # str | scientific object URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get scientific object detail for each experiments, a null value for experiment in response means a properties defined outside of any experiment (shared object).
        api_response = api_instance.get_scientific_object_detail_by_experiments(uri, authorization, accept_language=accept_language)
        print("The response of ScientificObjectsApi->get_scientific_object_detail_by_experiments:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->get_scientific_object_detail_by_experiments: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| scientific object URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ScientificObjectDetailByExperimentsDTO]**](ScientificObjectDetailByExperimentsDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return scientific object details corresponding to the given experiment and object URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_scientific_object_variables**
> List[NamedResourceDTO] get_scientific_object_variables(uri, authorization, accept_language=accept_language)

Get variables measured on this scientific object

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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    uri = 'http://opensilex.org/id/Plot 12' # str | Scientific Object URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get variables measured on this scientific object
        api_response = api_instance.get_scientific_object_variables(uri, authorization, accept_language=accept_language)
        print("The response of ScientificObjectsApi->get_scientific_object_variables:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->get_scientific_object_variables: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Scientific Object URI | 
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

# **get_scientific_objects_children**
> List[ScientificObjectNodeWithChildrenDTO] get_scientific_objects_children(authorization, parent=parent, experiment=experiment, rdf_types=rdf_types, name=name, factor_levels=factor_levels, facility=facility, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Get list of scientific object children

### Example


```python
import openapi_client
from openapi_client.models.scientific_object_node_with_children_dto import ScientificObjectNodeWithChildrenDTO
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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    parent = 'http://opensilex.org/id/Plot 12' # str | Parent object URI (optional)
    experiment = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI (optional)
    rdf_types = ['vocabulary:Plant'] # List[str] | RDF type filter (optional)
    name = '.*' # str | Regex pattern for filtering by name (optional) (default to '.*')
    factor_levels = ['vocabulary:IrrigationStress'] # List[str] | Factor levels URI (optional)
    facility = 'diaphen:serre-2' # str | Facility (optional)
    order_by = ['name=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get list of scientific object children
        api_response = api_instance.get_scientific_objects_children(authorization, parent=parent, experiment=experiment, rdf_types=rdf_types, name=name, factor_levels=factor_levels, facility=facility, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of ScientificObjectsApi->get_scientific_objects_children:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->get_scientific_objects_children: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **parent** | **str**| Parent object URI | [optional] 
 **experiment** | **str**| Experiment URI | [optional] 
 **rdf_types** | [**List[str]**](str.md)| RDF type filter | [optional] 
 **name** | **str**| Regex pattern for filtering by name | [optional] [default to &#39;.*&#39;]
 **factor_levels** | [**List[str]**](str.md)| Factor levels URI | [optional] 
 **facility** | **str**| Facility | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ScientificObjectNodeWithChildrenDTO]**](ScientificObjectNodeWithChildrenDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return list of scientific objects children corresponding to the parent URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_scientific_objects_list_by_uris**
> List[ScientificObjectNodeDTO] get_scientific_objects_list_by_uris(authorization, experiment=experiment, accept_language=accept_language, body=body)

Get scientific objet list of a given experiment URI

### Example


```python
import openapi_client
from openapi_client.models.scientific_object_node_dto import ScientificObjectNodeDTO
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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    experiment = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI (optional)
    accept_language = 'en' # str | Request accepted language (optional)
    body = ['body_example'] # List[str] | Scientific object uris (optional)

    try:
        # Get scientific objet list of a given experiment URI
        api_response = api_instance.get_scientific_objects_list_by_uris(authorization, experiment=experiment, accept_language=accept_language, body=body)
        print("The response of ScientificObjectsApi->get_scientific_objects_list_by_uris:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->get_scientific_objects_list_by_uris: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **experiment** | **str**| Experiment URI | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**List[str]**](str.md)| Scientific object uris | [optional] 

### Return type

[**List[ScientificObjectNodeDTO]**](ScientificObjectNodeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return list of scientific objects corresponding to the given experiment URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_used_types**
> List[ListItemDTO] get_used_types(authorization, experiment=experiment, accept_language=accept_language)

get used scientific object types

### Example


```python
import openapi_client
from openapi_client.models.list_item_dto import ListItemDTO
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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    experiment = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # get used scientific object types
        api_response = api_instance.get_used_types(authorization, experiment=experiment, accept_language=accept_language)
        print("The response of ScientificObjectsApi->get_used_types:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->get_used_types: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **experiment** | **str**| Experiment URI | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ListItemDTO]**](ListItemDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return scientific object types list |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **import_csv1**
> CSVValidationDTO import_csv1(authorization, description, file, accept_language=accept_language)

Import a CSV file for the given experiment URI and scientific object type.

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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    description = 'description_example' # str | File description with metadata
    file = None # bytearray | Data file
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Import a CSV file for the given experiment URI and scientific object type.
        api_response = api_instance.import_csv1(authorization, description, file, accept_language=accept_language)
        print("The response of ScientificObjectsApi->import_csv1:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->import_csv1: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **description** | **str**| File description with metadata | 
 **file** | **bytearray**| Data file | 
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
**201** | Data file and metadata saved |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_scientific_objects**
> List[ScientificObjectNodeDTO] search_scientific_objects(authorization, experiment=experiment, rdf_types=rdf_types, name=name, parent=parent, germplasms=germplasms, factor_levels=factor_levels, facility=facility, variables=variables, devices=devices, existence_date=existence_date, creation_date=creation_date, criteria_on_data=criteria_on_data, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search list of scientific objects

### Example


```python
import openapi_client
from openapi_client.models.scientific_object_node_dto import ScientificObjectNodeDTO
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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    experiment = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI (optional)
    rdf_types = ['vocabulary:Plant'] # List[str] | RDF type filter (optional)
    name = '.*' # str | Regex pattern for filtering by name (optional) (default to '.*')
    parent = 'http://opensilex.org/id/Plot 12' # str | Parent URI (optional)
    germplasms = ['http://aims.fao.org/aos/agrovoc/c_1066'] # List[str] | Germplasm URIs (optional)
    factor_levels = ['vocabulary:IrrigationStress'] # List[str] | Factor levels URI (optional)
    facility = 'diaphen:serre-2' # str | Facility (optional)
    variables = ['variables_example'] # List[str] | Variables URI (optional)
    devices = ['devices_example'] # List[str] | Devices URI (optional)
    existence_date = '2013-10-20' # date | Date to filter object existence (optional)
    creation_date = '2013-10-20' # date | Date to filter object creation (optional)
    criteria_on_data = 'criteria_on_data_example' # str | A CriteriaDTO to be applied to data, retain objects that are targets in returned data (optional)
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search list of scientific objects
        api_response = api_instance.search_scientific_objects(authorization, experiment=experiment, rdf_types=rdf_types, name=name, parent=parent, germplasms=germplasms, factor_levels=factor_levels, facility=facility, variables=variables, devices=devices, existence_date=existence_date, creation_date=creation_date, criteria_on_data=criteria_on_data, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of ScientificObjectsApi->search_scientific_objects:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->search_scientific_objects: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **experiment** | **str**| Experiment URI | [optional] 
 **rdf_types** | [**List[str]**](str.md)| RDF type filter | [optional] 
 **name** | **str**| Regex pattern for filtering by name | [optional] [default to &#39;.*&#39;]
 **parent** | **str**| Parent URI | [optional] 
 **germplasms** | [**List[str]**](str.md)| Germplasm URIs | [optional] 
 **factor_levels** | [**List[str]**](str.md)| Factor levels URI | [optional] 
 **facility** | **str**| Facility | [optional] 
 **variables** | [**List[str]**](str.md)| Variables URI | [optional] 
 **devices** | [**List[str]**](str.md)| Devices URI | [optional] 
 **existence_date** | **date**| Date to filter object existence | [optional] 
 **creation_date** | **date**| Date to filter object creation | [optional] 
 **criteria_on_data** | **str**| A CriteriaDTO to be applied to data, retain objects that are targets in returned data | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ScientificObjectNodeDTO]**](ScientificObjectNodeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return scientific objects corresponding to the given search parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_scientific_objects_with_geometry_list_by_uris**
> List[ScientificObjectNodeDTO] search_scientific_objects_with_geometry_list_by_uris(experiment, authorization, start_date=start_date, end_date=end_date, accept_language=accept_language)

Get scientific objet list with geometry of a given experiment URI

### Example


```python
import openapi_client
from openapi_client.models.scientific_object_node_dto import ScientificObjectNodeDTO
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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    experiment = 'http://example.com/' # str | Context URI
    authorization = 'authorization_example' # str | Authentication token
    start_date = '2020-08-21' # str | Search by minimal date (optional)
    end_date = '2020-08-22' # str | Search by maximal date (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get scientific objet list with geometry of a given experiment URI
        api_response = api_instance.search_scientific_objects_with_geometry_list_by_uris(experiment, authorization, start_date=start_date, end_date=end_date, accept_language=accept_language)
        print("The response of ScientificObjectsApi->search_scientific_objects_with_geometry_list_by_uris:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->search_scientific_objects_with_geometry_list_by_uris: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **experiment** | **str**| Context URI | 
 **authorization** | **str**| Authentication token | 
 **start_date** | **str**| Search by minimal date | [optional] 
 **end_date** | **str**| Search by maximal date | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ScientificObjectNodeDTO]**](ScientificObjectNodeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return list of scientific objects whose geometry corresponds to the given experiment URI |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_scientific_object**
> str update_scientific_object(authorization, body, accept_language=accept_language)

Update a scientific object for the given experiment

### Example


```python
import openapi_client
from openapi_client.models.scientific_object_update_dto import ScientificObjectUpdateDTO
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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    body = openapi_client.ScientificObjectUpdateDTO() # ScientificObjectUpdateDTO | Scientific object description
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Update a scientific object for the given experiment
        api_response = api_instance.update_scientific_object(authorization, body, accept_language=accept_language)
        print("The response of ScientificObjectsApi->update_scientific_object:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->update_scientific_object: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **body** | [**ScientificObjectUpdateDTO**](ScientificObjectUpdateDTO.md)| Scientific object description | 
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
**200** | Scientific object updated |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **validate_csv3**
> CSVValidationDTO validate_csv3(authorization, description, file, accept_language=accept_language)

Validate a CSV file for the given experiment URI and scientific object type.

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
    api_instance = openapi_client.ScientificObjectsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    description = 'description_example' # str | File description with metadata
    file = None # bytearray | Data file
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Validate a CSV file for the given experiment URI and scientific object type.
        api_response = api_instance.validate_csv3(authorization, description, file, accept_language=accept_language)
        print("The response of ScientificObjectsApi->validate_csv3:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ScientificObjectsApi->validate_csv3: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **description** | **str**| File description with metadata | 
 **file** | **bytearray**| Data file | 
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
**201** | CSV validation errors or a validation token used for CSV import |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

