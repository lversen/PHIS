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
from swagger_client.api.faidare_api import FaidareApi  # noqa: E501
from swagger_client.rest import ApiException


class TestFaidareApi(unittest.TestCase):
    """FaidareApi unit test stubs"""

    def setUp(self):
        self.api = swagger_client.api.faidare_api.FaidareApi()  # noqa: E501

    def tearDown(self):
        pass

    def test_get_calls1(self):
        """Test case for get_calls1

        Check the available faidare calls  # noqa: E501
        """
        pass

    def test_get_germplasms_by_search(self):
        """Test case for get_germplasms_by_search

        Submit a search request for germplasm  # noqa: E501
        """
        pass

    def test_get_locations_list(self):
        """Test case for get_locations_list

        Faidarev1CallDTO to retrieve a list of locations available in the system  # noqa: E501
        """
        pass

    def test_get_studies_list(self):
        """Test case for get_studies_list

        Retrieve studies information  # noqa: E501
        """
        pass

    def test_get_trials_list(self):
        """Test case for get_trials_list

        Faidarev1CallDTO to retrieve a list of trials available in the system  # noqa: E501
        """
        pass

    def test_get_variables_list1(self):
        """Test case for get_variables_list1

        Faidarev1CallDTO to retrieve a list of observationVariables available in the system  # noqa: E501
        """
        pass


if __name__ == '__main__':
    unittest.main()
