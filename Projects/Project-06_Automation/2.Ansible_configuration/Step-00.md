Ansible Client as a Jump Server (Bastion Host)

What is a Bastion Host ?
A Jump Server (sometimes also referred as Bastion Host) is an intermediary server through which access to internal network can be provided. If you think about the current architecture you are working on, ideally, the webservers would be inside a secured network which cannot be reached directly from the Internet. That means, even DevOps engineers cannot SSH into the Web servers directly and can only access it through a Jump Server. it provide better security and reduces attack surface.

On the diagram below the Virtual Private Network (VPC) is divided into two subnets – Public subnet has public IP addresses and Private
subnet is only reachable by private IP addresses.


![6033](https://user-images.githubusercontent.com/85270361/210153615-ea6cf398-05d3-45d0-9ea4-6daffac7fa4c.PNG)


## Task
1. Install and configure Ansible client to act as a Jump Server/Bastion Host
- Install Ansible on your Jenkins-Server and change the name to "Jenkins-Ansible-Server".

2. Create a simple Ansible playbook to automate servers configuration



