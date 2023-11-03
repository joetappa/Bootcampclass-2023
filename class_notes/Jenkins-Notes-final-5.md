Understanding Jenkines

Jenkins is an open-source tool that helps us automate task and projects in software development process. It also helps us achieve continous intergration to ensure a smooth connection from developers commiting to code to SCM as well as deploying into dev , UAT or prod enviroment. Jenkins provides hundreds of plugins to support building, deploying, and automating any project. It is a self-contained Java-based program, ready to run out-of-the-box, with packages for Windows, macOS, and other Unix-like operating systems.

Key Features of Jenkins Include:

1. Continuous Integration & Continuous Delivery (CI/CD):
- Jenkins supports the automation of building, testing, and deploying applications, making it easier to integrate changes into the project and deliver it continuously to the production environment.

2. Pipelines:
- Jenkins pipelines provide a set of tools for modeling simple-to-complex delivery pipelines as code which can be stored in version control.

3. Distributed Builds:
 - Jenkins can distribute build/test loads to multiple computers to speed up the build and test process.
4. Plugins:
- Jenkins has a rich ecosystem of plugins (over 1,800 available) that can be used to extend its functionality and integrate with various development, testing, and deployment tools.
5. Monitoring:
   - Jenkins provides extensive monitoring capabilities to identify issues in the build and deployment process.

6. Easy Configuration:
   - Jenkins is easy to set up, configure and maintain, with a web-based graphical user interface for configuring and managing the Jenkins server and jobs.

   Common Use Cases of Jenkins Include:

   1. Automated Testing:
   - Jenkins can automatically run tests on your codebase to ensure that changes haven't broken anything.

2. Code Quality Checks:
   - Jenkins can be configured to run code quality checks and static code analysis to ensure the code meets the specified quality standards.

3. Automated Deployment:
   - Jenkins can deploy your application to the production environment automatically after a successful build.

4. Release Management:
   - Jenkins can automate the process of releasing a new version of your application.

   interview Question:
- What is your experience with Jenkins ?
- What is your experience with Jenkins ?
i can install and configure Jenkins on multiple linux servers like RedHat, Amazon Linux and Ubuntu.
i can securely configure Jenkins to manage access control using RBAC ( Role Base Access Control)
i can run different kind of jobs in Jenkins using Freestyle, maven projects and pipelines jobs
i can upgrade freestyle projects to maven projects in jenkins in all java based enviroments. using Maven default lifecycle goal, Maven can validate, compile, do unit testing for most programming languages  
i can write and modify jenkinsfiles scripts to perform multiple pipeline jobs 
i can use Jenkins for other jobs and tasks such as system monitoring and periodic database backups 

Generally my role is to ensure that applications are built, tested and deployed


- What is the size of your team ? 
we have 7 members in each team


Jenkins Security (JHD, Ports & User)
==========================================
Is it important to secure your Jenkins server?
JHD = Jenkins Home Directory : 
What is Jenkins Home Directory ?
$ pwd

Jenkins Default Settings [Port] : 
What is the default port for Jenkins ?

Jenkins user : 
Who is the user we created to when installing Jenkins ? 
 sh 
whoami
cat etc/passwd
id jenkins

JHD= Jenkins Home Directory = /var/lib/jenkins


Jenkins Default Settings [Port] : 8080


Jenkins user : jenkins


Defualt setting for Jenkins:
==============================

Port = 8080
JHD = /var/lib/jenkins
user = Jenkins


Changing Jenkins default settings:
=====================================

sudo vi /etc/default/jenkins  (Ubuntu)

sudo vi /etc/sysconfig/jenkins  (Redhat)

$ sudo systemctl restart jenkins

How to search for Jenkins config files:
Chatgpt or google "Jenkins default jenkins 

1. Jenkins Home Directory
============================================
JHD = /var/lib/jenkins


jobs

logs
plugins
nodes
secrets
tools
updates
userContent
users
workspace
config.xml --> vi config.xml


2. Securing User Management  
=====================================

Authentication --> [username and Password]
Authorization --> [RBAC]

1. How to create users in Jenkins as an admin ? 
2. How to allow users to signup and create an account ?
3. How to add users using RBAC or Matrix-based security ?
Add users.
4. Take all access away and refresh the server.
 you should see access Denied because the user was authenticated but was not authorized based on (RBAC) 
5. logged in users can do anything
    As a Devops Engineer, this setting should not be encouraged!!
6. Project based Matrix Authentication strategy
  A user can see a project on the Dash but will leaverage RBAC to access their Jobs 

7. Install role based Authorization strategy plugin
Dashboard > Manage Jenkins > ConfigureGlobal Security 
Authorization > Role-based strategy.
