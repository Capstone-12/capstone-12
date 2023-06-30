# Capstone Project Documentation: 
## School Open Source App Deployment
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
10. Challenges Faced
11. Lessons Learned
12. Conclusion
13. Acknowledgments


# Introduction
This document serves as the documentation for the capstone project conducted by group 12 of the Alt School Cloud Engineering Students. The primary objective of this project was to deploy a school open-source app while incorporating best practices in the deployment process. The app aimed to provide essential features for managing various aspects of a school's operations.

# Project Overview
The project focused on deploying a school open-source app that would enhance the management of student information, course schedules, attendance tracking, and other administrative tasks. The app aimed to streamline processes, improve efficiency, and provide a user-friendly interface for administrators, teachers, and students allowing for volunteers to sign up to teach and also donate funds for the NGO.

# Team Members
1. CI/CD TEAM: Bukola Testimony, Faboya Korede
2. FINOPS TEAM: George Onoja, Akunne Chidi
3. INFRASTRUCTURE TEAM: Salu Teslim, Gladys Oviawe, Kyazike Samaka Gloria
4. SRE TEAM: Faboya Korede, Omokolade Adelekan
5. TECHNICAL WRITING: Gladys Oviawe

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

# Architectural design
![cappi drawio](https://github.com/Capstone-12/capstone-12/assets/99274632/6a3d63ea-ee15-4c41-b865-ee27f6b74404)


# Challenges Faced


# Lessons Learned

The project provided valuable learning opportunities for the team members. Key lessons learned include:

1. Importance of Collaboration: Effective communication and collaboration are crucial for successful project execution, particularly in cross-functional teams.
2. Continuous Testing and Feedback: Regular testing and feedback loops are essential to identify and address issues early

# Conclusion

# Acknowledgments
