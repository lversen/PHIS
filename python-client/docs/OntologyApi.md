# openapi_client.OntologyApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**add_class_property_restriction**](OntologyApi.md#add_class_property_restriction) | **POST** /ontology/rdf_type_property_restriction | Add a rdf type property restriction
[**check_uris_types**](OntologyApi.md#check_uris_types) | **POST** /ontology/check_rdf_types | Check the given rdf-types on the given uris
[**create_property**](OntologyApi.md#create_property) | **POST** /ontology/property | Create a RDF property
[**delete_class_property_restriction**](OntologyApi.md#delete_class_property_restriction) | **DELETE** /ontology/rdf_type_property_restriction | Delete a rdf type property restriction
[**delete_property**](OntologyApi.md#delete_property) | **DELETE** /ontology/property | Delete a property
[**get_base_uri**](OntologyApi.md#get_base_uri) | **GET** /ontology/base_uri | Return base uri
[**get_classes**](OntologyApi.md#get_classes) | **GET** /ontology/rdf_types | Return classes models definitions with properties for a list of rdf types
[**get_data_properties**](OntologyApi.md#get_data_properties) | **GET** /ontology/data_properties | Search data properties tree
[**get_linkable_properties**](OntologyApi.md#get_linkable_properties) | **GET** /ontology/linkable_properties | Search properties linkable to a domain
[**get_name_space**](OntologyApi.md#get_name_space) | **GET** /ontology/name_space | Return namespaces
[**get_object_properties**](OntologyApi.md#get_object_properties) | **GET** /ontology/object_properties | Search object properties tree
[**get_properties**](OntologyApi.md#get_properties) | **GET** /ontology/properties/{domain} | Search properties tree
[**get_properties_by_domain_hierarchy_using_restrictions**](OntologyApi.md#get_properties_by_domain_hierarchy_using_restrictions) | **GET** /ontology/domain_hierarchy_restrictions | Get restrictions from some super-class domain to one lower down in the hierarchy, ordered by what domain they first appear in.
[**get_property**](OntologyApi.md#get_property) | **GET** /ontology/property | Return property model definition detail
[**get_rdf_type**](OntologyApi.md#get_rdf_type) | **GET** /ontology/rdf_type | Return class model definition with properties
[**get_shared_resource_instances**](OntologyApi.md#get_shared_resource_instances) | **GET** /ontology/shared_resource_instances | Return the list of shared resource instances
[**get_sub_classes_of**](OntologyApi.md#get_sub_classes_of) | **GET** /ontology/subclasses_of | Search sub-classes tree of an RDF class
[**get_sub_properties_of**](OntologyApi.md#get_sub_properties_of) | **GET** /ontology/subproperties_of | Return property list from a parent property
[**get_uri_label**](OntologyApi.md#get_uri_label) | **GET** /ontology/uri_label | Return associated rdfs:label of an uri if exists
[**get_uri_labels_list**](OntologyApi.md#get_uri_labels_list) | **POST** /ontology/uris_labels | Return associated rdfs:label of uris if they exist
[**get_uri_types**](OntologyApi.md#get_uri_types) | **POST** /ontology/uri_types | Return all rdf types of an uri
[**rename_uri**](OntologyApi.md#rename_uri) | **PUT** /ontology/{uri}/rename | Rename all occurrences of the given URI
[**search_sub_classes_of**](OntologyApi.md#search_sub_classes_of) | **GET** /ontology/subclasses_of/search | Search sub-classes tree of an RDF class
[**update_class_property_restriction**](OntologyApi.md#update_class_property_restriction) | **PUT** /ontology/rdf_type_property_restriction | Update a rdf type property restriction
[**update_property**](OntologyApi.md#update_property) | **PUT** /ontology/property | Update a RDF property


# **add_class_property_restriction**
> str add_class_property_restriction(authorization, accept_language=accept_language, body=body)

Add a rdf type property restriction

### Example


```python
import openapi_client
from openapi_client.models.owl_class_property_restriction_dto import OWLClassPropertyRestrictionDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.OWLClassPropertyRestrictionDTO() # OWLClassPropertyRestrictionDTO | Property description (optional)

    try:
        # Add a rdf type property restriction
        api_response = api_instance.add_class_property_restriction(authorization, accept_language=accept_language, body=body)
        print("The response of OntologyApi->add_class_property_restriction:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->add_class_property_restriction: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**OWLClassPropertyRestrictionDTO**](OWLClassPropertyRestrictionDTO.md)| Property description | [optional] 

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
**200** | Class property restriction added |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **check_uris_types**
> List[URITypesDTO] check_uris_types(rdf_types, authorization, accept_language=accept_language, body=body)

Check the given rdf-types on the given uris

### Example


```python
import openapi_client
from openapi_client.models.uri_types_dto import URITypesDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    rdf_types = ['rdf_types_example'] # List[str] | rdf_types list you want to check on the given uris list
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.URIsListPostDTO() # URIsListPostDTO | URIs list (optional)

    try:
        # Check the given rdf-types on the given uris
        api_response = api_instance.check_uris_types(rdf_types, authorization, accept_language=accept_language, body=body)
        print("The response of OntologyApi->check_uris_types:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->check_uris_types: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rdf_types** | [**List[str]**](str.md)| rdf_types list you want to check on the given uris list | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**URIsListPostDTO**](URIsListPostDTO.md)| URIs list | [optional] 

### Return type

[**List[URITypesDTO]**](URITypesDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return the URIs with the checked rdf:types |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_property**
> str create_property(authorization, accept_language=accept_language, body=body)

Create a RDF property

### Example


```python
import openapi_client
from openapi_client.models.rdf_property_dto import RDFPropertyDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.RDFPropertyDTO() # RDFPropertyDTO | Property description (optional)

    try:
        # Create a RDF property
        api_response = api_instance.create_property(authorization, accept_language=accept_language, body=body)
        print("The response of OntologyApi->create_property:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->create_property: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**RDFPropertyDTO**](RDFPropertyDTO.md)| Property description | [optional] 

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
**201** | Create a RDF property |  -  |
**409** | A property with the same URI already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_class_property_restriction**
> str delete_class_property_restriction(rdf_type, property_uri, authorization, accept_language=accept_language)

Delete a rdf type property restriction

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
    api_instance = openapi_client.OntologyApi(api_client)
    rdf_type = 'rdf_type_example' # str | RDF type
    property_uri = 'property_uri_example' # str | Property URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a rdf type property restriction
        api_response = api_instance.delete_class_property_restriction(rdf_type, property_uri, authorization, accept_language=accept_language)
        print("The response of OntologyApi->delete_class_property_restriction:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->delete_class_property_restriction: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rdf_type** | **str**| RDF type | 
 **property_uri** | **str**| Property URI | 
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
**200** | Class property restriction deleted  |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_property**
> str delete_property(uri, rdf_type, authorization, accept_language=accept_language)

Delete a property

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
    api_instance = openapi_client.OntologyApi(api_client)
    uri = 'uri_example' # str | Property URI
    rdf_type = 'rdf_type_example' # str | Property type
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Delete a property
        api_response = api_instance.delete_property(uri, rdf_type, authorization, accept_language=accept_language)
        print("The response of OntologyApi->delete_property:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->delete_property: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| Property URI | 
 **rdf_type** | **str**| Property type | 
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
**200** | Property deleted  |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_base_uri**
> str get_base_uri()

Return base uri

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
    api_instance = openapi_client.OntologyApi(api_client)

    try:
        # Return base uri
        api_response = api_instance.get_base_uri()
        print("The response of OntologyApi->get_base_uri:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_base_uri: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

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
**200** | Return base uri |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_classes**
> List[RDFTypeDTO] get_classes(rdf_type, authorization, parent_type=parent_type, accept_language=accept_language)

Return classes models definitions with properties for a list of rdf types

### Example


```python
import openapi_client
from openapi_client.models.rdf_type_dto import RDFTypeDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    rdf_type = ['rdf_type_example'] # List[str] | RDF classes URI
    authorization = 'authorization_example' # str | Authentication token
    parent_type = 'parent_type_example' # str | Parent RDF class URI (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Return classes models definitions with properties for a list of rdf types
        api_response = api_instance.get_classes(rdf_type, authorization, parent_type=parent_type, accept_language=accept_language)
        print("The response of OntologyApi->get_classes:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_classes: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rdf_type** | [**List[str]**](str.md)| RDF classes URI | 
 **authorization** | **str**| Authentication token | 
 **parent_type** | **str**| Parent RDF class URI | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[RDFTypeDTO]**](RDFTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return classes models definitions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_data_properties**
> List[ResourceTreeDTO] get_data_properties(authorization, domain=domain, name=name, accept_language=accept_language)

Search data properties tree

### Example


```python
import openapi_client
from openapi_client.models.resource_tree_dto import ResourceTreeDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    domain = 'domain_example' # str | Domain URI (optional)
    name = 'plant_height' # str | Name regex pattern (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search data properties tree
        api_response = api_instance.get_data_properties(authorization, domain=domain, name=name, accept_language=accept_language)
        print("The response of OntologyApi->get_data_properties:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_data_properties: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **domain** | **str**| Domain URI | [optional] 
 **name** | **str**| Name regex pattern | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ResourceTreeDTO]**](ResourceTreeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return data property tree |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_linkable_properties**
> List[ResourceTreeDTO] get_linkable_properties(domain, authorization, parent=parent, accept_language=accept_language)

Search properties linkable to a domain

### Example


```python
import openapi_client
from openapi_client.models.resource_tree_dto import ResourceTreeDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    domain = 'domain_example' # str | Domain URI
    authorization = 'authorization_example' # str | Authentication token
    parent = 'parent_example' # str | Domain parent URI (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search properties linkable to a domain
        api_response = api_instance.get_linkable_properties(domain, authorization, parent=parent, accept_language=accept_language)
        print("The response of OntologyApi->get_linkable_properties:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_linkable_properties: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domain** | **str**| Domain URI | 
 **authorization** | **str**| Authentication token | 
 **parent** | **str**| Domain parent URI | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ResourceTreeDTO]**](ResourceTreeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return property tree |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_name_space**
> str get_name_space()

Return namespaces

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
    api_instance = openapi_client.OntologyApi(api_client)

    try:
        # Return namespaces
        api_response = api_instance.get_name_space()
        print("The response of OntologyApi->get_name_space:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_name_space: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

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
**200** | Return namespaces |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_object_properties**
> List[ResourceTreeDTO] get_object_properties(authorization, domain=domain, name=name, accept_language=accept_language)

Search object properties tree

### Example


```python
import openapi_client
from openapi_client.models.resource_tree_dto import ResourceTreeDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    domain = 'domain_example' # str | Domain URI (optional)
    name = 'plant_height' # str | Name regex pattern (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search object properties tree
        api_response = api_instance.get_object_properties(authorization, domain=domain, name=name, accept_language=accept_language)
        print("The response of OntologyApi->get_object_properties:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_object_properties: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **domain** | **str**| Domain URI | [optional] 
 **name** | **str**| Name regex pattern | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ResourceTreeDTO]**](ResourceTreeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return object property tree |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_properties**
> List[ResourceTreeDTO] get_properties(domain, authorization, name=name, include_sub_classes=include_sub_classes, accept_language=accept_language)

Search properties tree

### Example


```python
import openapi_client
from openapi_client.models.resource_tree_dto import ResourceTreeDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    domain = 'domain_example' # str | Domain URI
    authorization = 'authorization_example' # str | Authentication token
    name = 'plant_height' # str | Name regex pattern (optional)
    include_sub_classes = True # bool | Return all properties from sub-classes (optional) (default to True)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search properties tree
        api_response = api_instance.get_properties(domain, authorization, name=name, include_sub_classes=include_sub_classes, accept_language=accept_language)
        print("The response of OntologyApi->get_properties:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_properties: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domain** | **str**| Domain URI | 
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Name regex pattern | [optional] 
 **include_sub_classes** | **bool**| Return all properties from sub-classes | [optional] [default to True]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ResourceTreeDTO]**](ResourceTreeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return property tree |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_properties_by_domain_hierarchy_using_restrictions**
> List[PropertiesByDomainDTO] get_properties_by_domain_hierarchy_using_restrictions(ancestor, children, authorization, accept_language=accept_language)

Get restrictions from some super-class domain to one lower down in the hierarchy, ordered by what domain they first appear in.

### Example


```python
import openapi_client
from openapi_client.models.properties_by_domain_dto import PropertiesByDomainDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    ancestor = 'ancestor_example' # str | Domain ancestor URI
    children = ['children_example'] # List[str] | Domain uris from types that have ancestor as an ancestor
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Get restrictions from some super-class domain to one lower down in the hierarchy, ordered by what domain they first appear in.
        api_response = api_instance.get_properties_by_domain_hierarchy_using_restrictions(ancestor, children, authorization, accept_language=accept_language)
        print("The response of OntologyApi->get_properties_by_domain_hierarchy_using_restrictions:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_properties_by_domain_hierarchy_using_restrictions: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ancestor** | **str**| Domain ancestor URI | 
 **children** | [**List[str]**](str.md)| Domain uris from types that have ancestor as an ancestor | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[PropertiesByDomainDTO]**](PropertiesByDomainDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return list of objects containing domain source and list of property trees |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_property**
> RDFPropertyGetDTO get_property(authorization, uri=uri, rdf_type=rdf_type, domain_rdf_type=domain_rdf_type, accept_language=accept_language)

Return property model definition detail

### Example


```python
import openapi_client
from openapi_client.models.rdf_property_get_dto import RDFPropertyGetDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    uri = 'uri_example' # str | Property URI (optional)
    rdf_type = 'rdf_type_example' # str | Property type (optional)
    domain_rdf_type = 'domain_rdf_type_example' # str | Property type (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Return property model definition detail
        api_response = api_instance.get_property(authorization, uri=uri, rdf_type=rdf_type, domain_rdf_type=domain_rdf_type, accept_language=accept_language)
        print("The response of OntologyApi->get_property:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_property: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **uri** | **str**| Property URI | [optional] 
 **rdf_type** | **str**| Property type | [optional] 
 **domain_rdf_type** | **str**| Property type | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**RDFPropertyGetDTO**](RDFPropertyGetDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return property model definition  |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_rdf_type**
> RDFTypeDTO get_rdf_type(rdf_type, authorization, parent_type=parent_type, accept_language=accept_language)

Return class model definition with properties

### Example


```python
import openapi_client
from openapi_client.models.rdf_type_dto import RDFTypeDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    rdf_type = 'rdf_type_example' # str | RDF type URI
    authorization = 'authorization_example' # str | Authentication token
    parent_type = 'parent_type_example' # str | Parent RDF class URI (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Return class model definition with properties
        api_response = api_instance.get_rdf_type(rdf_type, authorization, parent_type=parent_type, accept_language=accept_language)
        print("The response of OntologyApi->get_rdf_type:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_rdf_type: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rdf_type** | **str**| RDF type URI | 
 **authorization** | **str**| Authentication token | 
 **parent_type** | **str**| Parent RDF class URI | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**RDFTypeDTO**](RDFTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return class model definition  |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_shared_resource_instances**
> List[SharedResourceInstanceDTO] get_shared_resource_instances(authorization, accept_language=accept_language)

Return the list of shared resource instances

### Example


```python
import openapi_client
from openapi_client.models.shared_resource_instance_dto import SharedResourceInstanceDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Return the list of shared resource instances
        api_response = api_instance.get_shared_resource_instances(authorization, accept_language=accept_language)
        print("The response of OntologyApi->get_shared_resource_instances:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_shared_resource_instances: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[SharedResourceInstanceDTO]**](SharedResourceInstanceDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return shared resource instances |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_sub_classes_of**
> List[ResourceTreeDTO] get_sub_classes_of(authorization, parent_type=parent_type, ignore_root_classes=ignore_root_classes, accept_language=accept_language)

Search sub-classes tree of an RDF class

### Example


```python
import openapi_client
from openapi_client.models.resource_tree_dto import ResourceTreeDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    parent_type = 'parent_type_example' # str | Parent RDF class URI (optional)
    ignore_root_classes = False # bool | Flag to determine if only sub-classes must be include in result (optional) (default to False)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search sub-classes tree of an RDF class
        api_response = api_instance.get_sub_classes_of(authorization, parent_type=parent_type, ignore_root_classes=ignore_root_classes, accept_language=accept_language)
        print("The response of OntologyApi->get_sub_classes_of:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_sub_classes_of: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **parent_type** | **str**| Parent RDF class URI | [optional] 
 **ignore_root_classes** | **bool**| Flag to determine if only sub-classes must be include in result | [optional] [default to False]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ResourceTreeDTO]**](ResourceTreeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return sub-classes tree |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_sub_properties_of**
> List[ObjectNamedResourceDTO] get_sub_properties_of(authorization, domain=domain, uri=uri, ignore_root_property=ignore_root_property, accept_language=accept_language)

Return property list from a parent property

### Example


```python
import openapi_client
from openapi_client.models.object_named_resource_dto import ObjectNamedResourceDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    domain = 'domain_example' # str | Domain URI (optional)
    uri = 'uri_example' # str | Property URI (optional)
    ignore_root_property = False # bool | Flag to determine if only sub-properties must be included in result (optional) (default to False)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Return property list from a parent property
        api_response = api_instance.get_sub_properties_of(authorization, domain=domain, uri=uri, ignore_root_property=ignore_root_property, accept_language=accept_language)
        print("The response of OntologyApi->get_sub_properties_of:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_sub_properties_of: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **domain** | **str**| Domain URI | [optional] 
 **uri** | **str**| Property URI | [optional] 
 **ignore_root_property** | **bool**| Flag to determine if only sub-properties must be included in result | [optional] [default to False]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ObjectNamedResourceDTO]**](ObjectNamedResourceDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return property model definition  |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_uri_label**
> str get_uri_label(uri, authorization, accept_language=accept_language)

Return associated rdfs:label of an uri if exists

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
    api_instance = openapi_client.OntologyApi(api_client)
    uri = 'uri_example' # str | URI to get label from
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Return associated rdfs:label of an uri if exists
        api_response = api_instance.get_uri_label(uri, authorization, accept_language=accept_language)
        print("The response of OntologyApi->get_uri_label:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_uri_label: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| URI to get label from | 
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
**200** | Return URI label |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_uri_labels_list**
> List[NamedResourceDTO] get_uri_labels_list(authorization, body, context=context, search_default=search_default, accept_language=accept_language)

Return associated rdfs:label of uris if they exist

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
    api_instance = openapi_client.OntologyApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    body = ['body_example'] # List[str] | URIs to get label from
    context = 'context_example' # str | Context URI (optional)
    search_default = True # bool | Look for all contexts if not present in specified context (optional)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Return associated rdfs:label of uris if they exist
        api_response = api_instance.get_uri_labels_list(authorization, body, context=context, search_default=search_default, accept_language=accept_language)
        print("The response of OntologyApi->get_uri_labels_list:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_uri_labels_list: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **body** | [**List[str]**](str.md)| URIs to get label from | 
 **context** | **str**| Context URI | [optional] 
 **search_default** | **bool**| Look for all contexts if not present in specified context | [optional] 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[NamedResourceDTO]**](NamedResourceDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return URI label |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_uri_types**
> List[URITypesDTO] get_uri_types(authorization, body, accept_language=accept_language)

Return all rdf types of an uri

### Example


```python
import openapi_client
from openapi_client.models.uri_types_dto import URITypesDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    body = ['body_example'] # List[str] | URIs to get types from
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Return all rdf types of an uri
        api_response = api_instance.get_uri_types(authorization, body, accept_language=accept_language)
        print("The response of OntologyApi->get_uri_types:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->get_uri_types: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **body** | [**List[str]**](str.md)| URIs to get types from | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[URITypesDTO]**](URITypesDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return URI rdf types |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **rename_uri**
> rename_uri(uri, new_uri, authorization, accept_language=accept_language)

Rename all occurrences of the given URI

**This method should not be used unless you are fully understanding what you are doing, as it may have side-effects for external ontologies. Please note that occurrences of the URI will NOT be changed in the NoSQL database (MongoDB).**

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
    api_instance = openapi_client.OntologyApi(api_client)
    uri = 'uri_example' # str | The URI to rename
    new_uri = 'new_uri_example' # str | The new URI
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Rename all occurrences of the given URI
        api_instance.rename_uri(uri, new_uri, authorization, accept_language=accept_language)
    except Exception as e:
        print("Exception when calling OntologyApi->rename_uri: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uri** | **str**| The URI to rename | 
 **new_uri** | **str**| The new URI | 
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | The URI was successfully renamed |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_sub_classes_of**
> List[ResourceTreeDTO] search_sub_classes_of(parent_type, authorization, name=name, ignore_root_classes=ignore_root_classes, accept_language=accept_language)

Search sub-classes tree of an RDF class

### Example


```python
import openapi_client
from openapi_client.models.resource_tree_dto import ResourceTreeDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    parent_type = 'parent_type_example' # str | Parent RDF class URI
    authorization = 'authorization_example' # str | Authentication token
    name = 'plant_height' # str | Name regex pattern (optional)
    ignore_root_classes = False # bool | Flag to determine if only sub-classes must be include in result (optional) (default to False)
    accept_language = 'en' # str | Request accepted language (optional)

    try:
        # Search sub-classes tree of an RDF class
        api_response = api_instance.search_sub_classes_of(parent_type, authorization, name=name, ignore_root_classes=ignore_root_classes, accept_language=accept_language)
        print("The response of OntologyApi->search_sub_classes_of:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->search_sub_classes_of: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **parent_type** | **str**| Parent RDF class URI | 
 **authorization** | **str**| Authentication token | 
 **name** | **str**| Name regex pattern | [optional] 
 **ignore_root_classes** | **bool**| Flag to determine if only sub-classes must be include in result | [optional] [default to False]
 **accept_language** | **str**| Request accepted language | [optional] 

### Return type

[**List[ResourceTreeDTO]**](ResourceTreeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Return sub-classes tree |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_class_property_restriction**
> str update_class_property_restriction(authorization, accept_language=accept_language, body=body)

Update a rdf type property restriction

### Example


```python
import openapi_client
from openapi_client.models.owl_class_property_restriction_dto import OWLClassPropertyRestrictionDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.OWLClassPropertyRestrictionDTO() # OWLClassPropertyRestrictionDTO | Property description (optional)

    try:
        # Update a rdf type property restriction
        api_response = api_instance.update_class_property_restriction(authorization, accept_language=accept_language, body=body)
        print("The response of OntologyApi->update_class_property_restriction:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->update_class_property_restriction: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**OWLClassPropertyRestrictionDTO**](OWLClassPropertyRestrictionDTO.md)| Property description | [optional] 

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
**200** | Class property restriction updated |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_property**
> str update_property(authorization, accept_language=accept_language, body=body)

Update a RDF property

### Example


```python
import openapi_client
from openapi_client.models.rdf_property_dto import RDFPropertyDTO
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
    api_instance = openapi_client.OntologyApi(api_client)
    authorization = 'authorization_example' # str | Authentication token
    accept_language = 'en' # str | Request accepted language (optional)
    body = openapi_client.RDFPropertyDTO() # RDFPropertyDTO | Property description (optional)

    try:
        # Update a RDF property
        api_response = api_instance.update_property(authorization, accept_language=accept_language, body=body)
        print("The response of OntologyApi->update_property:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling OntologyApi->update_property: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **str**| Authentication token | 
 **accept_language** | **str**| Request accepted language | [optional] 
 **body** | [**RDFPropertyDTO**](RDFPropertyDTO.md)| Property description | [optional] 

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
**200** | Update a RDF property |  -  |
**404** | Property not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

