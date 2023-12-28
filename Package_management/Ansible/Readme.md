**Ansible Installation**

- Ansible is designed to run on Unix/Linux systems, therefore Windows systems aren’t
supported for the control node.
- Ansible is python based and therefore the control node and the managed nodes need to
have python2 or python3 installed on them.

- Ansible can be installed in three ways:
    - Using yum or apt
    - Using pip
    - Using compile file
  
    https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

**Installing Ansible on Ubuntu**

Create a new user - ansible 
```
   sudo adduser ansible 
   sudo hostname ansible 
```
Add user - ansible to sudoers file and swtich to ansible user 
```
   echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible 
   sudo su - ansible 
```
Add repository
```
   sudo apt-add-repository ppa:ansible/ansible 
```
Install Ansible 
```
   sudo apt install ansible -y
```
Change ownership of Ansible home directory 
```
sudo chown ansible:ansible -R /etc/ansible 
```
**Ansible installation on REDHAT EC2**

```
   sudo useradd ansible 
   sudo hostname ansible 
   echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible 
   sudo su - ansible # Enable PassowrdLogin and assign password to ansible user 
   sudo yum install python3 -y 
   sudo alternatives --set python /usr/bin/python3 
   sudo yum install python3-pip -y 
   pip3 install ansible --user
```

**Script to add user, password and enable password authentication**
```
#!/bin/bash
 sudo useradd -d /home/ansible -s /bin/bash -m ansible
 sudo echo "ansible:ansible" | chpasswd
 sudo echo "ansible  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible
 sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
 sudo service sshd restart
```

