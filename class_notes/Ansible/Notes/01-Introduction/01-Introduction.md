**Introduction to Ansible**

- Ansible is an open-source configuration Management,
deployment and provisioning Automation tool maintained by Redhat.
- It is very, very simple to setup and yet powerful.
- Ansible will be helpful to perform:
    - Configuration Management
    - Application Deployment
    - Task Automation
    - IT Orchestration

**How Ansible works**
  - Ansible works by connecting to remote nodes (hosts) and pushing out small programs, called “Ansible
    modules” to them.
  - The pushed programs/modules will be executed on remote server by Ansible over SSH and removes them
    when finished.
  - Unlike Puppet or Chef it doesn’t use an agent on the remote host, Instead Ansible uses SSH. It is agentless.
  - It’s written in Python which needs to be installed on the remote host.
  - This means that you don’t have to setup a client server environment before using Ansible

**Benefits of using Ansible**
 - It is a free open -source Automation tool and simple to use.
 - Uses existing OpenSSH for connection
 - Agent-less – No need to install any agent on Ansible Clients/Nodes
 - Python/YAML based
 - Highly flexible and versatile in configuration management of systems.
 - Large number of ready to use modules for system management
 - Custom modules can be added if needed

 **Ansible Directory Structure**

- The default ansible home directory is **/etc/ansible**
- This directory will consist of:
  - a) ansible.cfg
  - b) hosts
  - c) roles

**Default ansible configuration file**
- The default location is: **/etc/ansible/ansible.cfg**,
 in which we can make various settings like location of inventory file, host_key_checking as False
- But we can define ansible configuration file in different location
and for this there is a priority for this files.
- You can generate ansible.cfg by running the command
    $ ansible-config init --disabled > ansible.cfg

**Locations with priority(starting from top to bottom):** 
- ANSIBLE_CONFIG environment variable  
- ./ansible.cfg from the current directory 
- ~/.ansible.cfg file present in home directory 
- /etc/ansible/ansible.cfg default ansible.cfg file.

- Ansible will only use the configuration settings from the file which is found in this sequence first.
- It will not look for the settings in the higher sequence files if the setting is not present in the file which is chosen for deployment

**Host Key Checking**

- Anytime you make an ssh connection with a server for the first time, you will be prompted to confirm if you want to continue making the connection.
- This feature is by default set to true in the ansible.cfg file
- Disable this by uncommenting the line in the configuration file or you can also export an environmental variable using the command below.

       host_key_checking = False
               or
      $ export ANSIBLE_HOST_KEY_CHECKING=false
