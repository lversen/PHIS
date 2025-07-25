# coding: utf-8

"""
    OpenSilex API

    No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)  # noqa: E501

    OpenAPI spec version: 1.4.7
    
    Generated by: https://github.com/swagger-api/swagger-codegen.git
"""


from __future__ import absolute_import

import unittest

import swagger_client
from swagger_client.api.staple_api_api import StapleAPIApi  # noqa: E501
from swagger_client.rest import ApiException


class TestStapleAPIApi(unittest.TestCase):
    """StapleAPIApi unit test stubs"""

    def setUp(self):
        self.api = swagger_client.api.staple_api_api.StapleAPIApi()  # noqa: E501

    def tearDown(self):
        pass

    def test_export_ontology_file(self):
        """Test case for export_ontology_file

        Export ontology file for Staple API as turtle syntax  # noqa: E501
        """
        pass

    def test_get_resource_graphs(self):
        """Test case for get_resource_graphs

        Get all graphs associated with resources  # noqa: E501
        """
        pass


if __name__ == '__main__':
    unittest.main()
