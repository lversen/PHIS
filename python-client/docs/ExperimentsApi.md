# openapi_client.ExperimentsApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_experiment**](ExperimentsApi.md#create_experiment) | **POST** /core/experiments | Add an experiment
[**delete_experiment**](ExperimentsApi.md#delete_experiment) | **DELETE** /core/experiments/{uri} | Delete an experiment
[**export_experiment_data_list**](ExperimentsApi.md#export_experiment_data_list) | **GET** /core/experiments/{uri}/data/export | export experiment data
[**get_available_facilities**](ExperimentsApi.md#get_available_facilities) | **GET** /core/experiments/{uri}/available_facilities | Get facilities available for an experiment
[**get_available_factors**](ExperimentsApi.md#get_available_factors) | **GET** /core/experiments/{uri}/factors | Get factors with their levels associated to an experiment
[**get_available_species**](ExperimentsApi.md#get_available_species) | **GET** /core/experiments/{uri}/species | Get species present in an experiment
[**get_experiment**](ExperimentsApi.md#get_experiment) | **GET** /core/experiments/{uri} | Get an experiment
[**get_experiments_by_uris**](ExperimentsApi.md#get_experiments_by_uris) | **GET** /core/experiments/by_uris | Get experiments URIs
[**get_used_variables1**](ExperimentsApi.md#get_used_variables1) | **GET** /core/experiments/{uri}/variables | Get variables involved in an experiment
[**import_csv_data1**](ExperimentsApi.md#import_csv_data1) | **POST** /core/experiments/{uri}/data/import | Import a CSV file for the given experiment URI and scientific object type.
[**search_experiment_data_list**](ExperimentsApi.md#search_experiment_data_list) | **GET** /core/experiments/{uri}/data | Search data
[**search_experiment_provenances**](ExperimentsApi.md#search_experiment_provenances) | **GET** /core/experiments/{uri}/provenances | Get provenances involved in an experiment
[**search_experiments**](ExperimentsApi.md#search_experiments) | **GET** /core/experiments | Search experiments
[**update_experiment**](ExperimentsApi.md#update_experiment) | **PUT** /core/experiments | Update an experiment
[**validate_csv2**](ExperimentsApi.md#validate_csv2) | **POST** /core/experiments/{uri}/data/import_validation | Import a CSV file for the given experiment URI and scientific object type.


# **create_experiment**
> str create_experiment(authorization, accept_language=accept_language, body=body)

Add an experiment

### Example


```python
import openapi_client
from openapi_client.models.experiment_creation_dto import ExperimentCreationDTO
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
    api_instance = openapi_client.ExperimentsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.ExperimentCreationDTO() # ExperimentCreationDTO | Experiment description (optional)

    try:
        # Add an experiment
        api_response = api_instance.create_experiment(authorization, accept_language=accept_language, body=body)
        print("The response of ExperimentsApi->create_experiment:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ExperimentsApi->create_experiment: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**ExperimentCreationDTO**](ExperimentCreationDTO.md)| Experiment description | [optional] 

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
**201** | An experiment is created |  -  |
**409** | An experiment with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_experiment**
> str delete_experiment(uri, authorization, accept_language=accept_language)

Delete an experiment

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
    api_instance = openapi_client.ExperimentsApi(api_client)
    uri = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete an experiment
        api_response = api_instance.delete_experiment(uri, authorization, accept_language=accept_language)
        print("The response of ExperimentsApi->delete_experiment:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ExperimentsApi->delete_experiment: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Experiment URI | 
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
**200** | Experiment deleted |  -  |
**404** | Experiment URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **export_experiment_data_list**
> export_experiment_data_list(uri, authorization, start_date=start_date, end_date=end_date, timezone=timezone, scientific_objects=scientific_objects, variables=variables, min_confidence=min_confidence, max_confidence=max_confidence, provenance=provenance, metadata=metadata, operators=operators, mode=mode, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

export experiment data

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
    api_instance = openapi_client.ExperimentsApi(api_client)
    uri = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI
    authorization = 'authorization_example' # str | Authentication token
    start_date = '2020-08-21T00:00:00+01:00' # str | Search by minimal date (optional)
    end_date = '2020-09-21T00:00:00+01:00' # str | Search by maximal date (optional)
    timezone = 'Europe/Paris' # str | Precise the timezone corresponding to the given dates (optional)
    scientific_objects = ['http://opensilex.dev/opensilex/2020/o20000345'] # List[str] | Search by objects (optional)
    variables = ['http://opensilex.dev/variable#variable.2020-08-21_11-21-23entity6_method6_quality6_unit6'] # List[str] | Search by variables (optional)
    min_confidence = 0.5 # float | Search by minimal confidence index (optional)
    max_confidence = 0.5 # float | Search by maximal confidence index (optional)
    provenance = 'http://opensilex.dev/provenance/1598001689415' # str | Search by provenance uri (optional)
    metadata = '{ \"LabelView\" : \"side90\", \"paramA\" : \"90\"}' # str | Search by metadata (optional)
    operators = ['dev:id/user/isa.droits'] # List[str] | Search by operators (optional)
    mode = 'wide' # str | Format wide or long (optional) (default to 'wide')
    order_by = ['date=desc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # export experiment data
        api_instance.export_experiment_data_list(uri, authorization, start_date=start_date, end_date=end_date, timezone=timezone, scientific_objects=scientific_objects, variables=variables, min_confidence=min_confidence, max_confidence=max_confidence, provenance=provenance, metadata=metadata, operators=operators, mode=mode, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
    except Exception as e:
        print("Exception when calling ExperimentsApi->export_experiment_data_list: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Experiment URI | 
 **authorization** | **str**| Authentication token | 
 **start_date** | **str**| Search by minimal date | [optional] 
 **end_date** | **str**| Search by maximal date | [optional] 
 **timezone** | **str**| Precise the timezone corresponding to the given dates | [optional] 
 **scientific_objects** | [**List[str]**](str.md)| Search by objects | [optional] 
 **variables** | [**List[str]**](str.md)| Search by variables | [optional] 
 **min_confidence** | **float**| Search by minimal confidence index | [optional] 
 **max_confidence** | **float**| Search by maximal confidence index | [optional] 
 **provenance** | **str**| Search by provenance uri | [optional] 
 **metadata** | **str**| Search by metadata | [optional] 
 **operators** | [**List[str]**](str.md)| Search by operators | [optional] 
 **mode** | **str**| Format wide or long | [optional] [default to &#39;wide&#39;]
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
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
**200** | Return a csv file with data list results in wide or long format |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_available_facilities**
> List[FacilityGetDTO] get_available_facilities(uri, authorization, accept_language=accept_language)

Get facilities available for an experiment

### Example


```python
import openapi_client
from openapi_client.models.facility_get_dto import FacilityGetDTO
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
    api_instance = openapi_client.ExperimentsApi(api_client)
    uri = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get facilities available for an experiment
        api_response = api_instance.get_available_facilities(uri, authorization, accept_language=accept_language)
        print("The response of ExperimentsApi->get_available_facilities:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ExperimentsApi->get_available_facilities: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Experiment URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[FacilityGetDTO]**](FacilityGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return facilities list |  -  |
**500** | Internal Server Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_available_factors**
> List[FactorDetailsGetDTO] get_available_factors(uri, authorization, accept_language=accept_language)

Get factors with their levels associated to an experiment

### Example


```python
import openapi_client
from openapi_client.models.factor_details_get_dto import FactorDetailsGetDTO
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
    api_instance = openapi_client.ExperimentsApi(api_client)
    uri = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get factors with their levels associated to an experiment
        api_response = api_instance.get_available_factors(uri, authorization, accept_language=accept_language)
        print("The response of ExperimentsApi->get_available_factors:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ExperimentsApi->get_available_factors: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Experiment URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[FactorDetailsGetDTO]**](FactorDetailsGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return factors list |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_available_species**
> List[SpeciesDTO] get_available_species(uri, authorization, accept_language=accept_language)

Get species present in an experiment

### Example


```python
import openapi_client
from openapi_client.models.species_dto import SpeciesDTO
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
    api_instance = openapi_client.ExperimentsApi(api_client)
    uri = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get species present in an experiment
        api_response = api_instance.get_available_species(uri, authorization, accept_language=accept_language)
        print("The response of ExperimentsApi->get_available_species:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ExperimentsApi->get_available_species: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Experiment URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[SpeciesDTO]**](SpeciesDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return Species list |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_experiment**
> ExperimentGetDTO get_experiment(uri, authorization, accept_language=accept_language)

Get an experiment

### Example


```python
import openapi_client
from openapi_client.models.experiment_get_dto import ExperimentGetDTO
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
    api_instance = openapi_client.ExperimentsApi(api_client)
    uri = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get an experiment
        api_response = api_instance.get_experiment(uri, authorization, accept_language=accept_language)
        print("The response of ExperimentsApi->get_experiment:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ExperimentsApi->get_experiment: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Experiment URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**ExperimentGetDTO**](ExperimentGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Experiment retrieved |  -  |
**404** | Experiment URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_experiments_by_uris**
> List[ExperimentGetListDTO] get_experiments_by_uris(uris, authorization, accept_language=accept_language)

Get experiments URIs

### Example


```python
import openapi_client
from openapi_client.models.experiment_get_list_dto import ExperimentGetListDTO
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
    api_instance = openapi_client.ExperimentsApi(api_client)
    uris = ['uris_example'] # List[str] | Experiments URIs
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get experiments URIs
        api_response = api_instance.get_experiments_by_uris(uris, authorization, accept_language=accept_language)
        print("The response of ExperimentsApi->get_experiments_by_uris:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ExperimentsApi->get_experiments_by_uris: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uris** | [**List[str]**](str.md)| Experiments URIs | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ExperimentGetListDTO]**](ExperimentGetListDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return experiments |  -  |
**400** | Invalid parameters |  -  |
**404** | Experiment not found (if any provided URIs is not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_used_variables1**
> List[NamedResourceDTO] get_used_variables1(uri, authorization, scientific_objects=scientific_objects, accept_language=accept_language)

Get variables involved in an experiment

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
    api_instance = openapi_client.ExperimentsApi(api_client)
    uri = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI
    authorization = 'authorization_example' # str | Authentication token
    scientific_objects = ['http://opensilex.dev/opensilex/2020/o20000345'] # List[str] | Search by objects uris (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get variables involved in an experiment
        api_response = api_instance.get_used_variables1(uri, authorization, scientific_objects=scientific_objects, accept_language=accept_language)
        print("The response of ExperimentsApi->get_used_variables1:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ExperimentsApi->get_used_variables1: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Experiment URI | 
 **authorization** | **str**| Authentication token | 
 **scientific_objects** | [**List[str]**](str.md)| Search by objects uris | [optional] 
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

# **import_csv_data1**
> DataCSVValidationDTO import_csv_data1(uri, provenance, authorization, file, accept_language=accept_language)

Import a CSV file for the given experiment URI and scientific object type.

### Example


```python
import openapi_client
from openapi_client.models.data_csv_validation_dto import DataCSVValidationDTO
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
    api_instance = openapi_client.ExperimentsApi(api_client)
    uri = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI
    provenance = 'http://opensilex.dev/id/provenance/provenancelabel' # str | Provenance URI
    authorization = 'authorization_example' # str | Authentication token
    file = None # bytearray | Data file
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Import a CSV file for the given experiment URI and scientific object type.
        api_response = api_instance.import_csv_data1(uri, provenance, authorization, file, accept_language=accept_language)
        print("The response of ExperimentsApi->import_csv_data1:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ExperimentsApi->import_csv_data1: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Experiment URI | 
 **provenance** | **str**| Provenance URI | 
 **authorization** | **str**| Authentication token | 
 **file** | **bytearray**| Data file | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**DataCSVValidationDTO**](DataCSVValidationDTO.md)

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

# **search_experiment_data_list**
> List[DataGetDTO] search_experiment_data_list(uri, authorization, start_date=start_date, end_date=end_date, timezone=timezone, scientific_objects=scientific_objects, variables=variables, min_confidence=min_confidence, max_confidence=max_confidence, provenances=provenances, metadata=metadata, operators=operators, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search data

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
    api_instance = openapi_client.ExperimentsApi(api_client)
    uri = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI
    authorization = 'authorization_example' # str | Authentication token
    start_date = '2020-08-21T00:00:00+01:00' # str | Search by minimal date (optional)
    end_date = '2020-09-21T00:00:00+01:00' # str | Search by maximal date (optional)
    timezone = 'Europe/Paris' # str | Precise the timezone corresponding to the given dates (optional)
    scientific_objects = ['http://opensilex.dev/opensilex/2020/o20000345'] # List[str] | Search by objects (optional)
    variables = ['http://opensilex.dev/variable#variable.2020-08-21_11-21-23entity6_method6_quality6_unit6'] # List[str] | Search by variables (optional)
    min_confidence = 0.5 # float | Search by minimal confidence index (optional)
    max_confidence = 0.5 # float | Search by maximal confidence index (optional)
    provenances = ['http://opensilex.dev/provenance/1598001689415'] # List[str] | Search by provenance uri (optional)
    metadata = '{ \"LabelView\" : \"side90\", \"paramA\" : \"90\"}' # str | Search by metadata (optional)
    operators = ['dev:id/user/isa.droits'] # List[str] | Search by operators (optional)
    order_by = ['date=desc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search data
        api_response = api_instance.search_experiment_data_list(uri, authorization, start_date=start_date, end_date=end_date, timezone=timezone, scientific_objects=scientific_objects, variables=variables, min_confidence=min_confidence, max_confidence=max_confidence, provenances=provenances, metadata=metadata, operators=operators, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of ExperimentsApi->search_experiment_data_list:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ExperimentsApi->search_experiment_data_list: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Experiment URI | 
 **authorization** | **str**| Authentication token | 
 **start_date** | **str**| Search by minimal date | [optional] 
 **end_date** | **str**| Search by maximal date | [optional] 
 **timezone** | **str**| Precise the timezone corresponding to the given dates | [optional] 
 **scientific_objects** | [**List[str]**](str.md)| Search by objects | [optional] 
 **variables** | [**List[str]**](str.md)| Search by variables | [optional] 
 **min_confidence** | **float**| Search by minimal confidence index | [optional] 
 **max_confidence** | **float**| Search by maximal confidence index | [optional] 
 **provenances** | [**List[str]**](str.md)| Search by provenance uri | [optional] 
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

# **search_experiment_provenances**
> List[ProvenanceGetDTO] search_experiment_provenances(uri, authorization, name=name, description=description, activity=activity, activity_type=activity_type, agent=agent, agent_type=agent_type, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Get provenances involved in an experiment

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
    api_instance = openapi_client.ExperimentsApi(api_client)
    uri = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI
    authorization = 'authorization_example' # str | Authentication token
    name = 'name_example' # str | Regex pattern for filtering by name (optional)
    description = 'description_example' # str | Search by description (optional)
    activity = 'activity_example' # str | Search by activity URI (optional)
    activity_type = 'activity_type_example' # str | Search by activity type (optional)
    agent = 'agent_example' # str | Search by agent URI (optional)
    agent_type = 'agent_type_example' # str | Search by agent type (optional)
    order_by = ['date=desc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get provenances involved in an experiment
        api_response = api_instance.search_experiment_provenances(uri, authorization, name=name, description=description, activity=activity, activity_type=activity_type, agent=agent, agent_type=agent_type, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of ExperimentsApi->search_experiment_provenances:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ExperimentsApi->search_experiment_provenances: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Experiment URI | 
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Regex pattern for filtering by name | [optional] 
 **description** | **str**| Search by description | [optional] 
 **activity** | **str**| Search by activity URI | [optional] 
 **activity_type** | **str**| Search by activity type | [optional] 
 **agent** | **str**| Search by agent URI | [optional] 
 **agent_type** | **str**| Search by agent type | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
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
**200** | Return data list |  -  |
**400** | Invalid parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_experiments**
> List[ExperimentGetListDTO] search_experiments(authorization, name=name, year=year, is_ended=is_ended, species=species, factors=factors, projects=projects, is_public=is_public, facilities=facilities, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search experiments

### Example


```python
import openapi_client
from openapi_client.models.experiment_get_list_dto import ExperimentGetListDTO
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
    api_instance = openapi_client.ExperimentsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    name = 'ZA17' # str | Regex pattern for filtering by name (optional)
    year = 2017 # int | Search by year (optional)
    is_ended = True # bool | Search ended(false) or active experiments(true) (optional)
    species = ['http://www.phenome-fppn.fr/id/species/zeamays'] # List[str] | Search by involved species (optional)
    factors = ['http://purl.obolibrary.org/obo/CHEBI_25555'] # List[str] | Search by studied effect (optional)
    projects = ['http://www.phenome-fppn.fr/projects/ZA17 http://www.phenome-fppn.fr/id/projects/ZA18'] # List[str] | Search by related project uri (optional)
    is_public = True # bool | Search private(false) or public experiments(true) (optional)
    facilities = ['facilities_example'] # List[str] | Search by involved facilities (optional)
    order_by = ['uri=asc'] # List[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search experiments
        api_response = api_instance.search_experiments(authorization, name=name, year=year, is_ended=is_ended, species=species, factors=factors, projects=projects, is_public=is_public, facilities=facilities, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of ExperimentsApi->search_experiments:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ExperimentsApi->search_experiments: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Regex pattern for filtering by name | [optional] 
 **year** | **int**| Search by year | [optional] 
 **is_ended** | **bool**| Search ended(false) or active experiments(true) | [optional] 
 **species** | [**List[str]**](str.md)| Search by involved species | [optional] 
 **factors** | [**List[str]**](str.md)| Search by studied effect | [optional] 
 **projects** | [**List[str]**](str.md)| Search by related project uri | [optional] 
 **is_public** | **bool**| Search private(false) or public experiments(true) | [optional] 
 **facilities** | [**List[str]**](str.md)| Search by involved facilities | [optional] 
 **order_by** | [**List[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ExperimentGetListDTO]**](ExperimentGetListDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return experiments |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_experiment**
> str update_experiment(authorization, accept_language=accept_language, body=body)

Update an experiment

### Example


```python
import openapi_client
from openapi_client.models.experiment_creation_dto import ExperimentCreationDTO
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
    api_instance = openapi_client.ExperimentsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.ExperimentCreationDTO() # ExperimentCreationDTO | Experiment description (optional)

    try:
        # Update an experiment
        api_response = api_instance.update_experiment(authorization, accept_language=accept_language, body=body)
        print("The response of ExperimentsApi->update_experiment:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ExperimentsApi->update_experiment: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**ExperimentCreationDTO**](ExperimentCreationDTO.md)| Experiment description | [optional] 

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
**200** | Experiment updated |  -  |
**404** | Experiment URI not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **validate_csv2**
> DataCSVValidationDTO validate_csv2(uri, provenance, authorization, file, accept_language=accept_language)

Import a CSV file for the given experiment URI and scientific object type.

### Example


```python
import openapi_client
from openapi_client.models.data_csv_validation_dto import DataCSVValidationDTO
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
    api_instance = openapi_client.ExperimentsApi(api_client)
    uri = 'http://opensilex/experiment/id/ZA17' # str | Experiment URI
    provenance = 'http://opensilex.dev/id/provenance/provenancelabel' # str | Provenance URI
    authorization = 'authorization_example' # str | Authentication token
    file = None # bytearray | Data file
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Import a CSV file for the given experiment URI and scientific object type.
        api_response = api_instance.validate_csv2(uri, provenance, authorization, file, accept_language=accept_language)
        print("The response of ExperimentsApi->validate_csv2:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling ExperimentsApi->validate_csv2: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Experiment URI | 
 **provenance** | **str**| Provenance URI | 
 **authorization** | **str**| Authentication token | 
 **file** | **bytearray**| Data file | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**DataCSVValidationDTO**](DataCSVValidationDTO.md)

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

