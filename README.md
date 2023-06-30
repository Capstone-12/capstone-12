# Capstone Project Documentation: 
## NGO School App Deployment
### Table of Contents

1. Introduction
2. Project Overview
3. Team Members
4. Project Goals and Objectives
5. Scope
6. Project Deliverables
7. Technologies
8. Deployment Process
9. Best Practices Implemented
10. Lessons Learned
11. Conclusion
12. Acknowledgments


# Introduction
This document serves as the documentation for the capstone project conducted by group 12 of the Alt School Cloud Engineering Students. The primary objective of this project was to deploy a school open-source app while incorporating best practices in the deployment process. The app aimed to provide essential features for managing various aspects of a school's operations.

# Project Overview
The project focused on deploying a school NGO app that would enhance the management of student information, course schedules, attendance tracking, and other administrative tasks. The app aimed to streamline processes, improve efficiency, and provide a user-friendly interface for administrators, teachers, and students allowing for volunteers to sign up to teach and also donate funds for the NGO.

# Team Members
1. CI/CD TEAM: Bukola Testimony, Faboya Korede, Salu Teslim
2. FINOPS TEAM: George Omoja, Akunne Chidi
3. INFRASTRUCTURE TEAM: Salu Teslim, Gladys Oviawe, Kyazike Samaka Gloria
4. SRE TEAM: Faboya Korede, Omokolade Adelekan
5. TECHNICAL WRITING: Gladys Oviawe, Osarobe Divine

# Project Goals and Objectives

The primary goals and objectives of the project were as follows
1. Deploy a school open-source app.
2. Implement best practices in the deployment process.
3. Ensure data security and protection of sensitive information.

# Scope
1. Deployment of the app on a scalable infrastructure.
2. Implementation of continuous integration and continuous deployment (CI/CD) pipelines.
3. Monitoring and logging of the deployed application.
4. Implementation of security measures to protect user data.

# Project Deliverables
The following deliverables were produced as part of the project:
1. Deployed school open-source app accessible through a web interface.
2. Documentation of the deployment process and best practices employed.
3. Source code repository with version control history.
4. Test cases and quality assurance reports.
5. Infrastructure setup and configuration scripts.
6. Monitoring and logging setup documentation.

# Technologies
The team utilized a range of technologies to complete the project:

1. Programming Languages: Hcl, yaml
2. Database: MongoDB
3. Cloud Platform: AWS (Amazon Web Services)
4. Infrastructure-as-Code: Terraform
5. Containerization: Docker
6. Orchestration: Kubernetes
7. CI/CD: Git Actions
8. Monitoring: Prometheus, Grafana
9. Version Control: Git

# Deployment Process
The deployment process involved the following steps:
1. <b>Infrastructure Setup</b>: Provisioning the required infrastructure using Terraform scripts. This included provisioning kubernetes clusters, monitoring stack, and networking components on AWS.
2. Containerization: Dockerizing the application components to ensure consistency and portability across different environments.
3. Orchestration: Utilizing Kubernetes for container orchestration and managing scalability, load balancing, and fault tolerance.
4. CI/CD Pipelines: Configuring Github Actions to automate the build, test, and deployment process. This involved setting up webhook triggers from the version control system and defining pipeline stages.
5. Security Measures: Implementing SSL/TLS certificates, firewalls, and access controls to protect sensitive data and secure the application.
6. Monitoring and Logging: Setting up Prometheus for monitoring application metrics and grafana for visualization of the metrics.
7. Documentation: Documenting the deployment process, including infrastructure setup, configuration steps, and troubleshooting guidelines.

### Every code both terraform, git workflows, kubernetes manifests are all found in this repository folders, all well labelled for easy understanding and deployment, they are written declaratively, therefore making it reusable.
To deploy the app with the configurations already set up here, fork this repo: https://github.com/Capstone-12/ and 

# Architectural design

![WhatsApp Image 2023-06-30 at 15 48 35](https://github.com/Capstone-12/capstone-12/assets/99274632/4f176385-c871-4f3c-95b4-0661b6b924c5)

# Deployed Application
### Backend
![WhatsApp Image 2023-06-30 at 21 49 04](https://github.com/Capstone-12/capstone-12/assets/99274632/6a66bff0-fc77-4c80-9698-821c607ba33d)

### Frontend
![WhatsApp Image 2023-06-30 at 19 43 05](https://github.com/Capstone-12/capstone-12/assets/99274632/adc7029a-e196-43ff-9b55-ad7e5e7f7ac0)

# Monitoring with prometheus and grafana
### CPU Usage
![WhatsApp Image 2023-06-30 at 21 00 13](https://github.com/Capstone-12/capstone-12/assets/99274632/d9ae0869-6f06-4fc0-ac1d-53f50b63c370)

#### Speed/Availability
![WhatsApp Image 2023-06-30 at 21 44 20](https://github.com/Capstone-12/capstone-12/assets/99274632/6addc443-ecdd-4e4e-86cb-03a9ea57bf9c)

#### Node
![image](https://github.com/Capstone-12/capstone-12/assets/99274632/362dc262-6d9b-485e-a282-c0f155d4105e)


# Lessons Learned
The project provided valuable learning opportunities for the team members. Key lessons learned include:
1. Importance of Collaboration: Effective communication and collaboration are crucial for successful project execution, particularly in cross-functional teams.
2. Continuous Testing and Feedback: Regular testing and feedback loops are essential to identify and address issues early


# Conclusion
We are glad that we finally graduated from ALTSCHOOL AFRICA

# Acknowledgments
Special thanks to God, Our tutors: Kunrad, Valentine and Abuango for the opportunity to learn and grow. Special thanks to Altschool Africa
