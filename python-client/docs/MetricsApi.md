# openapi_client.MetricsApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_experiment_summary_history**](MetricsApi.md#get_experiment_summary_history) | **GET** /core/metrics/experiment/{uri} | Get an experiment summary history
[**get_running_experiments_summary**](MetricsApi.md#get_running_experiments_summary) | **GET** /core/metrics/running_experiments | Get running experiments metrics
[**get_system_metrics**](MetricsApi.md#get_system_metrics) | **GET** /core/metrics/system | Get system metrics
[**get_system_metrics_summary**](MetricsApi.md#get_system_metrics_summary) | **GET** /core/metrics/system/summary | Get system metrics summary


# **get_experiment_summary_history**
> MetricDTO get_experiment_summary_history(uri, authorization, start_date=start_date, end_date=end_date, page=page, page_size=page_size, accept_language=accept_language)

Get an experiment summary history

### Example


```python
import openapi_client
from openapi_client.models.metric_dto import MetricDTO
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
    api_instance = openapi_client.MetricsApi(api_client)
    uri = 'http://opensilex/set/experiments/ZA17' # str | Metrics URI
    authorization = 'authorization_example' # str | Authentication token
    start_date = '2020-08-21T00:00:00+01:00' # str | Search by minimal date (optional)
    end_date = '2020-09-21T00:00:00+01:00' # str | Search by maximal date (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get an experiment summary history
        api_response = api_instance.get_experiment_summary_history(uri, authorization, start_date=start_date, end_date=end_date, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of MetricsApi->get_experiment_summary_history:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling MetricsApi->get_experiment_summary_history: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Metrics URI | 
 **authorization** | **str**| Authentication token | 
 **start_date** | **str**| Search by minimal date | [optional] 
 **end_date** | **str**| Search by maximal date | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**MetricDTO**](MetricDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Experiment metrics history retrieved |  -  |
**404** | Experiment metrics not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_running_experiments_summary**
> MetricDTO get_running_experiments_summary(authorization, start_date=start_date, end_date=end_date, page=page, page_size=page_size, accept_language=accept_language)

Get running experiments metrics

### Example


```python
import openapi_client
from openapi_client.models.metric_dto import MetricDTO
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
    api_instance = openapi_client.MetricsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    start_date = '2020-08-21T00:00:00+01:00' # str | Search by minimal date (optional)
    end_date = '2020-09-21T00:00:00+01:00' # str | Search by maximal date (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get running experiments metrics
        api_response = api_instance.get_running_experiments_summary(authorization, start_date=start_date, end_date=end_date, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of MetricsApi->get_running_experiments_summary:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling MetricsApi->get_running_experiments_summary: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **start_date** | **str**| Search by minimal date | [optional] 
 **end_date** | **str**| Search by maximal date | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**MetricDTO**](MetricDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Metrics retrieved |  -  |
**404** | Metrics not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_system_metrics**
> List[MetricDTO] get_system_metrics(authorization, start_date=start_date, end_date=end_date, page=page, page_size=page_size, accept_language=accept_language)

Get system metrics

### Example


```python
import openapi_client
from openapi_client.models.metric_dto import MetricDTO
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
    api_instance = openapi_client.MetricsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    start_date = '2020-08-21T00:00:00+01:00' # str | Search by minimal date (optional)
    end_date = '2020-09-21T00:00:00+01:00' # str | Search by maximal date (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get system metrics
        api_response = api_instance.get_system_metrics(authorization, start_date=start_date, end_date=end_date, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of MetricsApi->get_system_metrics:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling MetricsApi->get_system_metrics: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **start_date** | **str**| Search by minimal date | [optional] 
 **end_date** | **str**| Search by maximal date | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[MetricDTO]**](MetricDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | System metrics retrieved |  -  |
**404** | System metrics not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_system_metrics_summary**
> MetricPeriodDTO get_system_metrics_summary(authorization, period=period, page=page, page_size=page_size, accept_language=accept_language)

Get system metrics summary

### Example


```python
import openapi_client
from openapi_client.models.metric_period_dto import MetricPeriodDTO
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
    api_instance = openapi_client.MetricsApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    period = 'DAY, WEEK, MONTH, YEAR' # str | Search by minimal date (optional)
    page = 0 # int | Page number (optional) (default to 0)
    page_size = 20 # int | Page size (optional) (default to 20)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get system metrics summary
        api_response = api_instance.get_system_metrics_summary(authorization, period=period, page=page, page_size=page_size, accept_language=accept_language)
        print("The response of MetricsApi->get_system_metrics_summary:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling MetricsApi->get_system_metrics_summary: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **period** | **str**| Search by minimal date | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] [default to 20]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**MetricPeriodDTO**](MetricPeriodDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | System metrics retrieved |  -  |
**404** | System metrics not found |  -  |
**503** | System metrics not available |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

