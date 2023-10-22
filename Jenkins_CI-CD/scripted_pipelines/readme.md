# Scripted Pipeline in Jenkins:
=========================

### Pipeline syntex

node{
  stage('1. CodeClone'){} 
  stage('2. MavenBuild'){}
  stage('3. CodeQualityAnalysis'){} 
  stage('4. UploadArtifacts'){}  
  stage('5. Deploy2UAT'){}  
  stage('6. ManualApproval'){}  
  stage('7. Deploy2Prod'){} 
} 

#### Example 

```sh
node {
    def mavenHome = tool name: '3.9.5'

        stage('1. CodeClone') {
            git branch: 'main', url: 'https://github.com/unitedcoresystems/maven-web-application.git'  
        }
        
        stage('2. MavenBuild') {
            sh "${mavenHome}/bin/mvn package"
        }

        stage('3. CodeQualityAnalysis') {
             sh "${mavenHome}/bin/mvn sonar:sonar"
        }

        stage('4. Upload2Nexus') {
             sh "${mavenHome}/bin/mvn deploy"
        }

        stage('5. Deploy2UAT') {
            deploy adapters: [tomcat9(credentialsId: 'tomcat-cre', path: '', url: 'http://18.116.240.90:8080/')], contextPath: null, onFailure: false, war: 'target/*.war'
        }

        stage('6. ManualApproval') {
            sh "echo 'ready for review' "
            timeout(time:5, unit:'HOURS') {
                input message: 'Application ready for deployment, Please review and approve'
            }
        }

        stage('7. Deploy2Prod') {
            deploy adapters: [tomcat9(credentialsId: 'tomcat-cre', path: '', url: 'http://18.116.240.90:8080/')], contextPath: null, onFailure: false, war: 'target/*.war'
        }

        stage('8. Notification') {
            emailext body: 'this is to notify the teams', recipientProviders: [contributor(), developers(), upstreamDevelopers()], subject: 'united-Zelle-App', to: 'isaac.ntim@unitedcoresystem.com'
        }

       stage('9. SlackNotify') {
            echo 'Slack Notifications'
                slackSend (
                channel: '#jenkins',
                color: COLOR_MAP[currentBuild.currentResult],
                message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} \n build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
                )
        }
}
```