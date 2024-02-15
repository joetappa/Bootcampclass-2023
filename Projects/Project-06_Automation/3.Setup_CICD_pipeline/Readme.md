#  How to set up CI/CD Pipeline for a Deploy Java WAR file to Tomcat Using Ansible with Jenkins

![Screenshot 2024-02-12 at 12 30 37](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/4ec0c467-3daa-4fce-9f90-8d2c8d045d2b)


In our previous project, we successfully configured our Ansible server to ping and install packages on servers within our dev environment.

For this new project, we aim to leverage Ansible for deploying Tomcat in our dev setup. Following the deployment, Jenkins will be utilized to pull Java code from GitHub and compile it into a WAR file using Maven plugin. The built artifact will then be transferred to the NFS server, We will mount our webapps folder on both webservers to the NFS server to ensure synchronized data serving across Tomcat servers.

This project is designed to further your appreciation for Ansible's configuration capabilities by automating routine tasks. Concurrently, it will build your confidence in crafting playbooks using a declarative language like YAML.

Let's dive in!