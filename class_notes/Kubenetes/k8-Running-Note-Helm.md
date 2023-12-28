# HELM
-------------------------------

### What is helm ?
  - Helm is a package manager for Kubernetes applications. We deploy workloads in kubernetes using kubernetes objects declared in manifests files:
  
  - Springboot App  
     - deployment
     - service 
     - ingress 
     - hpa 
     - secrets  
     - configmaps 

 - mongodb Stateful database application:
     - deployment 
     - service 
     - ingress 
     - hpa 
     - secrets  
     - configmaps 
     - persistentvolumes  
     - persistentvolumeclaims 
     - StatefulSets

 **Example of custom Applications** 
 - Custom applications: 
    - spring-boot-app  
    - java-web-app  
    - united-web-app 
    - python-flask-app  
    - node-js-app  
    
 **Example of third party Applications** 
  Third party applications:
    - mongo # database application 
    - mysql # database application
    - jenkins  # CI/CD tool 
    - metrics-server 
    - csi drivers  # Elastic Block Store (EBS) CSI drivers   
    = CNI Plugins/Add-ons:
      vpc-cni 
      weave 
      calico 
      Flannel  
    - nginx-ingress 
    - RBAC:
      clusterrole and clusterrolebinding   
      Role  and RoleBinding  
      serviceaccount

### What is a package manager
Example of Package managers 
   maven Installation1:  
    https://github.com/unitedcoresystems/Bootcampclass-2023/tree/main/Package_management/Maven_installation

 maven Installation2: 
    sudo apt install maven -y   

we use package managers to install packages:
  apt /  = package manager for ubuntu/debian
  yum /  = package manager for redhatOS/centOS  
  dnf /  = package manager for redhatOS/centOS 
  rpm /  = package manager for redhat 
  choco / = package manager for windows OS
  pip-python-pip = package manager FOR PYTHON  
  homebrew = package manager for macOS  

### How does helm simplify deployment ? 
 - Helm is a package manager for kubernetes that simplifies the deployment of workloads in kubernetes by using   
 
  - Helm cli: = It's a command line interface used to work with packages to install upgrade or uninstall 

             helm install name app/unitedapp /
             helm upgrade unitedapp app/springapp  /
             helm uninstall unitedapp
             helm add repo url 
             kubectl apply app.yml       

  - Helm charts: are packaged kubernetes manifest files organised in a directory format that can be reused
  
  - Helm repository: 

### What is Helm Architecture ?
Helm 3 Architecture:
helm 2 Architecture: 

### How to Install Helm 3 ?
--------------
```sh
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```
### How to deploy application using helm ? 
 -  Create deployment manifests (helm charts) for myapp
$ sudo apt install tree # install tree to be able to view Helm in a tree format using the command:
$ mkdir app && cd app 
$ helm create myapp 
$ tree

myapp
    ├── Chart.yaml
    ├── charts
    ├── templates
    │   ├── NOTES.txt
    │   ├── _helpers.tpl
    │   ├── deployment.yaml
    │   ├── hpa.yaml
    │   ├── ingress.yaml
    │   ├── service.yaml
    │   ├── serviceaccount.yaml
    │   └── tests
    │       └── test-connection.yaml
    └── values.yaml



### What is a Chart.yaml: 
 - The Chart.yaml file is typically found at the root of a Helm chart, and it contains important metadata about the chart. 

 Here are some of the key fields you might find in a Chart.yaml file:

   - name: The name of the chart.
   - version: The version of the chart.
   - description: A short description of the chart.
   - keywords: Keywords that describe the chart.
   - maintainers: Information about the maintainers of the chart, including names and contact information.
   - sources: URLs or references to the source code or additional documentation.
   - dependencies: A list of dependencies that the chart relies on.
   - apiVersion: The API version of the chart format.
 
### What is a values.yaml file:
  - The values.yaml file in Helm is a YAML file that contains default values for configuration settings used by a Helm chart. 
  - Helm charts are packages of pre-configured Kubernetes resources, and the values.yaml 
  file provides a way to customize the behavior of those resources without modifying the chart itself.
  - When you install a Helm chart, you can override default configuration values by providing your own values.yaml file or by specifying individual values using the --set option with the helm install command.

  Here's a simple example of a values.yaml file:
yaml
Copy code

#### Example of a values.yaml
replicaCount: 3
image:
  repository: nginx
  tag: stable
  pullPolicy: IfNotPresent
service:
  name: my-service
  type: ClusterIP
  port: 80
   
  - $ Helm show values

### What is a Template file:
 - In Helm, a template refers to a file that contains a combination of Kubernetes YAML and Helm-specific templating constructs. 
 - Templates in Helm are used to define the structure and configuration of Kubernetes resources that will be deployed when you install a Helm chart
 
  - $ Helm show template
  
# Cluster IP  Service
apiVersion: v1
kind: Service
metadata:  
  name: my-clusterip-service
spec:
  selector:    
    app: nginx
  type: ClusterIP
  ports:  
  - name: http
    port: 80
    targetPort: 80
    protocol: TCP
    
ubuntu@ip-10-0-0-24:~$ cat app/myapp/templates/service.yaml

apiVersion: v1
kind: Service
metadata:
  name: {{ include "myapp.fullname" . }}
  labels:
    {{- include "myapp.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "myapp.selectorLabels" . | nindent 4 }}

### What is Helm Chart Repos ?
 - Chart repository is a location where packaged charts can be stored and shared
 - The official chart repository is maintained by the Kubernetes Charts, but Helm also makes it easy to create and run your own chart repository

Helm repository:
  https://artifacthub.io/
 
 Adding helm repos
  helm repo add stable https://charts.helm.sh/stable
• helm repo add bitnami https://charts.bitnami.com/bitnami
• helm repo list
• helm repo remove <repo-name>

Search for charts
• helmrepoupdate
• helm search repo mysql

### How to install nginx using helm Demo - 1
helm repo add bitnami https://charts.bitnami.com/bitnami 
helm repo update
helm install my-nginx bitnami/nginx 
helm uninstall my-nginx 

### How to Install nginx-ingress using helm --Demo 2
install nginx-ingress using helm:
 https://kubernetes.github.io/ingress-nginx  
  
  Add repository:
     helm repo add nginx https://kubernetes.github.io/ingress-nginx  
     helm repo add ingress https://kubernetes.github.io/ingress-nginx

  deploy: 
     helm upgrade --install ingress-nginx ingress-nginx \
     --repo https://kubernetes.github.io/ingress-nginx \
     --namespace ingress-nginx --create-namespace


### How to install metrics-server -- Demo --3
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm install metrics-server metrics-server/metrics-server 
helm install metrics-server metrics-server/metrics-server -n kube-system  
helm install metrics-server metrics-server/metrics-server -n dev 

### Helm Commands 
helm create myapp    = renders manifest files  
helm install         =# will deploy applications
helm uninstall       =# will undeploy applications
helm upgrade   =# will rollout new versions deployments of applications
helm ls    =# List deployments
helm repo ls
helm repo rm nginx
helm search repo nginx  # searches number of deploys
helm template nginx-stable/nginx-ingress    # review charts
helm show values nginx/nginx-ingress   # show values/varaiables
helm repo update
    2a

### How to use helm to install and deploy:
  P/G  
  EFK  
  Rancher    
