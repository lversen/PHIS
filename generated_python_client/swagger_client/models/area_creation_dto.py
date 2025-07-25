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


class AreaCreationDTO(object):
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
        'is_structural_area': 'bool',
        'rdf_type': 'str',
        'name': 'str',
        'description': 'str',
        'geometry': 'GeoJsonObject',
        'event': 'EventCreationDTO'
    }

    attribute_map = {
        'uri': 'uri',
        'is_structural_area': 'is_structural_area',
        'rdf_type': 'rdf_type',
        'name': 'name',
        'description': 'description',
        'geometry': 'geometry',
        'event': 'event'
    }

    def __init__(self, uri=None, is_structural_area=None, rdf_type=None, name=None, description=None, geometry=None, event=None, _configuration=None):  # noqa: E501
        """AreaCreationDTO - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._uri = None
        self._is_structural_area = None
        self._rdf_type = None
        self._name = None
        self._description = None
        self._geometry = None
        self._event = None
        self.discriminator = None

        if uri is not None:
            self.uri = uri
        self.is_structural_area = is_structural_area
        self.rdf_type = rdf_type
        self.name = name
        if description is not None:
            self.description = description
        self.geometry = geometry
        if event is not None:
            self.event = event

    @property
    def uri(self):
        """Gets the uri of this AreaCreationDTO.  # noqa: E501

        Area URI  # noqa: E501

        :return: The uri of this AreaCreationDTO.  # noqa: E501
        :rtype: str
        """
        return self._uri

    @uri.setter
    def uri(self, uri):
        """Sets the uri of this AreaCreationDTO.

        Area URI  # noqa: E501

        :param uri: The uri of this AreaCreationDTO.  # noqa: E501
        :type: str
        """

        self._uri = uri

    @property
    def is_structural_area(self):
        """Gets the is_structural_area of this AreaCreationDTO.  # noqa: E501

        Area type ( true = structural | false = temporal)  # noqa: E501

        :return: The is_structural_area of this AreaCreationDTO.  # noqa: E501
        :rtype: bool
        """
        return self._is_structural_area

    @is_structural_area.setter
    def is_structural_area(self, is_structural_area):
        """Sets the is_structural_area of this AreaCreationDTO.

        Area type ( true = structural | false = temporal)  # noqa: E501

        :param is_structural_area: The is_structural_area of this AreaCreationDTO.  # noqa: E501
        :type: bool
        """
        if self._configuration.client_side_validation and is_structural_area is None:
            raise ValueError("Invalid value for `is_structural_area`, must not be `None`")  # noqa: E501

        self._is_structural_area = is_structural_area

    @property
    def rdf_type(self):
        """Gets the rdf_type of this AreaCreationDTO.  # noqa: E501

        Area rdf_type  # noqa: E501

        :return: The rdf_type of this AreaCreationDTO.  # noqa: E501
        :rtype: str
        """
        return self._rdf_type

    @rdf_type.setter
    def rdf_type(self, rdf_type):
        """Sets the rdf_type of this AreaCreationDTO.

        Area rdf_type  # noqa: E501

        :param rdf_type: The rdf_type of this AreaCreationDTO.  # noqa: E501
        :type: str
        """
        if self._configuration.client_side_validation and rdf_type is None:
            raise ValueError("Invalid value for `rdf_type`, must not be `None`")  # noqa: E501

        self._rdf_type = rdf_type

    @property
    def name(self):
        """Gets the name of this AreaCreationDTO.  # noqa: E501

        Area name  # noqa: E501

        :return: The name of this AreaCreationDTO.  # noqa: E501
        :rtype: str
        """
        return self._name

    @name.setter
    def name(self, name):
        """Sets the name of this AreaCreationDTO.

        Area name  # noqa: E501

        :param name: The name of this AreaCreationDTO.  # noqa: E501
        :type: str
        """
        if self._configuration.client_side_validation and name is None:
            raise ValueError("Invalid value for `name`, must not be `None`")  # noqa: E501

        self._name = name

    @property
    def description(self):
        """Gets the description of this AreaCreationDTO.  # noqa: E501

        Description of the area  # noqa: E501

        :return: The description of this AreaCreationDTO.  # noqa: E501
        :rtype: str
        """
        return self._description

    @description.setter
    def description(self, description):
        """Sets the description of this AreaCreationDTO.

        Description of the area  # noqa: E501

        :param description: The description of this AreaCreationDTO.  # noqa: E501
        :type: str
        """

        self._description = description

    @property
    def geometry(self):
        """Gets the geometry of this AreaCreationDTO.  # noqa: E501

        The geographical coordinates of the area  # noqa: E501

        :return: The geometry of this AreaCreationDTO.  # noqa: E501
        :rtype: GeoJsonObject
        """
        return self._geometry

    @geometry.setter
    def geometry(self, geometry):
        """Sets the geometry of this AreaCreationDTO.

        The geographical coordinates of the area  # noqa: E501

        :param geometry: The geometry of this AreaCreationDTO.  # noqa: E501
        :type: GeoJsonObject
        """
        if self._configuration.client_side_validation and geometry is None:
            raise ValueError("Invalid value for `geometry`, must not be `None`")  # noqa: E501

        self._geometry = geometry

    @property
    def event(self):
        """Gets the event of this AreaCreationDTO.  # noqa: E501

        Event linked to the area  # noqa: E501

        :return: The event of this AreaCreationDTO.  # noqa: E501
        :rtype: EventCreationDTO
        """
        return self._event

    @event.setter
    def event(self, event):
        """Sets the event of this AreaCreationDTO.

        Event linked to the area  # noqa: E501

        :param event: The event of this AreaCreationDTO.  # noqa: E501
        :type: EventCreationDTO
        """

        self._event = event

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
        if issubclass(AreaCreationDTO, dict):
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
        if not isinstance(other, AreaCreationDTO):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, AreaCreationDTO):
            return True

        return self.to_dict() != other.to_dict()
