# Declarative Pipeline in Jenkins:


### Pipeline syntex

pipeline{
  agent any 
  tools {}
  options{}
  triggers{}
  stages {}
  post{}
}

#### Example 

```sh
pipeline {
    agent any
        tools {
             maven '3.9.5'
        }
    stages {
        stage('1. CloneCode') {
            steps{
                sh "echo 'cloning the latest application version' "
                git branch: 'main', url: 'https://github.com/unitedcoresystems/maven-web-application.git'
                sh "echo 'latest application version available for testing and build' "
            }
        }
        stage('2. MavenBuild') {
            steps{
                sh "echo 'running JUnit-test-cases' "
                sh "echo 'testing must passed to create artifacts ' "
                sh "mvn clean package" 
            }
        }
        stage('3. CodeQualityAnalysis') {
            steps{
                sh "echo setup sonarQube authentication"
                sh "echo 'Perfoming CodeQualityAnalysis' "
                sh "mvn sonar:sonar"      
            }
        }
        stage('4. UploadArtifacts') {
            steps{
                sh "echo configure nexus authentication"
                sh "mvn deploy"
                sh "echo artifacts uploaded"
            }
        }
        stage('5. Deploy') {
            steps{
                deploy adapters: [tomcat9(credentialsId: 'tomcat-credentials', path: '', url: 'http://18.116.240.90:8080/')], contextPath: null, onFailure: false, war: 'target/*.war'
            }
        }
    }
}
```