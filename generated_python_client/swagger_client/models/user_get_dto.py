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


class UserGetDTO(object):
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
        'email': 'str',
        'language': 'str',
        'admin': 'bool',
        'first_name': 'str',
        'last_name': 'str',
        'linked_person': 'str',
        'enable': 'bool',
        'favorites': 'list[str]'
    }

    attribute_map = {
        'uri': 'uri',
        'email': 'email',
        'language': 'language',
        'admin': 'admin',
        'first_name': 'first_name',
        'last_name': 'last_name',
        'linked_person': 'linked_person',
        'enable': 'enable',
        'favorites': 'favorites'
    }

    def __init__(self, uri=None, email=None, language=None, admin=None, first_name=None, last_name=None, linked_person=None, enable=None, favorites=None, _configuration=None):  # noqa: E501
        """UserGetDTO - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._uri = None
        self._email = None
        self._language = None
        self._admin = None
        self._first_name = None
        self._last_name = None
        self._linked_person = None
        self._enable = None
        self._favorites = None
        self.discriminator = None

        if uri is not None:
            self.uri = uri
        if email is not None:
            self.email = email
        if language is not None:
            self.language = language
        if admin is not None:
            self.admin = admin
        if first_name is not None:
            self.first_name = first_name
        if last_name is not None:
            self.last_name = last_name
        if linked_person is not None:
            self.linked_person = linked_person
        if enable is not None:
            self.enable = enable
        if favorites is not None:
            self.favorites = favorites

    @property
    def uri(self):
        """Gets the uri of this UserGetDTO.  # noqa: E501

        User URI  # noqa: E501

        :return: The uri of this UserGetDTO.  # noqa: E501
        :rtype: str
        """
        return self._uri

    @uri.setter
    def uri(self, uri):
        """Sets the uri of this UserGetDTO.

        User URI  # noqa: E501

        :param uri: The uri of this UserGetDTO.  # noqa: E501
        :type: str
        """

        self._uri = uri

    @property
    def email(self):
        """Gets the email of this UserGetDTO.  # noqa: E501

        User email  # noqa: E501

        :return: The email of this UserGetDTO.  # noqa: E501
        :rtype: str
        """
        return self._email

    @email.setter
    def email(self, email):
        """Sets the email of this UserGetDTO.

        User email  # noqa: E501

        :param email: The email of this UserGetDTO.  # noqa: E501
        :type: str
        """

        self._email = email

    @property
    def language(self):
        """Gets the language of this UserGetDTO.  # noqa: E501

        User language  # noqa: E501

        :return: The language of this UserGetDTO.  # noqa: E501
        :rtype: str
        """
        return self._language

    @language.setter
    def language(self, language):
        """Sets the language of this UserGetDTO.

        User language  # noqa: E501

        :param language: The language of this UserGetDTO.  # noqa: E501
        :type: str
        """

        self._language = language

    @property
    def admin(self):
        """Gets the admin of this UserGetDTO.  # noqa: E501

        User admin flag  # noqa: E501

        :return: The admin of this UserGetDTO.  # noqa: E501
        :rtype: bool
        """
        return self._admin

    @admin.setter
    def admin(self, admin):
        """Sets the admin of this UserGetDTO.

        User admin flag  # noqa: E501

        :param admin: The admin of this UserGetDTO.  # noqa: E501
        :type: bool
        """

        self._admin = admin

    @property
    def first_name(self):
        """Gets the first_name of this UserGetDTO.  # noqa: E501

        User first name  # noqa: E501

        :return: The first_name of this UserGetDTO.  # noqa: E501
        :rtype: str
        """
        return self._first_name

    @first_name.setter
    def first_name(self, first_name):
        """Sets the first_name of this UserGetDTO.

        User first name  # noqa: E501

        :param first_name: The first_name of this UserGetDTO.  # noqa: E501
        :type: str
        """

        self._first_name = first_name

    @property
    def last_name(self):
        """Gets the last_name of this UserGetDTO.  # noqa: E501

        User last name  # noqa: E501

        :return: The last_name of this UserGetDTO.  # noqa: E501
        :rtype: str
        """
        return self._last_name

    @last_name.setter
    def last_name(self, last_name):
        """Sets the last_name of this UserGetDTO.

        User last name  # noqa: E501

        :param last_name: The last_name of this UserGetDTO.  # noqa: E501
        :type: str
        """

        self._last_name = last_name

    @property
    def linked_person(self):
        """Gets the linked_person of this UserGetDTO.  # noqa: E501

        URI of the Person linked to this account  # noqa: E501

        :return: The linked_person of this UserGetDTO.  # noqa: E501
        :rtype: str
        """
        return self._linked_person

    @linked_person.setter
    def linked_person(self, linked_person):
        """Sets the linked_person of this UserGetDTO.

        URI of the Person linked to this account  # noqa: E501

        :param linked_person: The linked_person of this UserGetDTO.  # noqa: E501
        :type: str
        """

        self._linked_person = linked_person

    @property
    def enable(self):
        """Gets the enable of this UserGetDTO.  # noqa: E501

        User is enable  # noqa: E501

        :return: The enable of this UserGetDTO.  # noqa: E501
        :rtype: bool
        """
        return self._enable

    @enable.setter
    def enable(self, enable):
        """Sets the enable of this UserGetDTO.

        User is enable  # noqa: E501

        :param enable: The enable of this UserGetDTO.  # noqa: E501
        :type: bool
        """

        self._enable = enable

    @property
    def favorites(self):
        """Gets the favorites of this UserGetDTO.  # noqa: E501

        Favorites URI  # noqa: E501

        :return: The favorites of this UserGetDTO.  # noqa: E501
        :rtype: list[str]
        """
        return self._favorites

    @favorites.setter
    def favorites(self, favorites):
        """Sets the favorites of this UserGetDTO.

        Favorites URI  # noqa: E501

        :param favorites: The favorites of this UserGetDTO.  # noqa: E501
        :type: list[str]
        """

        self._favorites = favorites

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
        if issubclass(UserGetDTO, dict):
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
        if not isinstance(other, UserGetDTO):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, UserGetDTO):
            return True

        return self.to_dict() != other.to_dict()
