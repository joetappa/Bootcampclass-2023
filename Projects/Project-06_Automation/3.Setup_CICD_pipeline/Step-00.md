
## Task


### GitHub and Jenkins Setup

1. Fork or clone the Crispy Kitchen repository from [here](https://github.com/emortoo-projects/crispy-kitchen.git) to your GitHub account.
2. In your Jenkins server, create a freestyle project and connect your project to GitHub using a webhook for continuous integration.
3. Install the Maven plugin in Jenkins to build the WAR file from the source code.
4. Use the "Publish Over SSH" plugin to deploy the WAR file to an NFS server.

### Ansible and Tomcat Deployment

1. Write a straightforward Ansible playbook for installing Tomcat on your web servers.
2. Deploy this playbook to the Ansible server and execute it to ensure Tomcat is properly installed across your web servers.
3. Verify that Tomcat has been successfully installed on the web servers.
4. Configure the NFS mount to the Tomcat `webapps` directory for synchronized deployment across all servers.

### Additional Notes:

- Ensure that the NFS server is properly set up and accessible by the web servers before attempting to link it to the Tomcat `webapps` directory.
- It's crucial to test the Jenkins build and deployment pipeline step by step to troubleshoot any issues that may arise during the automation process.
- After deploying the WAR file, confirm the application is running correctly on Tomcat by accessing the web server URLs.

This setup aims to automate the deployment process, making it more efficient and reliable.
