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


class MethodDetailsDTO(object):
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
        'uri': 'str',
        'name': 'str',
        'description': 'str',
        'publisher': 'UserGetDTO',
        'publication_date': 'datetime',
        'last_updated_date': 'datetime',
        'exact_match': 'list[str]',
        'close_match': 'list[str]',
        'broad_match': 'list[str]',
        'narrow_match': 'list[str]',
        'from_shared_resource_instance': 'SharedResourceInstanceDTO'
    }

    attribute_map = {
        'uri': 'uri',
        'name': 'name',
        'description': 'description',
        'publisher': 'publisher',
        'publication_date': 'publication_date',
        'last_updated_date': 'last_updated_date',
        'exact_match': 'exact_match',
        'close_match': 'close_match',
        'broad_match': 'broad_match',
        'narrow_match': 'narrow_match',
        'from_shared_resource_instance': 'from_shared_resource_instance'
    }

    def __init__(self, uri=None, name=None, description=None, publisher=None, publication_date=None, last_updated_date=None, exact_match=None, close_match=None, broad_match=None, narrow_match=None, from_shared_resource_instance=None, _configuration=None):  # noqa: E501
        """MethodDetailsDTO - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._uri = None
        self._name = None
        self._description = None
        self._publisher = None
        self._publication_date = None
        self._last_updated_date = None
        self._exact_match = None
        self._close_match = None
        self._broad_match = None
        self._narrow_match = None
        self._from_shared_resource_instance = None
        self.discriminator = None

        if uri is not None:
            self.uri = uri
        if name is not None:
            self.name = name
        if description is not None:
            self.description = description
        if publisher is not None:
            self.publisher = publisher
        if publication_date is not None:
            self.publication_date = publication_date
        if last_updated_date is not None:
            self.last_updated_date = last_updated_date
        if exact_match is not None:
            self.exact_match = exact_match
        if close_match is not None:
            self.close_match = close_match
        if broad_match is not None:
            self.broad_match = broad_match
        if narrow_match is not None:
            self.narrow_match = narrow_match
        if from_shared_resource_instance is not None:
            self.from_shared_resource_instance = from_shared_resource_instance

    @property
    def uri(self):
        """Gets the uri of this MethodDetailsDTO.  # noqa: E501


        :return: The uri of this MethodDetailsDTO.  # noqa: E501
        :rtype: str
        """
        return self._uri

    @uri.setter
    def uri(self, uri):
        """Sets the uri of this MethodDetailsDTO.


        :param uri: The uri of this MethodDetailsDTO.  # noqa: E501
        :type: str
        """

        self._uri = uri

    @property
    def name(self):
        """Gets the name of this MethodDetailsDTO.  # noqa: E501


        :return: The name of this MethodDetailsDTO.  # noqa: E501
        :rtype: str
        """
        return self._name

    @name.setter
    def name(self, name):
        """Sets the name of this MethodDetailsDTO.


        :param name: The name of this MethodDetailsDTO.  # noqa: E501
        :type: str
        """

        self._name = name

    @property
    def description(self):
        """Gets the description of this MethodDetailsDTO.  # noqa: E501


        :return: The description of this MethodDetailsDTO.  # noqa: E501
        :rtype: str
        """
        return self._description

    @description.setter
    def description(self, description):
        """Sets the description of this MethodDetailsDTO.


        :param description: The description of this MethodDetailsDTO.  # noqa: E501
        :type: str
        """

        self._description = description

    @property
    def publisher(self):
        """Gets the publisher of this MethodDetailsDTO.  # noqa: E501


        :return: The publisher of this MethodDetailsDTO.  # noqa: E501
        :rtype: UserGetDTO
        """
        return self._publisher

    @publisher.setter
    def publisher(self, publisher):
        """Sets the publisher of this MethodDetailsDTO.


        :param publisher: The publisher of this MethodDetailsDTO.  # noqa: E501
        :type: UserGetDTO
        """

        self._publisher = publisher

    @property
    def publication_date(self):
        """Gets the publication_date of this MethodDetailsDTO.  # noqa: E501


        :return: The publication_date of this MethodDetailsDTO.  # noqa: E501
        :rtype: datetime
        """
        return self._publication_date

    @publication_date.setter
    def publication_date(self, publication_date):
        """Sets the publication_date of this MethodDetailsDTO.


        :param publication_date: The publication_date of this MethodDetailsDTO.  # noqa: E501
        :type: datetime
        """

        self._publication_date = publication_date

    @property
    def last_updated_date(self):
        """Gets the last_updated_date of this MethodDetailsDTO.  # noqa: E501


        :return: The last_updated_date of this MethodDetailsDTO.  # noqa: E501
        :rtype: datetime
        """
        return self._last_updated_date

    @last_updated_date.setter
    def last_updated_date(self, last_updated_date):
        """Sets the last_updated_date of this MethodDetailsDTO.


        :param last_updated_date: The last_updated_date of this MethodDetailsDTO.  # noqa: E501
        :type: datetime
        """

        self._last_updated_date = last_updated_date

    @property
    def exact_match(self):
        """Gets the exact_match of this MethodDetailsDTO.  # noqa: E501


        :return: The exact_match of this MethodDetailsDTO.  # noqa: E501
        :rtype: list[str]
        """
        return self._exact_match

    @exact_match.setter
    def exact_match(self, exact_match):
        """Sets the exact_match of this MethodDetailsDTO.


        :param exact_match: The exact_match of this MethodDetailsDTO.  # noqa: E501
        :type: list[str]
        """

        self._exact_match = exact_match

    @property
    def close_match(self):
        """Gets the close_match of this MethodDetailsDTO.  # noqa: E501


        :return: The close_match of this MethodDetailsDTO.  # noqa: E501
        :rtype: list[str]
        """
        return self._close_match

    @close_match.setter
    def close_match(self, close_match):
        """Sets the close_match of this MethodDetailsDTO.


        :param close_match: The close_match of this MethodDetailsDTO.  # noqa: E501
        :type: list[str]
        """

        self._close_match = close_match

    @property
    def broad_match(self):
        """Gets the broad_match of this MethodDetailsDTO.  # noqa: E501


        :return: The broad_match of this MethodDetailsDTO.  # noqa: E501
        :rtype: list[str]
        """
        return self._broad_match

    @broad_match.setter
    def broad_match(self, broad_match):
        """Sets the broad_match of this MethodDetailsDTO.


        :param broad_match: The broad_match of this MethodDetailsDTO.  # noqa: E501
        :type: list[str]
        """

        self._broad_match = broad_match

    @property
    def narrow_match(self):
        """Gets the narrow_match of this MethodDetailsDTO.  # noqa: E501


        :return: The narrow_match of this MethodDetailsDTO.  # noqa: E501
        :rtype: list[str]
        """
        return self._narrow_match

    @narrow_match.setter
    def narrow_match(self, narrow_match):
        """Sets the narrow_match of this MethodDetailsDTO.


        :param narrow_match: The narrow_match of this MethodDetailsDTO.  # noqa: E501
        :type: list[str]
        """

        self._narrow_match = narrow_match

    @property
    def from_shared_resource_instance(self):
        """Gets the from_shared_resource_instance of this MethodDetailsDTO.  # noqa: E501


        :return: The from_shared_resource_instance of this MethodDetailsDTO.  # noqa: E501
        :rtype: SharedResourceInstanceDTO
        """
        return self._from_shared_resource_instance

    @from_shared_resource_instance.setter
    def from_shared_resource_instance(self, from_shared_resource_instance):
        """Sets the from_shared_resource_instance of this MethodDetailsDTO.


        :param from_shared_resource_instance: The from_shared_resource_instance of this MethodDetailsDTO.  # noqa: E501
        :type: SharedResourceInstanceDTO
        """

        self._from_shared_resource_instance = from_shared_resource_instance

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
        if issubclass(MethodDetailsDTO, dict):
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
        if not isinstance(other, MethodDetailsDTO):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, MethodDetailsDTO):
            return True

        return self.to_dict() != other.to_dict()
