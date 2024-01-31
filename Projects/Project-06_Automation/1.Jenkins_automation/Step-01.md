# INSTALL AND CONFIGURE JENKINS SERVER

Step 1 – Install Jenkins server

1. Update the AWS Server , set hostname and set timezone on "Jenkins-Server"

```
sudo apt update -y
sudo hostnamectl set-hostname jenkins-server
sudo timedatectl set-timezone America/New_York
```

2. Install JDK (since Jenkins is a Java-based application)

```
sudo apt install openjdk-17-jre -y
```

3. Install Jenkins

```
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install jenkins -y 
```

4. Enable and start jenkins

```
sudo systemctl enable jenkins
sudo systemctl start jenkins

```

Make sure Jenkins is up and running

```
sudo systemctl status jenkins
```

4. By default Jenkins server uses TCP port 8080 – open it by creating a new Inbound Rule in your EC2 Security Group

![6012](https://user-images.githubusercontent.com/85270361/210151779-4467072e-8a07-46e6-951b-5176e067c110.PNG)


5. Perform initial Jenkins setup.
From your browser access http://Jenkins-Server-Public-IP-Address-or-Public-DNS-Name:8080

You will be prompted to provide a default admin password

  
![6013](https://user-images.githubusercontent.com/85270361/210151821-9b9baaf6-e89c-4a9b-b06a-c2c1d6e01930.PNG)

  
Retrieve it from your server:
  
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
  
Then you will be asked which plugings to install – choose suggested plugins.
 

![6014](https://user-images.githubusercontent.com/85270361/210151862-fee4be20-f6b3-4c3b-9830-78ce4a28253b.PNG)

  
Once plugins installation is done – create an admin user and you will get your Jenkins server address.

The installation is completed!
  

![6015](https://user-images.githubusercontent.com/85270361/210151901-28354c74-518a-49d6-85bd-ab7b98c7f419.PNG)
  
