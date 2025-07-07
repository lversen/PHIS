"""
OpenSilex API Client - Mock Data Module
Generates mock data for testing and development
"""

from faker import Faker
from typing import List
from openapi_client.models import (ProjectCreationDTO, ExperimentCreationDTO, 
                                   ScientificObjectCreationDTO, DeviceCreationDTO, 
                                   OrganizationCreationDTO)

# Initialize Faker
fake = Faker()

class MockClient:
    """
    Client for generating mock data
    """
    
    def __init__(self):
        """
        Initialize Mock client
        """
        pass

    def create_mock_project(self) -> ProjectCreationDTO:
        """
        Generates a single mock project using the Faker library.
        
        Returns:
            A ProjectCreationDTO object with mock data.
        """
        start_date = fake.past_date(start_date="-5y")
        end_date = fake.future_date(end_date="+5y")
        
        return ProjectCreationDTO(
            name=fake.company() + " Project",
            shortname=fake.bs(),
            description=fake.text(max_nb_chars=200),
            start_date=start_date.strftime('%Y-%m-%d'),
            end_date=end_date.strftime('%Y-%m-%d'),
            homepage=fake.url(),
            objective=fake.sentence(nb_words=10),
            keywords=[fake.word() for _ in range(5)],
            related_projects=[],
            coordinators=[],
            scientific_contacts=[],
            administrative_contacts=[]
        )

    def create_mock_projects(self, num_projects: int) -> List[ProjectCreationDTO]:
        """
        Generates a list of mock projects.
        
        Args:
            num_projects: The number of mock projects to generate.
            
        Returns:
            A list of ProjectCreationDTO objects.
        """
        return [self.create_mock_project() for _ in range(num_projects)]

    def create_mock_experiment(self, project_uri: str) -> ExperimentCreationDTO:
        """
        Generates a single mock experiment.
        
        Args:
            project_uri: The URI of the project this experiment belongs to.
            
        Returns:
            An ExperimentCreationDTO object with mock data.
        """
        start_date = fake.past_date(start_date="-2y")
        end_date = fake.future_date(end_date="+2y")

        return ExperimentCreationDTO(
            name=fake.catch_phrase(),
            start_date=start_date.strftime('%Y-%m-%d'),
            end_date=end_date.strftime('%Y-%m-%d'),
            description=fake.text(max_nb_chars=150),
            objective=fake.sentence(nb_words=8),
            project=project_uri,
            is_public=fake.boolean(),
            contacts=[],
            technical_supervisors=[],
            scientific_supervisors=[],
            groups=[]
        )

    def create_mock_experiments(self, num_experiments: int, project_uri: str) -> List[ExperimentCreationDTO]:
        """
        Generates a list of mock experiments.
        
        Args:
            num_experiments: The number of mock experiments to generate.
            project_uri: The URI of the project these experiments belong to.
            
        Returns:
            A list of ExperimentCreationDTO objects.
        """
        return [self.create_mock_experiment(project_uri) for _ in range(num_experiments)]

    def create_mock_scientific_object(self, experiment_uri: str) -> ScientificObjectCreationDTO:
        """
        Generates a single mock scientific object.
        
        Args:
            experiment_uri: The URI of the experiment this object belongs to.
            
        Returns:
            A ScientificObjectCreationDTO object with mock data.
        """
        return ScientificObjectCreationDTO(
            name=fake.word(),
            rdf_type="http://www.opensilex.org/vocabulary/oeso#Plot",
            experiment=experiment_uri,
            relations=[]
        )

    def create_mock_scientific_objects(self, num_objects: int, experiment_uri: str) -> List[ScientificObjectCreationDTO]:
        """
        Generates a list of mock scientific objects.
        
        Args:
            num_objects: The number of mock objects to generate.
            experiment_uri: The URI of the experiment these objects belong to.
            
        Returns:
            A list of ScientificObjectCreationDTO objects.
        """
        return [self.create_mock_scientific_object(experiment_uri) for _ in range(num_objects)]

    def create_mock_device(self) -> DeviceCreationDTO:
        """
        Generates a single mock device.
        
        Returns:
            A DeviceCreationDTO object with mock data.
        """
        return DeviceCreationDTO(
            name=fake.word() + " Camera",
            rdf_type="http://www.opensilex.org/vocabulary/oeso#Camera",
            brand=fake.company(),
            model=fake.bothify(text='Model-##??'),
            serial_number=fake.ean(length=13),
            description=fake.text(max_nb_chars=100),
            relations=[]
        )

    def create_mock_devices(self, num_devices: int) -> List[DeviceCreationDTO]:
        """
        Generates a list of mock devices.
        
        Args:
            num_devices: The number of mock devices to generate.
            
        Returns:
            A list of DeviceCreationData objects.
        """
        return [self.create_mock_device() for _ in range(num_devices)]

    def create_mock_organization(self) -> OrganizationCreationDTO:
        """
        Generates a single mock organization.
        
        Returns:
            An OrganizationCreationDTO object with mock data.
        """
        return OrganizationCreationDTO(
            name=fake.company(),
            rdf_type="http://www.opensilex.org/vocabulary/oeso#Organization",
            address=fake.address(),
            phone=fake.phone_number(),
            email=fake.company_email(),
            website=fake.url(),
            description=fake.text(max_nb_chars=100),
            relations=[]
        )

    def create_mock_organizations(self, num_organizations: int) -> List[OrganizationCreationDTO]:
        """
        Generates a list of mock organizations.
        
        Args:
            num_organizations: The number of mock organizations to generate.
            
        Returns:
            A list of OrganizationCreationDTO objects.
        """
        return [self.create_mock_organization() for _ in range(num_organizations)]
