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


class RouteDTO(object):
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
        'path': 'str',
        'component': 'str',
        'credentials': 'list[str]',
        'icon': 'str',
        'title': 'str',
        'description': 'str',
        'rdf_type': 'str'
    }

    attribute_map = {
        'path': 'path',
        'component': 'component',
        'credentials': 'credentials',
        'icon': 'icon',
        'title': 'title',
        'description': 'description',
        'rdf_type': 'rdfType'
    }

    def __init__(self, path=None, component=None, credentials=None, icon=None, title=None, description=None, rdf_type=None, _configuration=None):  # noqa: E501
        """RouteDTO - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._path = None
        self._component = None
        self._credentials = None
        self._icon = None
        self._title = None
        self._description = None
        self._rdf_type = None
        self.discriminator = None

        self.path = path
        self.component = component
        if credentials is not None:
            self.credentials = credentials
        if icon is not None:
            self.icon = icon
        if title is not None:
            self.title = title
        if description is not None:
            self.description = description
        if rdf_type is not None:
            self.rdf_type = rdf_type

    @property
    def path(self):
        """Gets the path of this RouteDTO.  # noqa: E501

        Route path  # noqa: E501

        :return: The path of this RouteDTO.  # noqa: E501
        :rtype: str
        """
        return self._path

    @path.setter
    def path(self, path):
        """Sets the path of this RouteDTO.

        Route path  # noqa: E501

        :param path: The path of this RouteDTO.  # noqa: E501
        :type: str
        """
        if self._configuration.client_side_validation and path is None:
            raise ValueError("Invalid value for `path`, must not be `None`")  # noqa: E501

        self._path = path

    @property
    def component(self):
        """Gets the component of this RouteDTO.  # noqa: E501

        Route component  # noqa: E501

        :return: The component of this RouteDTO.  # noqa: E501
        :rtype: str
        """
        return self._component

    @component.setter
    def component(self, component):
        """Sets the component of this RouteDTO.

        Route component  # noqa: E501

        :param component: The component of this RouteDTO.  # noqa: E501
        :type: str
        """
        if self._configuration.client_side_validation and component is None:
            raise ValueError("Invalid value for `component`, must not be `None`")  # noqa: E501

        self._component = component

    @property
    def credentials(self):
        """Gets the credentials of this RouteDTO.  # noqa: E501

        Required credentials list for this route  # noqa: E501

        :return: The credentials of this RouteDTO.  # noqa: E501
        :rtype: list[str]
        """
        return self._credentials

    @credentials.setter
    def credentials(self, credentials):
        """Sets the credentials of this RouteDTO.

        Required credentials list for this route  # noqa: E501

        :param credentials: The credentials of this RouteDTO.  # noqa: E501
        :type: list[str]
        """

        self._credentials = credentials

    @property
    def icon(self):
        """Gets the icon of this RouteDTO.  # noqa: E501

        Route icon  # noqa: E501

        :return: The icon of this RouteDTO.  # noqa: E501
        :rtype: str
        """
        return self._icon

    @icon.setter
    def icon(self, icon):
        """Sets the icon of this RouteDTO.

        Route icon  # noqa: E501

        :param icon: The icon of this RouteDTO.  # noqa: E501
        :type: str
        """

        self._icon = icon

    @property
    def title(self):
        """Gets the title of this RouteDTO.  # noqa: E501

        Route title  # noqa: E501

        :return: The title of this RouteDTO.  # noqa: E501
        :rtype: str
        """
        return self._title

    @title.setter
    def title(self, title):
        """Sets the title of this RouteDTO.

        Route title  # noqa: E501

        :param title: The title of this RouteDTO.  # noqa: E501
        :type: str
        """

        self._title = title

    @property
    def description(self):
        """Gets the description of this RouteDTO.  # noqa: E501

        Route description  # noqa: E501

        :return: The description of this RouteDTO.  # noqa: E501
        :rtype: str
        """
        return self._description

    @description.setter
    def description(self, description):
        """Sets the description of this RouteDTO.

        Route description  # noqa: E501

        :param description: The description of this RouteDTO.  # noqa: E501
        :type: str
        """

        self._description = description

    @property
    def rdf_type(self):
        """Gets the rdf_type of this RouteDTO.  # noqa: E501

        Route rdf type  # noqa: E501

        :return: The rdf_type of this RouteDTO.  # noqa: E501
        :rtype: str
        """
        return self._rdf_type

    @rdf_type.setter
    def rdf_type(self, rdf_type):
        """Sets the rdf_type of this RouteDTO.

        Route rdf type  # noqa: E501

        :param rdf_type: The rdf_type of this RouteDTO.  # noqa: E501
        :type: str
        """

        self._rdf_type = rdf_type

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
        if issubclass(RouteDTO, dict):
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
        if not isinstance(other, RouteDTO):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, RouteDTO):
            return True

        return self.to_dict() != other.to_dict()
