# swagger_client.PositionsApi

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**count_moves**](PositionsApi.md#count_moves) | **GET** /core/positions/count | Count moves
[**get_position**](PositionsApi.md#get_position) | **GET** /core/positions/{uri} | Get the position of an object
[**search_geospatialized_position**](PositionsApi.md#search_geospatialized_position) | **POST** /core/positions/geospatializedPosition | Search the last geospatialized position of a target for an experiment
[**search_position_history**](PositionsApi.md#search_position_history) | **GET** /core/positions/history | Search history of position of an object


# **count_moves**
> int count_moves(authorization, target=target, accept_language=accept_language)

Count moves



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.PositionsApi()
authorization = 'authorization_example' # str | Authentication token
target = 'http://www.opensilex.org/demo/2018/o18000076' # str | Target URI (optional)
accept_language = 'en' # str | Request accepted language (optional)

try:
    # Count moves
    api_response = api_instance.count_moves(authorization, target=target, accept_language=accept_language)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling PositionsApi->count_moves: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **target** | **str**| Target URI | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_position**
> PositionGetDTO get_position(uri, authorization, time=time, accept_language=accept_language)

Get the position of an object



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.PositionsApi()
uri = 'http://opensilex.dev/plant/plant5841' # str | Object URI
authorization = 'authorization_example' # str | Authentication token
time = '2019-09-08T12:00:00+01:00' # str | Time : match position at the given time (optional)
accept_language = 'en' # str | Request accepted language (optional)

try:
    # Get the position of an object
    api_response = api_instance.get_position(uri, authorization, time=time, accept_language=accept_language)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling PositionsApi->get_position: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Object URI | 
 **authorization** | **str**| Authentication token | 
 **time** | **str**| Time : match position at the given time | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**PositionGetDTO**](PositionGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_geospatialized_position**
> list[PositionGetDTO] search_geospatialized_position(body, authorization, base_type=base_type, start_date_time=start_date_time, end_date_time=end_date_time, page=page, page_size=page_size, accept_language=accept_language)

Search the last geospatialized position of a target for an experiment



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.PositionsApi()
body = swagger_client.GeoJsonObject() # GeoJsonObject | geometry GeoJSON
authorization = 'authorization_example' # str | Authentication token
base_type = 'base_type_example' # str | target RDF Type URI (optional)
start_date_time = '2019-09-08T12:00:00+01:00' # str | Start date : match position affected after the given start date (optional)
end_date_time = '2021-09-08T12:00:00+01:00' # str | End date : match position affected before the given end date (optional)
page = 0 # int | Page number (optional) (default to 0)
page_size = 20 # int | Page size (optional)
accept_language = 'en' # str | Request accepted language (optional)

try:
    # Search the last geospatialized position of a target for an experiment
    api_response = api_instance.search_geospatialized_position(body, authorization, base_type=base_type, start_date_time=start_date_time, end_date_time=end_date_time, page=page, page_size=page_size, accept_language=accept_language)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling PositionsApi->search_geospatialized_position: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**GeoJsonObject**](GeoJsonObject.md)| geometry GeoJSON | 
 **authorization** | **str**| Authentication token | 
 **base_type** | **str**| target RDF Type URI | [optional] 
 **start_date_time** | **str**| Start date : match position affected after the given start date | [optional] 
 **end_date_time** | **str**| End date : match position affected before the given end date | [optional] 
 **page** | **int**| Page number | [optional] [default to 0]
 **page_size** | **int**| Page size | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**list[PositionGetDTO]**](PositionGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_position_history**
> list[PositionGetDTO] search_position_history(target, authorization, start_date_time=start_date_time, end_date_time=end_date_time, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)

Search history of position of an object



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.PositionsApi()
target = 'http://www.opensilex.org/demo/2018/o18000076' # str | Target URI
authorization = 'authorization_example' # str | Authentication token
start_date_time = '2019-09-08T12:00:00+01:00' # str | Start date : match position affected after the given start date (optional)
end_date_time = '2021-09-08T12:00:00+01:00' # str | End date : match position affected before the given end date (optional)
order_by = ['order_by_example'] # list[str] | List of fields to sort as an array of fieldName=asc|desc (optional)
page = 56 # int | Page number (optional)
page_size = 56 # int | Page size (optional)
accept_language = 'en' # str | Request accepted language (optional)

try:
    # Search history of position of an object
    api_response = api_instance.search_position_history(target, authorization, start_date_time=start_date_time, end_date_time=end_date_time, order_by=order_by, page=page, page_size=page_size, accept_language=accept_language)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling PositionsApi->search_position_history: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **target** | **str**| Target URI | 
 **authorization** | **str**| Authentication token | 
 **start_date_time** | **str**| Start date : match position affected after the given start date | [optional] 
 **end_date_time** | **str**| End date : match position affected before the given end date | [optional] 
 **order_by** | [**list[str]**](str.md)| List of fields to sort as an array of fieldName&#x3D;asc|desc | [optional] 
 **page** | **int**| Page number | [optional] 
 **page_size** | **int**| Page size | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**list[PositionGetDTO]**](PositionGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

