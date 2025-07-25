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


class BrAPIv1SeasonDTO(object):
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
        'season': 'str',
        'season_db_id': 'str',
        'year': 'str'
    }

    attribute_map = {
        'season': 'season',
        'season_db_id': 'seasonDbId',
        'year': 'year'
    }

    def __init__(self, season=None, season_db_id=None, year=None, _configuration=None):  # noqa: E501
        """BrAPIv1SeasonDTO - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._season = None
        self._season_db_id = None
        self._year = None
        self.discriminator = None

        if season is not None:
            self.season = season
        if season_db_id is not None:
            self.season_db_id = season_db_id
        if year is not None:
            self.year = year

    @property
    def season(self):
        """Gets the season of this BrAPIv1SeasonDTO.  # noqa: E501


        :return: The season of this BrAPIv1SeasonDTO.  # noqa: E501
        :rtype: str
        """
        return self._season

    @season.setter
    def season(self, season):
        """Sets the season of this BrAPIv1SeasonDTO.


        :param season: The season of this BrAPIv1SeasonDTO.  # noqa: E501
        :type: str
        """

        self._season = season

    @property
    def season_db_id(self):
        """Gets the season_db_id of this BrAPIv1SeasonDTO.  # noqa: E501


        :return: The season_db_id of this BrAPIv1SeasonDTO.  # noqa: E501
        :rtype: str
        """
        return self._season_db_id

    @season_db_id.setter
    def season_db_id(self, season_db_id):
        """Sets the season_db_id of this BrAPIv1SeasonDTO.


        :param season_db_id: The season_db_id of this BrAPIv1SeasonDTO.  # noqa: E501
        :type: str
        """

        self._season_db_id = season_db_id

    @property
    def year(self):
        """Gets the year of this BrAPIv1SeasonDTO.  # noqa: E501


        :return: The year of this BrAPIv1SeasonDTO.  # noqa: E501
        :rtype: str
        """
        return self._year

    @year.setter
    def year(self, year):
        """Sets the year of this BrAPIv1SeasonDTO.


        :param year: The year of this BrAPIv1SeasonDTO.  # noqa: E501
        :type: str
        """

        self._year = year

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
        if issubclass(BrAPIv1SeasonDTO, dict):
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
        if not isinstance(other, BrAPIv1SeasonDTO):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, BrAPIv1SeasonDTO):
            return True

        return self.to_dict() != other.to_dict()
