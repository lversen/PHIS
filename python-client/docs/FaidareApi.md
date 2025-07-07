# openapi_client.FaidareApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_calls1**](FaidareApi.md#get_calls1) | **GET** /faidare/v1/calls | Check the available faidare calls
[**get_germplasms_by_search**](FaidareApi.md#get_germplasms_by_search) | **GET** /faidare/v1/germplasm | Submit a search request for germplasm
[**get_locations_list**](FaidareApi.md#get_locations_list) | **GET** /faidare/v1/locations | Faidarev1CallDTO to retrieve a list of locations available in the system
[**get_studies_list**](FaidareApi.md#get_studies_list) | **GET** /faidare/v1/studies | Retrieve studies information
[**get_trials_list**](FaidareApi.md#get_trials_list) | **GET** /faidare/v1/trials | Faidarev1CallDTO to retrieve a list of trials available in the system
[**get_variables_list1**](FaidareApi.md#get_variables_list1) | **GET** /faidare/v1/variables | Faidarev1CallDTO to retrieve a list of observationVariables available in the system


# **get_calls1**
> Faidarev1CallListResponse get_calls1(authorization, page=page, page_size=page_size, accept_language=accept_language)

Check the available faidare calls

Check the available faidare calls

### Example


```python
import openapi_client
from openapi_client.models.faidarev1_call_list_response import Faidarev1CallListResponse
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
    api_instance = openapi_client.FaidareApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Check the available faidare calls
        api_response = api_instance.get_calls1(authorization, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of FaidareApi->get_calls1:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling FaidareApi->get_calls1: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**Faidarev1CallListResponse**](Faidarev1CallListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Retrieve faidare calls |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_germplasms_by_search**
> Faidarev1GermplasmListResponse get_germplasms_by_search(authorization, germplasm_db_id=germplasm_db_id, germplasm_pui=germplasm_pui, germplasm_name=germplasm_name, page=page, page_size=page_size, accept_language=accept_language)

Submit a search request for germplasm

### Example


```python
import openapi_client
from openapi_client.models.faidarev1_germplasm_list_response import Faidarev1GermplasmListResponse
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
    api_instance = openapi_client.FaidareApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    germplasm_db_id = 'germplasm_db_id_example' # str | Search by germplasmDbId (optional)
    germplasm_pui = 'germplasm_pui_example' # str | Search by germplasmPUI (optional)
    germplasm_name = 'germplasm_name_example' # str | Search by germplasmName (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Submit a search request for germplasm
        api_response = api_instance.get_germplasms_by_search(authorization, germplasm_db_id=germplasm_db_id, germplasm_pui=germplasm_pui, germplasm_name=germplasm_name, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of FaidareApi->get_germplasms_by_search:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling FaidareApi->get_germplasms_by_search: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **germplasm_db_id** | **str**| Search by germplasmDbId | [optional] 
 **germplasm_pui** | **str**| Search by germplasmPUI | [optional] 
 **germplasm_name** | **str**| Search by germplasmName | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**Faidarev1GermplasmListResponse**](Faidarev1GermplasmListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | OK |  -  |
**400** | Bad user request |  -  |
**500** | Internal Server Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_locations_list**
> Faidarev1LocationListResponse get_locations_list(authorization, location_db_id=location_db_id, page=page, page_size=page_size, accept_language=accept_language)

Faidarev1CallDTO to retrieve a list of locations available in the system

retrieve locations information

### Example


```python
import openapi_client
from openapi_client.models.faidarev1_location_list_response import Faidarev1LocationListResponse
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
    api_instance = openapi_client.FaidareApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    location_db_id = 'location_db_id_example' # str | Search by Location (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Faidarev1CallDTO to retrieve a list of locations available in the system
        api_response = api_instance.get_locations_list(authorization, location_db_id=location_db_id, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of FaidareApi->get_locations_list:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling FaidareApi->get_locations_list: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **location_db_id** | **str**| Search by Location | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**Faidarev1LocationListResponse**](Faidarev1LocationListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | retrieve locations information |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_studies_list**
> Faidarev1StudyListResponse get_studies_list(authorization, study_db_id=study_db_id, page=page, page_size=page_size, accept_language=accept_language)

Retrieve studies information

Retrieve studies information

### Example


```python
import openapi_client
from openapi_client.models.faidarev1_study_list_response import Faidarev1StudyListResponse
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
    api_instance = openapi_client.FaidareApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    study_db_id = 'study_db_id_example' # str | Search by studyDbId (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Retrieve studies information
        api_response = api_instance.get_studies_list(authorization, study_db_id=study_db_id, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of FaidareApi->get_studies_list:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling FaidareApi->get_studies_list: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **study_db_id** | **str**| Search by studyDbId | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**Faidarev1StudyListResponse**](Faidarev1StudyListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Retrieve studies information |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_trials_list**
> Faidarev1TrialListResponse get_trials_list(authorization, page_size=page_size, page=page, accept_language=accept_language)

Faidarev1CallDTO to retrieve a list of trials available in the system

retrieve trials information

### Example


```python
import openapi_client
from openapi_client.models.faidarev1_trial_list_response import Faidarev1TrialListResponse
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
    api_instance = openapi_client.FaidareApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    page_size = 20 # int | pageSize (optional) (default to 20)
    page = 0 # int | page (optional) (default to 0)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Faidarev1CallDTO to retrieve a list of trials available in the system
        api_response = api_instance.get_trials_list(authorization, page_size=page_size, page=page, accept_language=accept_language)
        print("The response of FaidareApi->get_trials_list:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling FaidareApi->get_trials_list: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **page_size** | **int**| pageSize | [optional] [default to 20]
 **page** | **int**| page | [optional] [default to 0]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**Faidarev1TrialListResponse**](Faidarev1TrialListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | retrieve trials information |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_variables_list1**
> Faidarev1ObservationVariableListResponse get_variables_list1(authorization, observation_variable_db_id=observation_variable_db_id, page_size=page_size, page=page, accept_language=accept_language)

Faidarev1CallDTO to retrieve a list of observationVariables available in the system

retrieve variables information

### Example


```python
import openapi_client
from openapi_client.models.faidarev1_observation_variable_list_response import Faidarev1ObservationVariableListResponse
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
    api_instance = openapi_client.FaidareApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    observation_variable_db_id = 'observation_variable_db_id_example' # str | observationVariableDbId (optional)
    page_size = 20 # int | pageSize (optional) (default to 20)
    page = 0 # int | page (optional) (default to 0)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Faidarev1CallDTO to retrieve a list of observationVariables available in the system
        api_response = api_instance.get_variables_list1(authorization, observation_variable_db_id=observation_variable_db_id, page_size=page_size, page=page, accept_language=accept_language)
        print("The response of FaidareApi->get_variables_list1:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling FaidareApi->get_variables_list1: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **observation_variable_db_id** | **str**| observationVariableDbId | [optional] 
 **page_size** | **int**| pageSize | [optional] [default to 20]
 **page** | **int**| page | [optional] [default to 0]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**Faidarev1ObservationVariableListResponse**](Faidarev1ObservationVariableListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | retrieve variables information |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

