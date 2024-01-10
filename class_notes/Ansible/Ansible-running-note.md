### Introduction to Ansible

- Ansible is an open-source configuration Management, deployment and provisioning Automation tool maintained by Redhat.
- It is very, very simple to setup and yet powerful.
- Ansible will be helpful to perform:
    - Configuration Management
    - Application Deployment
    - Task Automation
    - IT Orchestration

### How Ansible works
  - Ansible works by connecting to remote nodes (hosts) and pushing out small programs, called “Ansible
    modules” to them.
  - The pushed programs/modules will be executed on remote server by Ansible over SSH and removes them
    when finished.
  - Unlike Puppet or Chef it doesn’t use an agent on the remote host, Instead Ansible uses SSH. It is agentless.
  - It’s written in Python which needs to be installed on the remote host.
  - This means that you don’t have to setup a client server environment before using Ansible

### Benefits of using Ansible
 - It is a free open -source Automation tool and simple to use.
 - Uses existing OpenSSH for connection
 - Agent-less – No need to install any agent on Ansible Clients/Nodes
 - Python/YAML based
 - Highly flexible and versatile in configuration management of systems.
 - Large number of ready to use modules for system management
 - Custom modules can be added if needed

### Ansible Directory Structure**

- The default ansible home directory is **/etc/ansible**
- This directory will consist of:
  - a) ansible.cfg
  - b) hosts
  - c) roles

### Default ansible configuration file
- The default location is: **/etc/ansible/ansible.cfg**,
 in which we can make various settings like location of inventory file, host_key_checking as False
- But we can define ansible configuration file in different location and for this there is a priority for this files.
- You can generate ansible.cfg by running the command
```sh
     ansible-config init --disabled > ansible.cfg
```
### Locations with priority(starting from top to bottom):** 
- ANSIBLE_CONFIG environment variable  
- ./ansible.cfg from the current directory 
- ~/.ansible.cfg file present in home directory 
- /etc/ansible/ansible.cfg default ansible.cfg file.

- Ansible will only use the configuration settings from the file which is found in this sequence first.
- It will not look for the settings in the higher sequence files if the setting is not present in the file which is chosen for deployment

### Host Key Checking

- Anytime you make an ssh connection with a server for the first time, you will be prompted to confirm if you want to continue making the connection.
- This feature is by default set to true in the ansible.cfg file
- Disable this by uncommenting the line in the configuration file or you can also export an environmental variable using the command below.

       host_key_checking = False
               or
      $ export ANSIBLE_HOST_KEY_CHECKING=false


Servers:
    UsersMGT
    FilesMGT
    ServicesMGT
    PackagesMGT

Ansible is an open source AGENTLESS :
  Configuration Management tool, 
  deployment tool and/or  
  provisioning tool maintained by Redhat

Ansible can be installed in Linux OS.   


Host Inventory -- > IT CONTAINS HOSTED SERVER DATIALS (IP or Host name)
### Ad-hoc Commands**

- An Ad-Hoc command is a one-liner ansible command that performs one task on the target host(s)/group(s).

- Unlike playbooks — which consist of collections of tasks that can be reused — ad hoc commands are tasks that you don’t perform frequently, such as restarting a service or retrieving information about the remote systems that Ansible manages.

- This command will only have two parameters,\
        the group / target of a host that you want to perform the task and \
        the Ansible module to run.
### Modules:**

- These are small programs that do some work on the server. 
- They are the main building blocks of Ansible and are basically reusable scripts that are used by Ansible Ad-hoc and playbooks.
- Ansible comes with a number of reusable modules.
- The basic syntax of an Ad-hoc command is:

  **$ ansible [ -i inventory_file ] <server1:server2:Group1:Group2> -m <module> [-a arguments]**
  
  ansible host -m -a 

  - To list all available modules:
```
        $ ansible-doc -l
```
### Testing Connection to Ansible Hosts**

- The following command will test connectivity between your Ansible control node and all your Ansible hosts. 
- This command uses the current system user and its corresponding SSH key as the remote login, and includes the -m option, which tells Ansible to run the ping module. 
- It also features the -i flag, which tells Ansible to ping the hosts listed in the specified inventory file.

     **$ ansible all -i inventory -m ping**

- If this is the first time you’re connecting to these servers via SSH, you’ll be asked to confirm the authenticity of the hosts you’re connecting to via Ansible. 
- When prompted, type yes and then hit ENTER to confirm.

- You should get output similar to this:

     Output
     server1 | SUCCESS => {
       "changed": false,
        "ping": "pong"
      }
     server2 | SUCCESS => {
       "changed": false,
        "ping": "pong"
      }

- Once you get a "pong" reply back from a host, it means the connection is live and you’re ready to run Ansible commands on that server.

 
### Ansible concepts:
1. Ansible commands: 

ansible hosts -module -arguments  

    ansible hosts -m module -a "df -f"
      -m=modules
      -a=arguements
  
Static Inventory -- > A FILE
It is a static file where hosted servers are grouped
 
## 1. Ansible hosts: 
default host : 

    all  
    localhost 
    
```      
  ansible all -m ping
  ansible localhost -m ping
``` 
db / web / app / localhost / all 

[web]
18.208.188.236
18.206.209.60

[app]
18.212.228.49
52.90.126.36

[db]
23.22.197.215
54.144.79.183


 ansible docker -m command -a "df -h"
 ansible localhost -m command -a "df -h"
 
 **Note** : The df command displays information about total space and available space on a file system.
 
 app  = ssh -i "demoKey.pem" ubuntu@18.212.228.49
 web  = ssh -i "demoKey.pem" ubuntu@18.208.188.236
 db   = ssh -i "demoKey.pem" ubuntu@23.22.197.215
 eks  = ssh -i "demoKey.pem" ubuntu@54.174.104.94


[web]
18.208.188.236 ansible_user=ubuntu ansible_ssh_private_key_file=/tmp/demoKey.pem
18.206.209.60 ansible_user=ubuntu ansible_ssh_private_key_file=/tmp/demoKey.pem

[app]
18.212.228.49 ansible_user=ubuntu ansible_ssh_private_key_file=/tmp/demoKey.pem
52.90.126.36 ansible_user=ubuntu ansible_ssh_private_key_file=/tmp/demoKey.pem

[db]
23.22.197.215 ansible_user=ec2-user ansible_ssh_private_key_file=/tmp/demoKey.pem
54.144.79.183 ansible_user=ec2-user ansible_ssh_private_key_file=/tmp/demoKey.pem

[docker]
54.174.104.94 ansible_user=ubuntu ansible_ssh_private_key_file=/tmp/demoKey.pem


## 2. Ansible modules : written python scripts that can be invoke in playbooks  
 
 ### 1. Command module
- Used to execute binary commands
- It is the **default module**
- With the Command module the command will be executed without being proceeded through a shell.
- Consequently, some variables like $HOME and operations like <, >, | and & will not work.
- The command module is more secure, because it will not be affected by the user’s environment \
```sh
    ansible all -m command -a "uptime"
    ansible web -m command -a "cat /etc/paswd && pwd"
``` 
or 

```sh
    ansible all -a "uptime"
    ansible web -a "cat /etc/paswd && pwd"
```
 ### 2. Shell Module
- Used to execute binary commands
- It is more superior than the command module
- Command will be executed being proceeded through a shell. \
```sh
    ansible db -a "cat /etc/hosts && pwd"
    ansible db –m shell –a "cat /etc/passwd && pwd"
```
 ### 3. File Module
- Used to create files and directories \
 a) Create a file named file25 \
  **$ ansible group1 -m file -a "path=file26.txt state=touch"**

 b) Create a directory file25 \
  **$ ansible db -m file -a "path=/home/ansible/file26 state=directory mode=777 owner=root group=root" --become**

- If state=absent, the file or directory will be deleted

 ### 4. Copy Module
- Used to copy files from the ansible control node to the remote
node or copy files from one location to another in the remote
node. \
a) From ansible control node to remote node \
  **$ ansible group1 -m copy -a "src=/source/file/path dest=/dest/location"** \
  **$ ansible group1 -m copy -a "src=/etc/hosts dest=/home/ansible"**

 b) From one location in remote node to another location in remote node \
  **$ ansible db -m copy -a “src=/source/file/path dest=/dest/location remote_src=yes"**

  **$ ansible group1 -m copy -a "src=/etc/hosts dest=/home/ansible remote_src=yes"**

 c) Change permission of a file in a remote node \
  **$ ansible db -m file -a "dest=/home/ansible/hosts mode=0664"**

 ### 5. Fetch Module
- Used to download files from a remote node to the control machine. \
  **$ ansible db -m fetch -a “src=/source/file/path dest=/dest/location"**

- Will copy the files with a directory structure. \
  **$ ansible all -m fetch -a "src=./hosts dest=./"**

- To fetch the file without a directory structure, use the flat=yes option \
  **$ ansible all -m fetch -a "src=./hosts dest=./ flat=yes"**

 ### 6. Apt/yum/package Module
- Used to install a package in the ansible client. \
  **$ ansible db -m apt -a "name=apache2 state=present" --become**

  **$ ansible db -m service -a "name=apache2 state=started" --become**

  **$ ansible db -m apt -a "name=nginx state=present" -b**

 ### 7. Service Module
- You can use the service module to manage services running on the remote nodes managed by Ansible. This will require extended system privileges, so make sure your remote user has sudo permissions and you include the --become option to use Ansible’s privilege escalation system. Using -K will prompt you to provide the sudo password for the connecting user.

  **$ ansible all -i inventory -m service -a "name=nginx state=restarted" --become  -K**

  **$ ansible all -m service -a "name=nginx state=stopped" --become  -K**

 ### 8. User Module
 - Used to create user accounts.
 - Create a password encryption
 - Generate the password from your local environment

 **$ openssl passwd -crypt <desired_password>**

 **$ ansible db -m user -a "name=Peter password=wiyiMQbLhCRUY shell=/bin/bash" -b**

 ### 9. Setup module
- This is a default module and is used to gather facts about the hosts.
- The setup module returns detailed information about the remote systems managed by Ansible, also known as system facts.
- To obtain the system facts for group1, run:

  **$ ansible group1 -m setup**

- This will print a large amount of JSON data containing details about the remote server environment.
- To print only the most relevant information, include the "gather_subset=min" argument as follows:

  **$ ansible group1 -m setup -a "gather_subset=min"**

- To print only specific items of the JSON, you can use the filter argument. This will accept a wildcard pattern used to match strings. For example, to obtain information about both the ipv4 and ipv6 network interfaces, you can use *ipv* as filter:

  **$ ansible group1 -m setup -a "filter=*ipv*"**

 ### 10. Debug module
- Executes only on the local host to display some information- message or variable value.
- We do not need ssh connectivity or password for a debug module. When using the debug module, the arguments will either be \
      - msg  =  to display a message \
      - var  = to display a variable

      **Default variables**
          - inventory_hostname
          - inventory_hostname_short
          - groups/ groups.keys()

  **$ ansible all -m debug -a "var='This is a debug module'"** \
  **$ ansible all -m debug -a "msg={{}}"**

 **inventory_hostname**
  - You can use debug to display variables.

  **$ ansible all -m debug -a "var='inventory_hostname'"** \
  **$ ansible all -m debug -a "msg={{inventory_hostname}}"**

  - If you have an inventory with entries like 'server1.cloud.production.host' then the command below will return server1. \
  **$ ansible all -m debug -a "msg={{inventory_hostname_short}}"**

  - You can also use debug module to display groups or groups keys in your inventory. \
  **$ ansible all -m debug -a "var='groups'"** \
  **$ ansible all -m debug -a "var='groups.keys()'"**


  
### Project 1
============

git clone https://github.com/emortoo/apache-httpd.git

ansible web -m yum -a "name=httpd state=present" -b 
ansible web -m systemd -a "name=httpd state=started"  -b 
ansible web -m synchronize -a "src=apache-httpd/ dest=/var/www/html/" -b

#ansible web -m copy -a "src=index.html dest=/var/www/html/" -b 
index.html     
<h1>Welcome to United Core System </h1>
<h1>Ansible is automation</h1>
<h1>We love automation</h1>


## 3. playbooks:

Playbooks: 
  It's a configuration script written in yml. It contains plays and tasks.
  those tasks will be executed in the hosts.


apache.yml   
- hosts: app
  become: true  
  tasks:
  - name: Test connection
    ping:
- hosts: web  # ubuntu
  gather_facts: false
  become: true  
  tasks:
  - name: install apache  
    apt: name=apache2 state=present
  - name: start apache  
    service: 
      name: apache2    
      state: started    
  - name: copy index file 
    copy: 
      src: index.html  
      dest: /var/www/html/ 
- hosts: app # RHEL 
  gather_facts: false
  become: true  
  tasks:
  - name: install apache  
    yum: name=httpd state=present
  - name: start apache  
    service: 
      name: httpd    
      state: started    
  - name: copy index file 
    copy: 
      src: index.html  
      dest: /var/www/html/ 
      
      
      
remove-apache.yml  
- hosts: web # RHEL
  gather_facts: false
  become: true
  tasks:
  - name: remove apache
    yum: name=httpd state=absent
 
 - hosts: web # ubuntu
  gather_facts: false
  become: true
  tasks:
  - name: remove apache
    apt: name=apache2 state=absent


 ansible-playbook apache.yml --syntax-check   
 ansible-playbook apache.yml --check   = dry-run  
 ansible-playbook apache.yml


## Recap:

static Inventory/host file : We have two types of host files 
  custom  = anywhere in the server  
           /home/ansible/hosts
           /tmp/myhost  
  default = /etc/ansible/hosts  
  
```sh
  ansible all -m ping -i host
```
### Playbook composition:

  ## 1. plays = 
       - hosts: dev 
       - hosts: dbservers  
  ## 2. tasks 
  ## 3. modules 
        yum / file / apt / copy / template / script / lineinfile
        package / shell / setup / command / ping / authorized_keys
  4. handlers   
  5. loops
  6. conditions
  7. variables
  8. roles   

## handlers: 
- Handlers are just like ordinary tasks, but they are only called when notified.
- The notification only happens if we have a change in the dependent task.

no-handlers.yml
---
  - hosts: db
    gather_facts: false
    become: yes
    tasks:
      - name: Install httpd
        yum:
          name: httpd
          state: present
      - name: start httpd
        service:
          name: httpd
          state: started
          
remove-httpd 
---
```sh
 ansible db -m yum -a "name:httpd state:absent" 
```
handlers.yml
---
  - hosts: db
    gather_facts: false
    become: yes
    tasks:
      - name: Install httpd
        yum:
          name: httpd
          state: present
        notify:
          - start httpd
    handlers:
      - name: start httpd
        service:
          name: httpd
          state: started      

## loops:

no-loops.yml

- hosts: test1
   become: yes
   tasks:
      - yum:
         name: git
         state: present
      - yum:
         name: wget
         state: present
      - yum:
         name: pip3
         state: present
      - yum:
         name: tree
         state: present
      - yum:
         name: vim
         state: present
         
loops.yml
  - hosts: test2
    gather_facts: false
    become: yes
    tasks:
    - apt:
       name: "{{item}}"
       state: present
      loop:
          - git
          - wget
          - pip3
          - tree
          - vim

---

## conditions:
conditions.yml
---
  - name: Simple play to install httpd or apache2
    hosts: web
    gather_facts: true
    become: yes
    tasks:
    - name: Installing httpd using yum
      yum:
        name: httpd
        state: present
      when: ansible_distribution != "Ubuntu"
    - name: Installing apache2 using apt
      apt:
        name: apache2
        state: present
      when: ansible_distribution == "Ubuntu"
      
loopwithcondition.yml
web [ Redhat ]
- hosts: web  
  become: true
  gather_facts: false  
  tasks:
   - name: Install list of packages
     yum:
       name: ['nano', 'wget', 'vim', 'zip', 'unzip']
       state: latest  
     when: ("ansible_distribution" == "RedHat")
     
web [ ubuntu / Redhat / windows ]
- hosts: web  
  become: true
  gather_facts: false  
  tasks:
   - name: Install list of packages
     package:
       name: ['nano', 'wget', 'vim', 'zip', 'unzip']
       state: latest  


variables:

  1. playbook variables  
  2. runtime variables 
  3. host_vars variables 
  4. group_vars variables

---
vars.yml

- hosts: localhost
   <!-- vars:
    x: 23
    my_age: 23
    my_name: Emmanuel
    my_ht: 6.3 -->
   gather_facts: false
   tasks:
   - debug:
      msg:
       - "The value of x is: {{x}} and type: {{x|type_debug}}"
       - "The value of my_age: {{my_age}} and type : {{my_age|type_debug}}"
       - "The value of my_name : {{my_name}} and type: {{my_name|type_debug}}"
       - "THe value of my_ht is: {{my_ht}} and type : {{my_ht|type_debug}}"
       
vars2.yml      
- hosts: localhost   
  vars:
    name: Emmanuel 
    mypassword: app2@123   
  tasks:
  - name: what is your name  
    debug:
      msg: "{{ name }}"
  - name: your password    
    debug:
      msg: "{{ mypassword }}"
  - name: myclass    
    debug:
      msg: "{{ class }}"

ansible-playbook vars2.yml --extra-vars "mypassword=uatdb123"
ansible-playbook vars2.yml --extra-vars "mypassword=uatdb123" --extra-vars "class=class2023"

vars3.yml
- hosts: localhost      
  tasks:
  - name: your password    
    debug:
      msg: "{{ mypassword }}"

ansible-playbook vars3.yml --extra-vars "mypassword=admin@123"


 mkdir /etc/ansible/web_vars/
 mkdir /etc/ansible/db_vars/
 mkdir /etc/ansible/app_vars/
 mkdir /etc/ansible/all_vars/
 mkdir /etc/ansible/app2_vars/

 vi /etc/ansible/group_vars/all.yml  
 vi /etc/ansible/group_vars/app.yml  
 vi /etc/ansible/group_vars/db.yml 

 mypassword: all@123
 mypassword: app@123


hashicorp VAULT.:
It is use to create and store secrets in hashicorp.


ANSIBLE VAULT.:
=============== 
stores and encrypt confidential or secrets  data.
 [password / sshkeys / tokens / certificates ]   

ansible-vault encrypt /etc/ansible/group_vars/all.yml

ansible-vault decrypt /etc/ansible/group_vars/all.yml
ansible-vault view /etc/ansible/group_vars/all.yml
ansible-vault edit /etc/ansible/group_vars/all.yml
ansible-vault rekey /etc/ansible/group_vars/all.yml
ansible-vault create  /etc/ansible/group_vars/all.yml

ansible@ansible:~$ ansible kops -m ping
ERROR! Attempting to decrypt but no vault secrets found

ansible kops -m ping  
ansible kops -m ping --ask-vault-pass 
ansible kops -m ping --vault-password=vaultpass
ansible kops -a "kubectl get ds" --vault-password=vaultpass
ansible kops -a "kops export kubecfg $NAME --admin"  --vault-password=vaultpass

ansible kops -m shell -a "free -m" --vault-password=vaultpass





Anisble:
Dev-Ops Foundation
    SDLC
  Waterfall - 
  Agile     - Scrum = sprint/1/2/3/4/5/6.../n    
  Dev-Ops automation =   
    Develops  , Tests, Builds, qualification, backup  
     deploys & monitors applications 
     Applications are the output from Softwares development 
SCM/Versioning:
   Git = Versioning
   SVN
   GitHub = SCM [IDEs] READme.md   .gitignore  
   GitLab
   BitBucket
Testing:
   TestNG
   Selenium
CodeQuality:
  SonarCube = IaaS  
   [quality benchmark] [DL <5% /CC>90%/Bugs<1/SHS<1/SMELLS <4]
     Scanner server
     SonarCube server [ db / webServer / searchEngine=ES, CE ]
  SonarCloud = Serverless = SaaS    
  codeChecker

Build: 
java applications  
  Maven [Lifecycle = site/swagger | clean  | default]  
     app.java=print('hello')   app.class [01245312012] JVM  
     default = validate / compile / test  / package / sonar:sonar / deploy / install 
  ANt/Graddle
.net|
  MSBuild.
Artifacts Repository:
  Nexus
  JFrog
Application Servers:
  Tomcat        = java web applications  
  Wildfly/JBoss = java web/enterprise applications 
  java          = java standalone applications 
   users ----> appServers  
   users  ---> WebServers/LB  ----> appServers  
WebServers/LB:
  Self Managed: 
    nginx /apache http/  = apt/yum install nginx httpd  
    Nginx Ingress
    HAProxy
  managed:
    ELB = NLB / ALB   

CI/CD AUTOMATION:
  Jenkins/ 
  CloudBees Jenkins = enterprise version of Jenkins
  Bamboo
  circle CI   
  Travis CI
  CruiseControl
  GitLab  
APM1 = Application Performance Monitoring tools : 
  NewRelic 
  Prometheus/Grafana  
  AppDynamics 
  Nagios
Log mgt and data analytics  :
  EFK/ELK  
  SPLUNK  
CONTAINERISATION:
  Rocket
  CoreOS
  Docker  - 85%
    engine  / cli=docker and docker service/daemon / 
    registry=dockerHub / ECR / Nexus/JFrog / DTR
      docker build
      docker /run/create/start/pull/push/login/ps/ps-a/kill/images
    Dockerfile = List of instructions that will be executed 
                 orderly from top to bottom to create docker images.
                 This file contain key words
                 FROM / CMD/ENTRYPOINT/ RUN/ EXPOSE / COPY/ADD/ENV/etc.       
    BEST PRACTICES: use minimun RUN instructions to create lightweight 
                    use docker official images 
                    use alpine linux where possible  
                    Avoid installation of unnecessary applications
                    use docker-compose file for deployment  
CONTAINER ORCHESTRATION:
   Docker Swarm
   Kubernetes
   OpenShift
Cloud PROVIDERS:
   AWS = 
   AZURE
   GCP
   IBM
   VMWARE 
   aws: 
    server = ec2, rds, 
    Serverless = Lambda, farget / 
    storage=EBS/EFS/S3 
    networking services: vpc / route53 / vpn /
    elb/asg/lc/lt  
    IAM / nACL / SG /    
Infrastructure as a code - IaaC:
   Terraform
   CloudFormation

Configuration Management: - 
Tools:
  Ansible - PUSH -- AGENTLESS 
  Chef - Pull
  Puppet
  SaltStack

Servers:
    UsersMGT
    FilesMGT
    ServicesMGT
    PackagesMGT
Ansible is an open source AGENTLESS :
  Configuration Management tool, 
  deployment tool and/or  
  provisioning tool maintained by Redhat