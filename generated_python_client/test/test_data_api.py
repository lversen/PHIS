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
from swagger_client.api.data_api import DataApi  # noqa: E501
from swagger_client.rest import ApiException


class TestDataApi(unittest.TestCase):
    """DataApi unit test stubs"""

    def setUp(self):
        self.api = swagger_client.api.data_api.DataApi()  # noqa: E501

    def tearDown(self):
        pass

    def test_add_list_data(self):
        """Test case for add_list_data

        Add data  # noqa: E501
        """
        pass

    def test_count_data(self):
        """Test case for count_data

        Count data  # noqa: E501
        """
        pass

    def test_count_datafiles(self):
        """Test case for count_datafiles

        Count datafiles  # noqa: E501
        """
        pass

    def test_create_provenance(self):
        """Test case for create_provenance

        Add a provenance  # noqa: E501
        """
        pass

    def test_delete_data(self):
        """Test case for delete_data

        Delete data  # noqa: E501
        """
        pass

    def test_delete_data_on_search(self):
        """Test case for delete_data_on_search

        Delete data on criteria  # noqa: E501
        """
        pass

    def test_delete_provenance(self):
        """Test case for delete_provenance

        Delete a provenance that doesn't describe data  # noqa: E501
        """
        pass

    def test_export_data(self):
        """Test case for export_data

        Export data  # noqa: E501
        """
        pass

    def test_export_data1(self):
        """Test case for export_data1

        Export data  # noqa: E501
        """
        pass

    def test_get_data(self):
        """Test case for get_data

        Get data  # noqa: E501
        """
        pass

    def test_get_data_file(self):
        """Test case for get_data_file

        Get a data file  # noqa: E501
        """
        pass

    def test_get_data_file_description(self):
        """Test case for get_data_file_description

        Get a data file description  # noqa: E501
        """
        pass

    def test_get_data_file_descriptions_by_search(self):
        """Test case for get_data_file_descriptions_by_search

        Search data files  # noqa: E501
        """
        pass

    def test_get_data_file_descriptions_by_targets(self):
        """Test case for get_data_file_descriptions_by_targets

        Search data files for a large list of targets   # noqa: E501
        """
        pass

    def test_get_data_list_by_targets(self):
        """Test case for get_data_list_by_targets

        Search data for a large list of targets  # noqa: E501
        """
        pass

    def test_get_data_series_by_facility(self):
        """Test case for get_data_series_by_facility

        Get all data series associated with a facility  # noqa: E501
        """
        pass

    def test_get_datafiles_provenances(self):
        """Test case for get_datafiles_provenances

        Search provenances linked to datafiles  # noqa: E501
        """
        pass

    def test_get_datafiles_provenances_by_targets(self):
        """Test case for get_datafiles_provenances_by_targets

        Search provenances linked to datafiles for a large list of targets  # noqa: E501
        """
        pass

    def test_get_mathematical_operators(self):
        """Test case for get_mathematical_operators

        Get mathematical operators  # noqa: E501
        """
        pass

    def test_get_pictures_thumbnails(self):
        """Test case for get_pictures_thumbnails

        Get a picture thumbnail  # noqa: E501
        """
        pass

    def test_get_provenance(self):
        """Test case for get_provenance

        Get a provenance  # noqa: E501
        """
        pass

    def test_get_provenances_by_uris(self):
        """Test case for get_provenances_by_uris

        Get a list of provenances by their URIs  # noqa: E501
        """
        pass

    def test_get_used_provenances(self):
        """Test case for get_used_provenances

        Search provenances linked to data  # noqa: E501
        """
        pass

    def test_get_used_provenances_by_targets(self):
        """Test case for get_used_provenances_by_targets

        Search provenances linked to data for a large list of targets  # noqa: E501
        """
        pass

    def test_get_used_variables(self):
        """Test case for get_used_variables

        Get variables linked to data  # noqa: E501
        """
        pass

    def test_import_csv_data(self):
        """Test case for import_csv_data

        Import a CSV file for the given provenanceURI  # noqa: E501
        """
        pass

    def test_post_data_file(self):
        """Test case for post_data_file

        Add a data file  # noqa: E501
        """
        pass

    def test_post_data_file_paths(self):
        """Test case for post_data_file_paths

        Describe datafiles and give their relative paths in the configured storage system. In the case of already stored datafiles.  # noqa: E501
        """
        pass

    def test_search_data_list(self):
        """Test case for search_data_list

        Search data  # noqa: E501
        """
        pass

    def test_search_data_list_by_targets(self):
        """Test case for search_data_list_by_targets

        Search data for a large list of targets  # noqa: E501
        """
        pass

    def test_search_provenance(self):
        """Test case for search_provenance

        Get provenances  # noqa: E501
        """
        pass

    def test_update(self):
        """Test case for update

        Update data  # noqa: E501
        """
        pass

    def test_update_confidence(self):
        """Test case for update_confidence

        Update confidence index  # noqa: E501
        """
        pass

    def test_update_provenance(self):
        """Test case for update_provenance

        Update a provenance  # noqa: E501
        """
        pass

    def test_validate_csv(self):
        """Test case for validate_csv

        Import a CSV file for the given provenanceURI.  # noqa: E501
        """
        pass


if __name__ == '__main__':
    unittest.main()
