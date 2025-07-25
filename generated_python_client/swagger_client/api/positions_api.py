# coding: utf-8

"""
    OpenSilex API

    No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)  # noqa: E501

    OpenAPI spec version: 1.4.7
    
    Generated by: https://github.com/swagger-api/swagger-codegen.git
"""


from __future__ import absolute_import

import re  # noqa: F401

# python 2 and python 3 compatibility library
import six

from swagger_client.api_client import ApiClient


class PositionsApi(object):
    """NOTE: This class is auto generated by the swagger code generator program.

    Do not edit the class manually.
    Ref: https://github.com/swagger-api/swagger-codegen
    """

    def __init__(self, api_client=None):
        if api_client is None:
            api_client = ApiClient()
        self.api_client = api_client

    def count_moves(self, authorization, **kwargs):  # noqa: E501
        """Count moves  # noqa: E501

          # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.count_moves(authorization, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str authorization: Authentication token (required)
        :param str target: Target URI
        :param str accept_language: Request accepted language
        :return: int
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.count_moves_with_http_info(authorization, **kwargs)  # noqa: E501
        else:
            (data) = self.count_moves_with_http_info(authorization, **kwargs)  # noqa: E501
            return data

    def count_moves_with_http_info(self, authorization, **kwargs):  # noqa: E501
        """Count moves  # noqa: E501

          # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.count_moves_with_http_info(authorization, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str authorization: Authentication token (required)
        :param str target: Target URI
        :param str accept_language: Request accepted language
        :return: int
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['authorization', 'target', 'accept_language']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method count_moves" % key
                )
            params[key] = val
        del params['kwargs']
        # verify the required parameter 'authorization' is set
        if self.api_client.client_side_validation and ('authorization' not in params or
                                                       params['authorization'] is None):  # noqa: E501
            raise ValueError("Missing the required parameter `authorization` when calling `count_moves`")  # noqa: E501

        collection_formats = {}

        path_params = {}

        query_params = []
        if 'target' in params:
            query_params.append(('target', params['target']))  # noqa: E501

        header_params = {}
        if 'authorization' in params:
            header_params['Authorization'] = params['authorization']  # noqa: E501
        if 'accept_language' in params:
            header_params['Accept-Language'] = params['accept_language']  # noqa: E501

        form_params = []
        local_var_files = {}

        body_params = None
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/json'])  # noqa: E501

        # HTTP header `Content-Type`
        header_params['Content-Type'] = self.api_client.select_header_content_type(  # noqa: E501
            ['application/json'])  # noqa: E501

        # Authentication setting
        auth_settings = []  # noqa: E501

        return self.api_client.call_api(
            '/core/positions/count', 'GET',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='int',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def get_position(self, uri, authorization, **kwargs):  # noqa: E501
        """Get the position of an object  # noqa: E501

          # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.get_position(uri, authorization, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str uri: Object URI (required)
        :param str authorization: Authentication token (required)
        :param str time: Time : match position at the given time
        :param str accept_language: Request accepted language
        :return: PositionGetDTO
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.get_position_with_http_info(uri, authorization, **kwargs)  # noqa: E501
        else:
            (data) = self.get_position_with_http_info(uri, authorization, **kwargs)  # noqa: E501
            return data

    def get_position_with_http_info(self, uri, authorization, **kwargs):  # noqa: E501
        """Get the position of an object  # noqa: E501

          # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.get_position_with_http_info(uri, authorization, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str uri: Object URI (required)
        :param str authorization: Authentication token (required)
        :param str time: Time : match position at the given time
        :param str accept_language: Request accepted language
        :return: PositionGetDTO
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['uri', 'authorization', 'time', 'accept_language']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method get_position" % key
                )
            params[key] = val
        del params['kwargs']
        # verify the required parameter 'uri' is set
        if self.api_client.client_side_validation and ('uri' not in params or
                                                       params['uri'] is None):  # noqa: E501
            raise ValueError("Missing the required parameter `uri` when calling `get_position`")  # noqa: E501
        # verify the required parameter 'authorization' is set
        if self.api_client.client_side_validation and ('authorization' not in params or
                                                       params['authorization'] is None):  # noqa: E501
            raise ValueError("Missing the required parameter `authorization` when calling `get_position`")  # noqa: E501

        collection_formats = {}

        path_params = {}
        if 'uri' in params:
            path_params['uri'] = params['uri']  # noqa: E501

        query_params = []
        if 'time' in params:
            query_params.append(('time', params['time']))  # noqa: E501

        header_params = {}
        if 'authorization' in params:
            header_params['Authorization'] = params['authorization']  # noqa: E501
        if 'accept_language' in params:
            header_params['Accept-Language'] = params['accept_language']  # noqa: E501

        form_params = []
        local_var_files = {}

        body_params = None
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/json'])  # noqa: E501

        # HTTP header `Content-Type`
        header_params['Content-Type'] = self.api_client.select_header_content_type(  # noqa: E501
            ['application/json'])  # noqa: E501

        # Authentication setting
        auth_settings = []  # noqa: E501

        return self.api_client.call_api(
            '/core/positions/{uri}', 'GET',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='PositionGetDTO',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def search_geospatialized_position(self, body, authorization, **kwargs):  # noqa: E501
        """Search the last geospatialized position of a target for an experiment  # noqa: E501

          # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.search_geospatialized_position(body, authorization, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param GeoJsonObject body: geometry GeoJSON (required)
        :param str authorization: Authentication token (required)
        :param str base_type: target RDF Type URI
        :param str start_date_time: Start date : match position affected after the given start date
        :param str end_date_time: End date : match position affected before the given end date
        :param int page: Page number
        :param int page_size: Page size
        :param str accept_language: Request accepted language
        :return: list[PositionGetDTO]
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.search_geospatialized_position_with_http_info(body, authorization, **kwargs)  # noqa: E501
        else:
            (data) = self.search_geospatialized_position_with_http_info(body, authorization, **kwargs)  # noqa: E501
            return data

    def search_geospatialized_position_with_http_info(self, body, authorization, **kwargs):  # noqa: E501
        """Search the last geospatialized position of a target for an experiment  # noqa: E501

          # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.search_geospatialized_position_with_http_info(body, authorization, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param GeoJsonObject body: geometry GeoJSON (required)
        :param str authorization: Authentication token (required)
        :param str base_type: target RDF Type URI
        :param str start_date_time: Start date : match position affected after the given start date
        :param str end_date_time: End date : match position affected before the given end date
        :param int page: Page number
        :param int page_size: Page size
        :param str accept_language: Request accepted language
        :return: list[PositionGetDTO]
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['body', 'authorization', 'base_type', 'start_date_time', 'end_date_time', 'page', 'page_size', 'accept_language']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method search_geospatialized_position" % key
                )
            params[key] = val
        del params['kwargs']
        # verify the required parameter 'body' is set
        if self.api_client.client_side_validation and ('body' not in params or
                                                       params['body'] is None):  # noqa: E501
            raise ValueError("Missing the required parameter `body` when calling `search_geospatialized_position`")  # noqa: E501
        # verify the required parameter 'authorization' is set
        if self.api_client.client_side_validation and ('authorization' not in params or
                                                       params['authorization'] is None):  # noqa: E501
            raise ValueError("Missing the required parameter `authorization` when calling `search_geospatialized_position`")  # noqa: E501

        if self.api_client.client_side_validation and ('page' in params and params['page'] < 0):  # noqa: E501
            raise ValueError("Invalid value for parameter `page` when calling `search_geospatialized_position`, must be a value greater than or equal to `0`")  # noqa: E501
        if self.api_client.client_side_validation and ('page_size' in params and params['page_size'] > 1000):  # noqa: E501
            raise ValueError("Invalid value for parameter `page_size` when calling `search_geospatialized_position`, must be a value less than or equal to `1000`")  # noqa: E501
        if self.api_client.client_side_validation and ('page_size' in params and params['page_size'] < 0):  # noqa: E501
            raise ValueError("Invalid value for parameter `page_size` when calling `search_geospatialized_position`, must be a value greater than or equal to `0`")  # noqa: E501
        collection_formats = {}

        path_params = {}

        query_params = []
        if 'base_type' in params:
            query_params.append(('base_type', params['base_type']))  # noqa: E501
        if 'start_date_time' in params:
            query_params.append(('startDateTime', params['start_date_time']))  # noqa: E501
        if 'end_date_time' in params:
            query_params.append(('endDateTime', params['end_date_time']))  # noqa: E501
        if 'page' in params:
            query_params.append(('page', params['page']))  # noqa: E501
        if 'page_size' in params:
            query_params.append(('page_size', params['page_size']))  # noqa: E501

        header_params = {}
        if 'authorization' in params:
            header_params['Authorization'] = params['authorization']  # noqa: E501
        if 'accept_language' in params:
            header_params['Accept-Language'] = params['accept_language']  # noqa: E501

        form_params = []
        local_var_files = {}

        body_params = None
        if 'body' in params:
            body_params = params['body']
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/json'])  # noqa: E501

        # HTTP header `Content-Type`
        header_params['Content-Type'] = self.api_client.select_header_content_type(  # noqa: E501
            ['application/json'])  # noqa: E501

        # Authentication setting
        auth_settings = []  # noqa: E501

        return self.api_client.call_api(
            '/core/positions/geospatializedPosition', 'POST',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='list[PositionGetDTO]',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def search_position_history(self, target, authorization, **kwargs):  # noqa: E501
        """Search history of position of an object  # noqa: E501

          # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.search_position_history(target, authorization, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str target: Target URI (required)
        :param str authorization: Authentication token (required)
        :param str start_date_time: Start date : match position affected after the given start date
        :param str end_date_time: End date : match position affected before the given end date
        :param list[str] order_by: List of fields to sort as an array of fieldName=asc|desc
        :param int page: Page number
        :param int page_size: Page size
        :param str accept_language: Request accepted language
        :return: list[PositionGetDTO]
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.search_position_history_with_http_info(target, authorization, **kwargs)  # noqa: E501
        else:
            (data) = self.search_position_history_with_http_info(target, authorization, **kwargs)  # noqa: E501
            return data

    def search_position_history_with_http_info(self, target, authorization, **kwargs):  # noqa: E501
        """Search history of position of an object  # noqa: E501

          # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.search_position_history_with_http_info(target, authorization, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str target: Target URI (required)
        :param str authorization: Authentication token (required)
        :param str start_date_time: Start date : match position affected after the given start date
        :param str end_date_time: End date : match position affected before the given end date
        :param list[str] order_by: List of fields to sort as an array of fieldName=asc|desc
        :param int page: Page number
        :param int page_size: Page size
        :param str accept_language: Request accepted language
        :return: list[PositionGetDTO]
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['target', 'authorization', 'start_date_time', 'end_date_time', 'order_by', 'page', 'page_size', 'accept_language']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method search_position_history" % key
                )
            params[key] = val
        del params['kwargs']
        # verify the required parameter 'target' is set
        if self.api_client.client_side_validation and ('target' not in params or
                                                       params['target'] is None):  # noqa: E501
            raise ValueError("Missing the required parameter `target` when calling `search_position_history`")  # noqa: E501
        # verify the required parameter 'authorization' is set
        if self.api_client.client_side_validation and ('authorization' not in params or
                                                       params['authorization'] is None):  # noqa: E501
            raise ValueError("Missing the required parameter `authorization` when calling `search_position_history`")  # noqa: E501

        collection_formats = {}

        path_params = {}

        query_params = []
        if 'target' in params:
            query_params.append(('target', params['target']))  # noqa: E501
        if 'start_date_time' in params:
            query_params.append(('startDateTime', params['start_date_time']))  # noqa: E501
        if 'end_date_time' in params:
            query_params.append(('endDateTime', params['end_date_time']))  # noqa: E501
        if 'order_by' in params:
            query_params.append(('order_by', params['order_by']))  # noqa: E501
            collection_formats['order_by'] = 'multi'  # noqa: E501
        if 'page' in params:
            query_params.append(('page', params['page']))  # noqa: E501
        if 'page_size' in params:
            query_params.append(('page_size', params['page_size']))  # noqa: E501

        header_params = {}
        if 'authorization' in params:
            header_params['Authorization'] = params['authorization']  # noqa: E501
        if 'accept_language' in params:
            header_params['Accept-Language'] = params['accept_language']  # noqa: E501

        form_params = []
        local_var_files = {}

        body_params = None
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/json'])  # noqa: E501

        # HTTP header `Content-Type`
        header_params['Content-Type'] = self.api_client.select_header_content_type(  # noqa: E501
            ['application/json'])  # noqa: E501

        # Authentication setting
        auth_settings = []  # noqa: E501

        return self.api_client.call_api(
            '/core/positions/history', 'GET',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='list[PositionGetDTO]',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)
