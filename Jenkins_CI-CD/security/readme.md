# Jenkins security 

### Changing Jenkins default settings: 

Jenkins Default Port = 8080
Jenkins Home Directory = /var/lib/jenkins
Jenkins User = jenkins

`ubuntu server`
```sh
sudo vi /etc/default/jenkins
sudo systemctl restart jenkins
```

`Redhat server`
```sh
sudo vi /etc/sysconfig/jenkins
sudo systemctl restart jenkins
```

### How to create users in Jenkins


