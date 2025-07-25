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


class DataFileGetDTO(object):
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
        'rdf_type': 'str',
        '_date': 'str',
        'timezone': 'str',
        'target': 'str',
        'provenance': 'DataProvenanceModel',
        'metadata': 'dict(str, object)',
        'archive': 'str',
        'filename': 'str',
        'publisher': 'UserGetDTO',
        'issued': 'datetime'
    }

    attribute_map = {
        'uri': 'uri',
        'rdf_type': 'rdf_type',
        '_date': 'date',
        'timezone': 'timezone',
        'target': 'target',
        'provenance': 'provenance',
        'metadata': 'metadata',
        'archive': 'archive',
        'filename': 'filename',
        'publisher': 'publisher',
        'issued': 'issued'
    }

    def __init__(self, uri=None, rdf_type=None, _date=None, timezone=None, target=None, provenance=None, metadata=None, archive=None, filename=None, publisher=None, issued=None, _configuration=None):  # noqa: E501
        """DataFileGetDTO - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._uri = None
        self._rdf_type = None
        self.__date = None
        self._timezone = None
        self._target = None
        self._provenance = None
        self._metadata = None
        self._archive = None
        self._filename = None
        self._publisher = None
        self._issued = None
        self.discriminator = None

        self.uri = uri
        self.rdf_type = rdf_type
        if _date is not None:
            self._date = _date
        if timezone is not None:
            self.timezone = timezone
        if target is not None:
            self.target = target
        self.provenance = provenance
        if metadata is not None:
            self.metadata = metadata
        if archive is not None:
            self.archive = archive
        if filename is not None:
            self.filename = filename
        if publisher is not None:
            self.publisher = publisher
        if issued is not None:
            self.issued = issued

    @property
    def uri(self):
        """Gets the uri of this DataFileGetDTO.  # noqa: E501


        :return: The uri of this DataFileGetDTO.  # noqa: E501
        :rtype: str
        """
        return self._uri

    @uri.setter
    def uri(self, uri):
        """Sets the uri of this DataFileGetDTO.


        :param uri: The uri of this DataFileGetDTO.  # noqa: E501
        :type: str
        """
        if self._configuration.client_side_validation and uri is None:
            raise ValueError("Invalid value for `uri`, must not be `None`")  # noqa: E501

        self._uri = uri

    @property
    def rdf_type(self):
        """Gets the rdf_type of this DataFileGetDTO.  # noqa: E501

        file type  # noqa: E501

        :return: The rdf_type of this DataFileGetDTO.  # noqa: E501
        :rtype: str
        """
        return self._rdf_type

    @rdf_type.setter
    def rdf_type(self, rdf_type):
        """Sets the rdf_type of this DataFileGetDTO.

        file type  # noqa: E501

        :param rdf_type: The rdf_type of this DataFileGetDTO.  # noqa: E501
        :type: str
        """
        if self._configuration.client_side_validation and rdf_type is None:
            raise ValueError("Invalid value for `rdf_type`, must not be `None`")  # noqa: E501

        self._rdf_type = rdf_type

    @property
    def _date(self):
        """Gets the _date of this DataFileGetDTO.  # noqa: E501

        date or datetime  # noqa: E501

        :return: The _date of this DataFileGetDTO.  # noqa: E501
        :rtype: str
        """
        return self.__date

    @_date.setter
    def _date(self, _date):
        """Sets the _date of this DataFileGetDTO.

        date or datetime  # noqa: E501

        :param _date: The _date of this DataFileGetDTO.  # noqa: E501
        :type: str
        """

        self.__date = _date

    @property
    def timezone(self):
        """Gets the timezone of this DataFileGetDTO.  # noqa: E501

        to specify if the offset is not in the date and if the timezone is different from the default one  # noqa: E501

        :return: The timezone of this DataFileGetDTO.  # noqa: E501
        :rtype: str
        """
        return self._timezone

    @timezone.setter
    def timezone(self, timezone):
        """Sets the timezone of this DataFileGetDTO.

        to specify if the offset is not in the date and if the timezone is different from the default one  # noqa: E501

        :param timezone: The timezone of this DataFileGetDTO.  # noqa: E501
        :type: str
        """

        self._timezone = timezone

    @property
    def target(self):
        """Gets the target of this DataFileGetDTO.  # noqa: E501

        target URI on which the data have been collected  # noqa: E501

        :return: The target of this DataFileGetDTO.  # noqa: E501
        :rtype: str
        """
        return self._target

    @target.setter
    def target(self, target):
        """Sets the target of this DataFileGetDTO.

        target URI on which the data have been collected  # noqa: E501

        :param target: The target of this DataFileGetDTO.  # noqa: E501
        :type: str
        """

        self._target = target

    @property
    def provenance(self):
        """Gets the provenance of this DataFileGetDTO.  # noqa: E501


        :return: The provenance of this DataFileGetDTO.  # noqa: E501
        :rtype: DataProvenanceModel
        """
        return self._provenance

    @provenance.setter
    def provenance(self, provenance):
        """Sets the provenance of this DataFileGetDTO.


        :param provenance: The provenance of this DataFileGetDTO.  # noqa: E501
        :type: DataProvenanceModel
        """
        if self._configuration.client_side_validation and provenance is None:
            raise ValueError("Invalid value for `provenance`, must not be `None`")  # noqa: E501

        self._provenance = provenance

    @property
    def metadata(self):
        """Gets the metadata of this DataFileGetDTO.  # noqa: E501

        key-value system to store additional information that can be used to query data  # noqa: E501

        :return: The metadata of this DataFileGetDTO.  # noqa: E501
        :rtype: dict(str, object)
        """
        return self._metadata

    @metadata.setter
    def metadata(self, metadata):
        """Sets the metadata of this DataFileGetDTO.

        key-value system to store additional information that can be used to query data  # noqa: E501

        :param metadata: The metadata of this DataFileGetDTO.  # noqa: E501
        :type: dict(str, object)
        """

        self._metadata = metadata

    @property
    def archive(self):
        """Gets the archive of this DataFileGetDTO.  # noqa: E501

        archive file URI if file is inside  # noqa: E501

        :return: The archive of this DataFileGetDTO.  # noqa: E501
        :rtype: str
        """
        return self._archive

    @archive.setter
    def archive(self, archive):
        """Sets the archive of this DataFileGetDTO.

        archive file URI if file is inside  # noqa: E501

        :param archive: The archive of this DataFileGetDTO.  # noqa: E501
        :type: str
        """

        self._archive = archive

    @property
    def filename(self):
        """Gets the filename of this DataFileGetDTO.  # noqa: E501


        :return: The filename of this DataFileGetDTO.  # noqa: E501
        :rtype: str
        """
        return self._filename

    @filename.setter
    def filename(self, filename):
        """Sets the filename of this DataFileGetDTO.


        :param filename: The filename of this DataFileGetDTO.  # noqa: E501
        :type: str
        """

        self._filename = filename

    @property
    def publisher(self):
        """Gets the publisher of this DataFileGetDTO.  # noqa: E501


        :return: The publisher of this DataFileGetDTO.  # noqa: E501
        :rtype: UserGetDTO
        """
        return self._publisher

    @publisher.setter
    def publisher(self, publisher):
        """Sets the publisher of this DataFileGetDTO.


        :param publisher: The publisher of this DataFileGetDTO.  # noqa: E501
        :type: UserGetDTO
        """

        self._publisher = publisher

    @property
    def issued(self):
        """Gets the issued of this DataFileGetDTO.  # noqa: E501


        :return: The issued of this DataFileGetDTO.  # noqa: E501
        :rtype: datetime
        """
        return self._issued

    @issued.setter
    def issued(self, issued):
        """Sets the issued of this DataFileGetDTO.


        :param issued: The issued of this DataFileGetDTO.  # noqa: E501
        :type: datetime
        """

        self._issued = issued

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
        if issubclass(DataFileGetDTO, dict):
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
        if not isinstance(other, DataFileGetDTO):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, DataFileGetDTO):
            return True

        return self.to_dict() != other.to_dict()
