# coding: utf-8

"""
    OpenSilex API

    No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)  # noqa: E501

    OpenAPI spec version: 1.4.7
    
    Generated by: https://github.com/swagger-api/swagger-codegen.git
"""


import pprint
import re  # noqa: F401

import six

from swagger_client.configuration import Configuration


class MetadataDTO(object):
    """NOTE: This class is auto generated by the swagger code generator program.

    Do not edit the class manually.
    """

    """
    Attributes:
      swagger_types (dict): The key is attribute name
                            and the value is attribute type.
      attribute_map (dict): The key is attribute name
                            and the value is json key in definition.
    """
    swagger_types = {
        'pagination': 'PaginationDTO',
        'status': 'list[StatusDTO]',
        'datafiles': 'list[str]'
    }

    attribute_map = {
        'pagination': 'pagination',
        'status': 'status',
        'datafiles': 'datafiles'
    }

    def __init__(self, pagination=None, status=None, datafiles=None, _configuration=None):  # noqa: E501
        """MetadataDTO - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._pagination = None
        self._status = None
        self._datafiles = None
        self.discriminator = None

        if pagination is not None:
            self.pagination = pagination
        if status is not None:
            self.status = status
        if datafiles is not None:
            self.datafiles = datafiles

    @property
    def pagination(self):
        """Gets the pagination of this MetadataDTO.  # noqa: E501


        :return: The pagination of this MetadataDTO.  # noqa: E501
        :rtype: PaginationDTO
        """
        return self._pagination

    @pagination.setter
    def pagination(self, pagination):
        """Sets the pagination of this MetadataDTO.


        :param pagination: The pagination of this MetadataDTO.  # noqa: E501
        :type: PaginationDTO
        """

        self._pagination = pagination

    @property
    def status(self):
        """Gets the status of this MetadataDTO.  # noqa: E501


        :return: The status of this MetadataDTO.  # noqa: E501
        :rtype: list[StatusDTO]
        """
        return self._status

    @status.setter
    def status(self, status):
        """Sets the status of this MetadataDTO.


        :param status: The status of this MetadataDTO.  # noqa: E501
        :type: list[StatusDTO]
        """

        self._status = status

    @property
    def datafiles(self):
        """Gets the datafiles of this MetadataDTO.  # noqa: E501


        :return: The datafiles of this MetadataDTO.  # noqa: E501
        :rtype: list[str]
        """
        return self._datafiles

    @datafiles.setter
    def datafiles(self, datafiles):
        """Sets the datafiles of this MetadataDTO.


        :param datafiles: The datafiles of this MetadataDTO.  # noqa: E501
        :type: list[str]
        """

        self._datafiles = datafiles

    def to_dict(self):
        """Returns the model properties as a dict"""
        result = {}

        for attr, _ in six.iteritems(self.swagger_types):
            value = getattr(self, attr)
            if isinstance(value, list):
                result[attr] = list(map(
                    lambda x: x.to_dict() if hasattr(x, "to_dict") else x,
                    value
                ))
            elif hasattr(value, "to_dict"):
                result[attr] = value.to_dict()
            elif isinstance(value, dict):
                result[attr] = dict(map(
                    lambda item: (item[0], item[1].to_dict())
                    if hasattr(item[1], "to_dict") else item,
                    value.items()
                ))
            else:
                result[attr] = value
        if issubclass(MetadataDTO, dict):
            for key, value in self.items():
                result[key] = value

        return result

    def to_str(self):
        """Returns the string representation of the model"""
        return pprint.pformat(self.to_dict())

    def __repr__(self):
        """For `print` and `pprint`"""
        return self.to_str()

    def __eq__(self, other):
        """Returns true if both objects are equal"""
        if not isinstance(other, MetadataDTO):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, MetadataDTO):
            return True

        return self.to_dict() != other.to_dict()
