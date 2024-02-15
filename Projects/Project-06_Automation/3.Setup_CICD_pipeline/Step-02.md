# Ansible and Tomcat Deployment

To accomplish the deployment of Tomcat using Ansible and then ensure its integration with an NFS server, follow these detailed steps:


### Step 1: Create an Ansible Playbook for Tomcat Installation

1. **Create a YAML file** (e.g., `install-tomcat.yml`) create your playbook to your and define the necessary tasks to install Tomcat. 

- Click [here](tomcat/install-tomcat.yml) to copy playbook to your playbook folder. 
- Click [here](tomcat/configure-tomcat.yml) to copy playbook to your playbook folder. 
- Click [here](tomcat/tomcat-users.xml) to copy playbook to your playbook folder. 


### Step 2: Execute the Playbook on your jenkins-ansible server

- change directory to /var/lib/jenkins/jobs/ansible-config-mgt/builds/build-number/archive

  ```bash
 cd /var/lib/jenkins/jobs/ansible-config-mgt/builds/build-number/archive
  ```

- Run this playbook to install Tomcat on webservers using the `ansible-playbook` command:

  ```bash
ansible-playbook -i Inventory/dev.yml Playbook/tomcat/install-tomcat.yml
  ```
replace the `build-number` with your build number in jenkins 

- Run this playbook to configure Tomcat on webservers:

 ```bash
ansible-playbook -i Inventory/dev.yml Playbook/tomcat/configure-tomcat.yml
  ```

### Step 3: Verify Tomcat Installation

- Confirm Tomcat is running by accessing `http://server_ip:8080` on your web browser, replacing `server_ip` with the actual IP address of one of your webservers.

### Step 4: Integrate with NFS for the `webapps` Directory

1. **Mount the NFS directory** on your webservers. First, ensure the NFS is on and running 

2. Create a mount point and mount the NFS share:

   ```bash
   sudo mkdir -p /mnt/nfs/webapps
   sudo chown -R nobody:nobody  /mnt/nfs/webapps
   sudo chmod -R 777 /mnt/nfs/webapps
   ```

   ```bash
   sudo mount nfs_server:/mnt/apps /mnt/nfs/webapps
   ```
   Replace `nfs_server` with the actual NFS server private ip address.

3. To ensure the mount persists across reboots, copy the follow onto your nptepad add replace the nfs_server with your private ip address and paste it to `/etc/fstab`:

    vi /etc/fstab 
   ```
   nfs-server-private-ip:/mnt/apps /mnt/nfs/webapps nfs defaults 0 0
   ```
   Replace ` nfs-server-private-ip` with the actual NFS server private ip address.

4. **Symlink the Tomcat `webapps/target` directory** to the NFS-mounted directory:

   - Verify that target is in the /mnt/nfs/webapps directory

    ```bash
   ll /mnt/nfs/webapps
   ```
   - Create symlink target is in the /opt/tomcat10/webapps directory

   ```bash
   sudo ln -s /mnt/nfs/webapps/target /opt/tomcat10/webapps
   ```

5. **Restart Tomcat** to apply the changes.

  ```bash
  sudo systemctl restart tomcat
  ```

### Step 5: Verify Application is Running on Tomcat

 1. **Verify** on your webserver 

  ```bash
  curl -v localhost:8080/target/crispy
  ```

- Confirm if the crispy.war is running by accessing `http://server_ip:8080/target/crispy` on your web browser, replacing `server_ip` with the actual IP address of one of your webservers.

 