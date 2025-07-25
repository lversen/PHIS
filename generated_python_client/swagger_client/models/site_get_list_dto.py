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


class SiteGetListDTO(object):
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
        'address': 'SiteAddressDTO',
        'description': 'str',
        'organizations': 'list[str]',
        'facilities': 'list[NamedResourceDTO]',
        'rdf_type': 'str',
        'rdf_type_name': 'str',
        'publication_date': 'datetime',
        'last_updated_date': 'datetime'
    }

    attribute_map = {
        'uri': 'uri',
        'name': 'name',
        'address': 'address',
        'description': 'description',
        'organizations': 'organizations',
        'facilities': 'facilities',
        'rdf_type': 'rdf_type',
        'rdf_type_name': 'rdf_type_name',
        'publication_date': 'publication_date',
        'last_updated_date': 'last_updated_date'
    }

    def __init__(self, uri=None, name=None, address=None, description=None, organizations=None, facilities=None, rdf_type=None, rdf_type_name=None, publication_date=None, last_updated_date=None, _configuration=None):  # noqa: E501
        """SiteGetListDTO - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._uri = None
        self._name = None
        self._address = None
        self._description = None
        self._organizations = None
        self._facilities = None
        self._rdf_type = None
        self._rdf_type_name = None
        self._publication_date = None
        self._last_updated_date = None
        self.discriminator = None

        if uri is not None:
            self.uri = uri
        if name is not None:
            self.name = name
        if address is not None:
            self.address = address
        if description is not None:
            self.description = description
        if organizations is not None:
            self.organizations = organizations
        if facilities is not None:
            self.facilities = facilities
        if rdf_type is not None:
            self.rdf_type = rdf_type
        if rdf_type_name is not None:
            self.rdf_type_name = rdf_type_name
        if publication_date is not None:
            self.publication_date = publication_date
        if last_updated_date is not None:
            self.last_updated_date = last_updated_date

    @property
    def uri(self):
        """Gets the uri of this SiteGetListDTO.  # noqa: E501


        :return: The uri of this SiteGetListDTO.  # noqa: E501
        :rtype: str
        """
        return self._uri

    @uri.setter
    def uri(self, uri):
        """Sets the uri of this SiteGetListDTO.


        :param uri: The uri of this SiteGetListDTO.  # noqa: E501
        :type: str
        """

        self._uri = uri

    @property
    def name(self):
        """Gets the name of this SiteGetListDTO.  # noqa: E501


        :return: The name of this SiteGetListDTO.  # noqa: E501
        :rtype: str
        """
        return self._name

    @name.setter
    def name(self, name):
        """Sets the name of this SiteGetListDTO.


        :param name: The name of this SiteGetListDTO.  # noqa: E501
        :type: str
        """

        self._name = name

    @property
    def address(self):
        """Gets the address of this SiteGetListDTO.  # noqa: E501


        :return: The address of this SiteGetListDTO.  # noqa: E501
        :rtype: SiteAddressDTO
        """
        return self._address

    @address.setter
    def address(self, address):
        """Sets the address of this SiteGetListDTO.


        :param address: The address of this SiteGetListDTO.  # noqa: E501
        :type: SiteAddressDTO
        """

        self._address = address

    @property
    def description(self):
        """Gets the description of this SiteGetListDTO.  # noqa: E501


        :return: The description of this SiteGetListDTO.  # noqa: E501
        :rtype: str
        """
        return self._description

    @description.setter
    def description(self, description):
        """Sets the description of this SiteGetListDTO.


        :param description: The description of this SiteGetListDTO.  # noqa: E501
        :type: str
        """

        self._description = description

    @property
    def organizations(self):
        """Gets the organizations of this SiteGetListDTO.  # noqa: E501


        :return: The organizations of this SiteGetListDTO.  # noqa: E501
        :rtype: list[str]
        """
        return self._organizations

    @organizations.setter
    def organizations(self, organizations):
        """Sets the organizations of this SiteGetListDTO.


        :param organizations: The organizations of this SiteGetListDTO.  # noqa: E501
        :type: list[str]
        """

        self._organizations = organizations

    @property
    def facilities(self):
        """Gets the facilities of this SiteGetListDTO.  # noqa: E501


        :return: The facilities of this SiteGetListDTO.  # noqa: E501
        :rtype: list[NamedResourceDTO]
        """
        return self._facilities

    @facilities.setter
    def facilities(self, facilities):
        """Sets the facilities of this SiteGetListDTO.


        :param facilities: The facilities of this SiteGetListDTO.  # noqa: E501
        :type: list[NamedResourceDTO]
        """

        self._facilities = facilities

    @property
    def rdf_type(self):
        """Gets the rdf_type of this SiteGetListDTO.  # noqa: E501


        :return: The rdf_type of this SiteGetListDTO.  # noqa: E501
        :rtype: str
        """
        return self._rdf_type

    @rdf_type.setter
    def rdf_type(self, rdf_type):
        """Sets the rdf_type of this SiteGetListDTO.


        :param rdf_type: The rdf_type of this SiteGetListDTO.  # noqa: E501
        :type: str
        """

        self._rdf_type = rdf_type

    @property
    def rdf_type_name(self):
        """Gets the rdf_type_name of this SiteGetListDTO.  # noqa: E501


        :return: The rdf_type_name of this SiteGetListDTO.  # noqa: E501
        :rtype: str
        """
        return self._rdf_type_name

    @rdf_type_name.setter
    def rdf_type_name(self, rdf_type_name):
        """Sets the rdf_type_name of this SiteGetListDTO.


        :param rdf_type_name: The rdf_type_name of this SiteGetListDTO.  # noqa: E501
        :type: str
        """

        self._rdf_type_name = rdf_type_name

    @property
    def publication_date(self):
        """Gets the publication_date of this SiteGetListDTO.  # noqa: E501


        :return: The publication_date of this SiteGetListDTO.  # noqa: E501
        :rtype: datetime
        """
        return self._publication_date

    @publication_date.setter
    def publication_date(self, publication_date):
        """Sets the publication_date of this SiteGetListDTO.


        :param publication_date: The publication_date of this SiteGetListDTO.  # noqa: E501
        :type: datetime
        """

        self._publication_date = publication_date

    @property
    def last_updated_date(self):
        """Gets the last_updated_date of this SiteGetListDTO.  # noqa: E501


        :return: The last_updated_date of this SiteGetListDTO.  # noqa: E501
        :rtype: datetime
        """
        return self._last_updated_date

    @last_updated_date.setter
    def last_updated_date(self, last_updated_date):
        """Sets the last_updated_date of this SiteGetListDTO.


        :param last_updated_date: The last_updated_date of this SiteGetListDTO.  # noqa: E501
        :type: datetime
        """

        self._last_updated_date = last_updated_date

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
        if issubclass(SiteGetListDTO, dict):
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
        if not isinstance(other, SiteGetListDTO):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, SiteGetListDTO):
            return True

        return self.to_dict() != other.to_dict()
