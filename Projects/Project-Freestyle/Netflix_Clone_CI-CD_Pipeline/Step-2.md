# Step 2: How to install Jenkins, Docker, and Trivy and Create a Sonarqube Container using Docker.

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