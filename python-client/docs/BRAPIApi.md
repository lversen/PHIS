# openapi_client.BRAPIApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_calls**](BRAPIApi.md#get_calls) | **GET** /brapi/v1/calls | Check the available BrAPI calls
[**get_germplasm_by_search**](BRAPIApi.md#get_germplasm_by_search) | **GET** /brapi/v1/germplasm | Submit a search request for germplasm (type accession in OpenSILEX
[**get_observation_units**](BRAPIApi.md#get_observation_units) | **GET** /brapi/v1/studies/{studyDbId}/observationunits | List all the observation units measured in the study.
[**get_observation_variables**](BRAPIApi.md#get_observation_variables) | **GET** /brapi/v1/studies/{studyDbId}/observationvariables | List all the observation variables measured in the study.
[**get_observations**](BRAPIApi.md#get_observations) | **GET** /brapi/v1/studies/{studyDbId}/observations | Get the observations associated to a specific study
[**get_studies**](BRAPIApi.md#get_studies) | **GET** /brapi/v1/studies | Retrieve studies information
[**get_studies_search**](BRAPIApi.md#get_studies_search) | **GET** /brapi/v1/studies-search | Retrieve studies information
[**get_study_details**](BRAPIApi.md#get_study_details) | **GET** /brapi/v1/studies/{studyDbId} | Retrieve study details
[**get_variable_details**](BRAPIApi.md#get_variable_details) | **GET** /brapi/v1/variables/{observationVariableDbId} | Retrieve variable details by id
[**get_variables_list**](BRAPIApi.md#get_variables_list) | **GET** /brapi/v1/variables | BrAPIv1CallDTO to retrieve a list of observationVariables available in the system


# **get_calls**
> BrAPIv1CallListResponse get_calls(page=page, page_size=page_size, data_type=data_type)

Check the available BrAPI calls

Check the available BrAPI calls

### Example


```python
import openapi_client
from openapi_client.models.br_apiv1_call_list_response import BrAPIv1CallListResponse
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
    api_instance = openapi_client.BRAPIApi(api_client)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    data_type = 'json' # str | datatype (optional)

    try:
        # Check the available BrAPI calls
        api_response = api_instance.get_calls(page=page, page_size=page_size, data_type=data_type)
        print("The response of BRAPIApi->get_calls:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling BRAPIApi->get_calls: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **data_type** | **str**| datatype | [optional] 

### Return type

[**BrAPIv1CallListResponse**](BrAPIv1CallListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Retrieve BrAPI calls |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_germplasm_by_search**
> BrAPIv1GermplasmListResponse get_germplasm_by_search(authorization, germplasm_db_id=germplasm_db_id, germplasm_pui=germplasm_pui, germplasm_name=germplasm_name, common_crop_name=common_crop_name, page=page, page_size=page_size, accept_language=accept_language)

Submit a search request for germplasm (type accession in OpenSILEX

### Example


```python
import openapi_client
from openapi_client.models.br_apiv1_germplasm_list_response import BrAPIv1GermplasmListResponse
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
    api_instance = openapi_client.BRAPIApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    germplasm_db_id = 'germplasm_db_id_example' # str | Search by germplasmDbId (URI of an OpenSilex accession) (optional)
    germplasm_pui = 'germplasm_pui_example' # str | Search by germplasmPUI (URI of an OpenSilex accession) (optional)
    germplasm_name = 'germplasm_name_example' # str | Search by germplasmName (name of an OpenSilex accession) (optional)
    common_crop_name = 'common_crop_name_example' # str | Search by commonCropName (name of the species of an OpenSilex accession) (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Submit a search request for germplasm (type accession in OpenSILEX
        api_response = api_instance.get_germplasm_by_search(authorization, germplasm_db_id=germplasm_db_id, germplasm_pui=germplasm_pui, germplasm_name=germplasm_name, common_crop_name=common_crop_name, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of BRAPIApi->get_germplasm_by_search:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling BRAPIApi->get_germplasm_by_search: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **germplasm_db_id** | **str**| Search by germplasmDbId (URI of an OpenSilex accession) | [optional] 
 **germplasm_pui** | **str**| Search by germplasmPUI (URI of an OpenSilex accession) | [optional] 
 **germplasm_name** | **str**| Search by germplasmName (name of an OpenSilex accession) | [optional] 
 **common_crop_name** | **str**| Search by commonCropName (name of the species of an OpenSilex accession) | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**BrAPIv1GermplasmListResponse**](BrAPIv1GermplasmListResponse.md)

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

# **get_observation_units**
> BrAPIv1ObservationUnitListResponse get_observation_units(study_db_id, authorization, observation_level=observation_level, page_size=page_size, page=page, accept_language=accept_language)

List all the observation units measured in the study.

List all the observation units measured in the study.

### Example


```python
import openapi_client
from openapi_client.models.br_apiv1_observation_unit_list_response import BrAPIv1ObservationUnitListResponse
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
    api_instance = openapi_client.BRAPIApi(api_client)
    study_db_id = 'study_db_id_example' # str | studyDbId
    authorization = 'authorization_example' # str | Authentication token
    observation_level = 'Plot' # str | observationLevel (optional)
    page_size = 20 # int | pageSize (optional) (default to 20)
    page = 0 # int | page (optional) (default to 0)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # List all the observation units measured in the study.
        api_response = api_instance.get_observation_units(study_db_id, authorization, observation_level=observation_level, page_size=page_size, page=page, accept_language=accept_language)
        print("The response of BRAPIApi->get_observation_units:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling BRAPIApi->get_observation_units: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **study_db_id** | **str**| studyDbId | 
 **authorization** | **str**| Authentication token | 
 **observation_level** | **str**| observationLevel | [optional] 
 **page_size** | **int**| pageSize | [optional] [default to 20]
 **page** | **int**| page | [optional] [default to 0]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**BrAPIv1ObservationUnitListResponse**](BrAPIv1ObservationUnitListResponse.md)

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

# **get_observation_variables**
> BrAPIv1ObservationVariableListResponse get_observation_variables(study_db_id, authorization, page_size=page_size, page=page, accept_language=accept_language)

List all the observation variables measured in the study.

List all the observation variables measured in the study.

### Example


```python
import openapi_client
from openapi_client.models.br_apiv1_observation_variable_list_response import BrAPIv1ObservationVariableListResponse
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
    api_instance = openapi_client.BRAPIApi(api_client)
    study_db_id = 'study_db_id_example' # str | studyDbId
    authorization = 'authorization_example' # str | Authentication token
    page_size = 20 # int | pageSize (optional) (default to 20)
    page = 0 # int | page (optional) (default to 0)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # List all the observation variables measured in the study.
        api_response = api_instance.get_observation_variables(study_db_id, authorization, page_size=page_size, page=page, accept_language=accept_language)
        print("The response of BRAPIApi->get_observation_variables:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling BRAPIApi->get_observation_variables: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **study_db_id** | **str**| studyDbId | 
 **authorization** | **str**| Authentication token | 
 **page_size** | **int**| pageSize | [optional] [default to 20]
 **page** | **int**| page | [optional] [default to 0]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**BrAPIv1ObservationVariableListResponse**](BrAPIv1ObservationVariableListResponse.md)

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

# **get_observations**
> BrAPIv1ObservationListResponse get_observations(study_db_id, authorization, observation_variable_db_ids=observation_variable_db_ids, page_size=page_size, page=page, accept_language=accept_language)

Get the observations associated to a specific study

Get the observations associated to a specific study

### Example


```python
import openapi_client
from openapi_client.models.br_apiv1_observation_list_response import BrAPIv1ObservationListResponse
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
    api_instance = openapi_client.BRAPIApi(api_client)
    study_db_id = 'study_db_id_example' # str | studyDbId
    authorization = 'authorization_example' # str | Authentication token
    observation_variable_db_ids = ['observation_variable_db_ids_example'] # List[str] | observationVariableDbIds (optional)
    page_size = 20 # int | pageSize (optional) (default to 20)
    page = 0 # int | page (optional) (default to 0)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get the observations associated to a specific study
        api_response = api_instance.get_observations(study_db_id, authorization, observation_variable_db_ids=observation_variable_db_ids, page_size=page_size, page=page, accept_language=accept_language)
        print("The response of BRAPIApi->get_observations:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling BRAPIApi->get_observations: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **study_db_id** | **str**| studyDbId | 
 **authorization** | **str**| Authentication token | 
 **observation_variable_db_ids** | [**List[str]**](str.md)| observationVariableDbIds | [optional] 
 **page_size** | **int**| pageSize | [optional] [default to 20]
 **page** | **int**| page | [optional] [default to 0]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**BrAPIv1ObservationListResponse**](BrAPIv1ObservationListResponse.md)

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

# **get_studies**
> BrAPIv1StudyListResponse get_studies(authorization, study_db_id=study_db_id, active=active, sort_by=sort_by, sort_order=sort_order, page=page, page_size=page_size, accept_language=accept_language)

Retrieve studies information

Retrieve studies information

### Example


```python
import openapi_client
from openapi_client.models.br_apiv1_study_list_response import BrAPIv1StudyListResponse
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
    api_instance = openapi_client.BRAPIApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    study_db_id = 'study_db_id_example' # str | Search by studyDbId (optional)
    active = 'active_example' # str | Filter active status true/false (optional)
    sort_by = 'sort_by_example' # str | Name of the field to sort by: studyDbId, active (optional)
    sort_order = 'sort_order_example' # str | Sort order direction - ASC or DESC (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Retrieve studies information
        api_response = api_instance.get_studies(authorization, study_db_id=study_db_id, active=active, sort_by=sort_by, sort_order=sort_order, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of BRAPIApi->get_studies:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling BRAPIApi->get_studies: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **study_db_id** | **str**| Search by studyDbId | [optional] 
 **active** | **str**| Filter active status true/false | [optional] 
 **sort_by** | **str**| Name of the field to sort by: studyDbId, active | [optional] 
 **sort_order** | **str**| Sort order direction - ASC or DESC | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**BrAPIv1StudyListResponse**](BrAPIv1StudyListResponse.md)

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

# **get_studies_search**
> BrAPIv1StudyListResponse get_studies_search(authorization, study_db_id=study_db_id, active=active, sort_by=sort_by, sort_order=sort_order, page_size=page_size, page=page, accept_language=accept_language)

Retrieve studies information

Retrieve studies information

### Example


```python
import openapi_client
from openapi_client.models.br_apiv1_study_list_response import BrAPIv1StudyListResponse
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
    api_instance = openapi_client.BRAPIApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    study_db_id = 'study_db_id_example' # str | Search by studyDbId (optional)
    active = 'active_example' # str | Filter active status true/false (optional)
    sort_by = 'sort_by_example' # str | Name of the field to sort by: studyDbId or seasonDbId (optional)
    sort_order = 'sort_order_example' # str | Sort order direction - ASC or DESC (optional)
    page_size = 20 # int | pageSize (optional) (default to 20)
    page = 0 # int | page (optional) (default to 0)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Retrieve studies information
        api_response = api_instance.get_studies_search(authorization, study_db_id=study_db_id, active=active, sort_by=sort_by, sort_order=sort_order, page_size=page_size, page=page, accept_language=accept_language)
        print("The response of BRAPIApi->get_studies_search:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling BRAPIApi->get_studies_search: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **study_db_id** | **str**| Search by studyDbId | [optional] 
 **active** | **str**| Filter active status true/false | [optional] 
 **sort_by** | **str**| Name of the field to sort by: studyDbId or seasonDbId | [optional] 
 **sort_order** | **str**| Sort order direction - ASC or DESC | [optional] 
 **page_size** | **int**| pageSize | [optional] [default to 20]
 **page** | **int**| page | [optional] [default to 0]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**BrAPIv1StudyListResponse**](BrAPIv1StudyListResponse.md)

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

# **get_study_details**
> BrAPIv1SingleStudyResponse get_study_details(study_db_id, authorization, accept_language=accept_language)

Retrieve study details

Retrieve study details

### Example


```python
import openapi_client
from openapi_client.models.br_apiv1_single_study_response import BrAPIv1SingleStudyResponse
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
    api_instance = openapi_client.BRAPIApi(api_client)
    study_db_id = 'study_db_id_example' # str | Search by studyDbId
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Retrieve study details
        api_response = api_instance.get_study_details(study_db_id, authorization, accept_language=accept_language)
        print("The response of BRAPIApi->get_study_details:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling BRAPIApi->get_study_details: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **study_db_id** | **str**| Search by studyDbId | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**BrAPIv1SingleStudyResponse**](BrAPIv1SingleStudyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Retrieve study details |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_variable_details**
> BrAPIv1SingleObservationVariableResponse get_variable_details(observation_variable_db_id, authorization, accept_language=accept_language)

Retrieve variable details by id

Retrieve variable details by id

### Example


```python
import openapi_client
from openapi_client.models.br_apiv1_single_observation_variable_response import BrAPIv1SingleObservationVariableResponse
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
    api_instance = openapi_client.BRAPIApi(api_client)
    observation_variable_db_id = 'observation_variable_db_id_example' # str | A variable URI (Unique Resource Identifier)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Retrieve variable details by id
        api_response = api_instance.get_variable_details(observation_variable_db_id, authorization, accept_language=accept_language)
        print("The response of BRAPIApi->get_variable_details:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling BRAPIApi->get_variable_details: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **observation_variable_db_id** | **str**| A variable URI (Unique Resource Identifier) | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**BrAPIv1SingleObservationVariableResponse**](BrAPIv1SingleObservationVariableResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Retrieve variable details by id |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_variables_list**
> BrAPIv1ObservationVariableListResponse get_variables_list(authorization, observation_variable_db_id=observation_variable_db_id, page_size=page_size, page=page, accept_language=accept_language)

BrAPIv1CallDTO to retrieve a list of observationVariables available in the system

retrieve variables information

### Example


```python
import openapi_client
from openapi_client.models.br_apiv1_observation_variable_list_response import BrAPIv1ObservationVariableListResponse
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
    api_instance = openapi_client.BRAPIApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    observation_variable_db_id = 'observation_variable_db_id_example' # str | observationVariableDbId (optional)
    page_size = 20 # int | pageSize (optional) (default to 20)
    page = 0 # int | page (optional) (default to 0)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # BrAPIv1CallDTO to retrieve a list of observationVariables available in the system
        api_response = api_instance.get_variables_list(authorization, observation_variable_db_id=observation_variable_db_id, page_size=page_size, page=page, accept_language=accept_language)
        print("The response of BRAPIApi->get_variables_list:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling BRAPIApi->get_variables_list: %s\n" % e)
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

[**BrAPIv1ObservationVariableListResponse**](BrAPIv1ObservationVariableListResponse.md)

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

