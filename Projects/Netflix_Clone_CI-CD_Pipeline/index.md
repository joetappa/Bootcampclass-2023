---
title: "DevOps Project: Deploy Netflix Clone CI-CD with Monitoring"
parmalink: /
layout: default
---

[CLICK HERE FOR GITHUB REPOSITORY](https://github.com/emortoo/Netflix-Clone.git)

# Steps

## Step 1:  How to Launch an Ubuntu(22.04) T2 Large Instance 

To launch an Ubuntu 22.04 T2 Large instance on AWS, follow these step-by-step instructions:

#### Requirements
+ Name: Jenkins-Server
+ AMI:  Ubuntu 22.04 
+ Instance type:  T2.Large  8GB of RAM.
+ Security Group: 22, and 8080 
+ Storage : 30 gb
+ User Data: [jenkins-ubuntu-user-data](./jenkins-user-data.sh)

1. **Log in to AWS Management Console**:
    - Go to https://aws.amazon.com/ and sign in to your account.

2. **Open EC2 Dashboard**:
    - In the AWS Management Console, find and click on the "Services" dropdown in the top left corner.
    - Select "EC2" from the list of services.

3. **Launch Instance**:
    - On the EC2 Dashboard, click the "Launch Instance" button.

4. **Choose an Amazon Machine Image (AMI)**:
    - In the "Choose an Amazon Machine Image (AMI)" step, search for "Ubuntu" in the search bar.
    - From the list of results, select "Ubuntu Server 22.04 LTS (HVM), SSD Volume Type".

5. **Choose an Instance Type**:
    - In the "Choose an Instance Type" step, select "t2.large" from the list of available instance types.
    - Click the "Next: Configure Instance Details" button.

6. **Configure Instance Details**:
    - Configure the instance details as per your requirements.
    - Once done, click the "Next: Add Storage" button.

7. **Add Storage**:
    - Add storage as per your requirements.
    - Click the "Next: Add Tags" button.

8. **Add Tags**:
    - Add tags if required.
    - Click the "Next: Configure Security Group" button.

9. **Configure Security Group**:
    - Configure the security group settings as per your requirements.
    - Click the "Review and Launch" button.

10. **Review and Launch**:
    - Review all the settings and configurations.
    - Click the "Launch" button.

11. **Key Pair**:
    - A pop-up window will appear asking you to select an existing key pair or create a new one.
    - If you have an existing key pair, select "Choose an existing key pair", select the key pair from the dropdown, and click the "Launch Instances" button.
    - If you need to create a new key pair, select "Create a new key pair", give it a name, download the private key file (.pem), and then click the "Launch Instances" button.

12. **Launch Status**:
    - You will be taken to the launch status page, where you can see the progress of your instance launch.
    - Once the instance is running, click the "View Instances" button to go to the Instances page, where you can see your newly launched instance.



## Step 2: Install Jenkins, Docker, and Trivy. Create a Sonarqube Container using Docker.

### Install Jenkins

1. Update the system packages:

```bash
sudo apt update
```
2. Install Java Development Kit (JDK):

```bash
sudo apt install openjdk-11-jdk -y
```
3. Add the Jenkins repository and install Jenkins:

```bash
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y
```
4. Start the Jenkins service:

```bash
sudo systemctl start jenkins
```
5. Enable Jenkins to start on boot:

```bash
sudo systemctl enable jenkins
```

### Install Docker

1. Update the system packages:

```bash
sudo apt update
```
2. Install the required packages:

```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
```
3. Add Docker’s official GPG key:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
4. Add the Docker APT repository:

```bash
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```
5. Install Docker CE:

```bash
sudo apt update
sudo apt install docker-ce -y
```
6. Add your user to the Docker group:

```bash
sudo usermod -aG docker ${USER}
```

### Install Trivy

1. Download and install Trivy:

```bash
sudo apt-get install -y wget apt-transport-https gnupg lsb-release
wget https://aquasecurity.github.io/trivy-repo/deb/public.key
sudo apt-key add public.key
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy -y
```

### Create a SonarQube Container using Docker

1. Pull the SonarQube Docker image:

```bash
docker pull sonarqube
```

2. Create a Docker volume for SonarQube:

```bash
docker volume create --name sonarqube_data
```

3. Run the SonarQube container:

```bash
docker run -d --name sonarqube -p 9000:9000 -v sonarqube_data:/opt/sonarqube/data sonarqube
```

After these steps, Jenkins, Docker, and Trivy will be installed on your machine, and a SonarQube container will be running in Docker.


## Step 3: Create a TMDB API Key.

1. **Create an Account or Log In**:
    - If you don’t already have a TMDB account, go to [The Movie Database](https://www.themoviedb.org/) and sign up.
    - If you already have an account, log in.

2. **Go to API Settings**:
    - Once logged in, click on your profile icon in the top right corner.
    - From the dropdown, select "Settings".
    - On the settings page, select the "API" tab from the sidebar.

3. **Request an API Key**:
    - Click on the "Request an API Key" button.
    - Select the appropriate option for your use case ("Developer" or "Commercial").
    - Fill in the required information for your application.
    - Read and agree to the API terms of service.
    - Click the "Submit" button.

4. **API Key Creation**:
    - Once your request has been approved, you will receive your API key.
    - The API key will also be available in your API settings page.

5. **Use the API Key**:
    - You can now use the API key to make requests to TMDB's API.

Make sure to keep your API key secret and not expose it publicly. If your API key is compromised, you should regenerate it immediately from your TMDB API settings page.

## Step 4: Install Prometheus and Grafana On the new Server.

1. **Create a user for Prometheus**:
   ```bash
   sudo useradd --no-create-home --shell /bin/false prometheus
   ```

2. **Create necessary directories**:
   ```bash
   sudo mkdir /etc/prometheus
   sudo mkdir /var/lib/prometheus
   ```

3. **Assign ownership to Prometheus user**:
   ```bash
   sudo chown prometheus:prometheus /etc/prometheus
   sudo chown prometheus:prometheus /var/lib/prometheus
   ```

4. **Download Prometheus**:
   ```bash
   cd /tmp
   wget https://github.com/prometheus/prometheus/releases/download/v2.32.0/prometheus-2.32.0.linux-amd64.tar.gz
   tar xvf prometheus-2.32.0.linux-amd64.tar.gz
   ```

5. **Move Prometheus binaries**:
   ```bash
   sudo cp prometheus-2.32.0.linux-amd64/prometheus /usr/local/bin/
   sudo cp prometheus-2.32.0.linux-amd64/promtool /usr/local/bin/
   ```

6. **Change ownership of binaries**:
   ```bash
   sudo chown prometheus:prometheus /usr/local/bin/prometheus
   sudo chown prometheus:prometheus /usr/local/bin/promtool
   ```

7. **Copy consoles and console_libraries**:
   ```bash
   sudo cp -r prometheus-2.32.0.linux-amd64/consoles /etc/prometheus
   sudo cp -r prometheus-2.32.0.linux-amd64/console_libraries /etc/prometheus
   ```

8. **Change ownership of consoles and console_libraries**:
   ```bash
   sudo chown -R prometheus:prometheus /etc/prometheus/consoles
   sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
   ```

9. **Create Prometheus configuration file**:
   ```bash
   sudo nano /etc/prometheus/prometheus.yml
   ```

10. **Edit the configuration file**:
    Paste the following configuration:
    ```yaml
    global:
      scrape_interval: 15s

    scrape_configs:
      - job_name: 'prometheus'
        static_configs:
          - targets: ['localhost:9090']
    ```
    Save and exit.

11. **Change ownership of the configuration file**:
    ```bash
    sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml
    ```

12. **Create a systemd service file for Prometheus**:
    ```bash
    sudo nano /etc/systemd/system/prometheus.service
    ```

13. **Edit the systemd service file**:
    Paste the following configuration:
    ```ini
    [Unit]
    Description=Prometheus
    Wants=network-online.target
    After=network-online.target

    [Service]
    User=prometheus
    Group=prometheus
    Type=simple
    ExecStart=/usr/local/bin/prometheus \
      --config.file /etc/prometheus/prometheus.yml \
      --storage.tsdb.path /var/lib/prometheus/ \
      --web.console.templates=/etc/prometheus/consoles \
      --web.console.libraries=/etc/prometheus/console_libraries

    [Install]
    WantedBy=multi-user.target
    ```
    Save and exit.

14. **Reload systemd**:
    ```bash
    sudo systemctl daemon-reload
    ```

15. **Start Prometheus**:
    ```bash
    sudo systemctl start prometheus
    ```

16. **Enable Prometheus to start on boot**:
    ```bash
    sudo systemctl enable prometheus
    ```

### Install Grafana

1. **Install Grafana**:
   ```bash
   sudo apt-get install -y software-properties-common
   sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
   sudo wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
   sudo apt-get update
   sudo apt-get install grafana
   ```

2. **Start Grafana**:
   ```bash
   sudo systemctl start grafana-server
   ```

3. **Enable Grafana to start on boot**:
   ```bash
   sudo systemctl enable grafana-server
   ```

After these steps, you should have Prometheus running on port 9090 and Grafana running on port 3000 on your server.

## Step 5: 
Install the Prometheus Plugin and Integrate it with the Prometheus server.

## Step 6: 
Email Integration With Jenkins and Plugin setup.

## Step 7: 
Install Plugins like JDK, Sonarqube Scanner, Nodejs, and OWASP Dependency Check.

## Step 8: 
Create a Pipeline Project in Jenkins using a Declarative Pipeline.

## Step 9: 
Install OWASP Dependency Check Plugins.

## Step 10: 
Docker Image Build and Push.

## Step 11: 
Deploy the image using Docker.

## Step 12: 
Kubernetes master and slave setup on Ubuntu (20.04).

## Step 13: 
Access the Netflix app on the Browser.

## Step 14: 
Terminate the AWS EC2 Instances.

Now, let’s get started and dig deeper into each of these steps:
