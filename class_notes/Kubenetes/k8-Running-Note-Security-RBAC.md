Security Best Practices for Kubernetes Deployment   :
=======================================================

### What are some best Practices for Kubernetes ? 

https://kubernetes.io/blog/2016/08/security-best-practices-kubernetes-deployment/

## 1. Ensure That Only Authorized Images are Used in Your Environment. 
### What are some Authorized Images registry ?
      DockerHub  --- for docker images  
      AMAZON ECR  --- AWS 
      Nexus/JFrog
      Azure 
      Google 


## 2. Limit Direct Access to Kubernetes Nodes.  
### How do we limit access to Kubernetes Nodes ?
      Limit from using the following 
       - Kubectl run/apply/create
       - kubectl get/decribe/edit/update/label/delete
       - Cluster-->Nodes-->Pods



## 3. Create Administrative Boundaries between Resources. 
### How do we Create Administrative Boundaries between Resources?

    $ kubectl create ns dev 
      Developers --> dev-nameSpace
      
    $ kubectl create ns QA 
      QA / Testing --> staging/testing-nameSpace
      
    $ kubectl create ns QA 
      Sr. Engineers --> Cluster



## 4. Define Resource Quota.
### How do we define resource quota in our Kubernetes cluster ?
 example : 
 
      apiVersion:
      kind: ResourceQuota
      metadata:
         namespace: dev-nameSpace
         name: dev-resources
      spec:
      - resources:
         cpu: 4Gi
         mem: 128Mi 
         pods: 20

## 5. Implement Network Segmentation. 
### How do we implement network segmentation in our Kubernetes cluster ?

     login pod ---> login svc 
     app pod  ---> app svc 
     checkout ---> checkout svc 


## 6. Apply Security Context to Your Pods and Containers.
### How do we apply security context
Security Context Setting	                Description
SecurityContext->runAsNonRoot:	            Indicates that containers should run as non-root user
SecurityContext->Capabilities:	            Controls the Linux capabilities assigned to the container.
SecurityContext->readOnlyRootFilesystem:	Controls whether a container will be able to write into the                                                 root filesystem.
PodSecurityContext->runAsNonRoot:	        Prevents running a container with 'root' user as part of the                                               pod
example :
```sh 
apiVersion: v1  
kind: Pod  
metadata:  
  name: hello-world  
spec:  
  containers:  
  # specification of the pod’s containers  
  # ...  
  securityContext:  
    readOnlyRootFilesystem: true  
    runAsNonRoot: true
```

## 7. Log Everything. 
### How do we Log Everything ?

     When a cluster is created, the standard output and standard error output of each container can be ingested using a Fluentd agent running on each node into Elasticsearch and viewed with Kibana.EFK
     
     Installing log metric applications like Kibana.EFK


## Kubernetes Role Based Access Control (RBAC):

When a request is sent to the API Server, it first needs to be authenticated (to make sure the requestor is known by the system) before it’s authorized (to make sure the requestor is allowed to perform the action requested).

 #### what is a request ? 
    these are examples of: 
        
        kubectl get
        kubectl run 
        kubectl delete 
        kubectl create 


#### Introduction to RBAC 
Role Base Access Control (RBAC) :  is a way to define which users can do what within a Kubernetes cluster.

 Mark ---> Dev --> 
 Jonas --> Dev 
 
 apiVersion:
      kind: ResourceQuota
      metadata:
         namespace: dev-nameSpace
         name: dev-resources
      spec:
      - resources:
         cpu: 4Gi
         mem: 128Mi 
         pods: 20
 
 Eric ---> DevOps
 Mimi ---> snr. DevOps
 Angel ---> Devops-associate 
 
 
  RBAC:
     authentication: 
     authorisation:

 ### How can we allow Angel from devops, to have access only to some resources that are in the devOps namespace and nothing else.
  
  To achieve this type of role based access, we use the concept of Authentication and Authorization in Kubernetes.

**note** : users must have limited access to your Kubernetes cluster


 ### What are type of users we need to access to a Kubernetes cluster? 
Broadly, there are three kinds of users that need access to a Kubernetes cluster:

 #### 1.	Developers/Admins/Engineers:
Users that are responsible to do administrative or developmental tasks in the cluster. This includes operations like upgrading the cluster or creating the resources/workloads in the cluster.

 #### 2.	End Users:

Users that access the applications deployed on our Kubernetes cluster. Access restrictions for these users are managed by the applications themselves. For example, a web application running on Kubernetes cluster, will have its own security mechanism in place, to prevent unauthorized access.
        
        users--->BOA.com[app.com--LB]-->NODE-->ingress-->app-svc-->app-pod

 #### 3.	Applications/Bots:
There is a possibility that other applications may need  access to Kubernetes cluster, typically to talk to resources or workloads inside the cluster. Kubernetes facilitates this by using Service Accounts.
              
   EKS Cluster --> IAM
              Create a role 
              Assign roles 

   Ingress--> ServiceAccount  
              Role 
              RoleBinding 

## RBAC in Kubernetes is based on three key concepts:

1.	Verbs: This is a set of operations that can be executed on resources. There are many verbs, but they’re all Create, Read, Update, or Delete (also known as CRUD).

2.	API Resources: These are the objects available on the clusters. They are the pods, services, nodes, Persistent Volumes and other things that make up Kubernetes.

3.	Subjects: These are the objects (Users, Groups, Processes(Service Account)) allowed access to the API, based on Verbs and Resources.
 
 RBAC:
 
     Authentication (Identity)
           x-509 certificate
            LDAP
            IAM -EKS

    Authorization (permission)
            role 
            role binding 
            clusterrole 
            clusterrolebinding 
 
 ### What is role ? 
A role is a set of permissions that defines rules for accessing and interacting with resources within a cluster. A Role is part of the Role-Based Access Control (RBAC) system in Kubernetes, which allows administrators to define fine-grained access control policies for users and service accounts
    
 Example Role :
```yml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  namespace: Dev
  name: deployment-manager
rules:
- apiGroups: ["*", "extensions", "apps"]   # v1, apps/v1, pods and services 
  resources: ["deployments", "replicasets", "pods"]
  verbs: ["get", "list", "watch", "create", "update", "patch", "delete"] # You can also use ["*"]
``` 
 ### what is role binding ? 
In Kubernetes, a RoleBinding is an object that binds a set of permissions defined in a Role to a specific set of users or service accounts. RoleBinding is part of the Role-Based Access Control (RBAC) system in Kubernetes, which enables administrators to control access to resources within the cluster.
  
Example Role :  
```yml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  name: deployment-manager-binding
  namespace: Dev
subjects:
- kind: User
  name: employee
  apiGroup: "*"
roleRef:
  kind: Role
  name: deployment-manager
  apiGroup: ""
 ```

### RBAC Role

A Role example named example-role which allows access to the mynamespace with get, watch, list, etc. operations:

kind: Role
apiVersion: rbac.authorization.k8s.io/v1 
metadata:
  namespace: mynamespace
  name: example-role # Eric
rules:
- apiGroups: [""] #v1
  resources: ["pods"]
  verbs: ["get", "watch", "list"]

In the rules above we:
1.	apiGroups: [""] – set core API group
2.	resources: ["pods"] – which resources are allowed for access
3.	["get", "watch", "list"] – which actions are allowed over the resources above


 ### RBAC RoleBingding
To “map” those permissions to users we are using Kubernetes RoleBinding, which sets example-role in the mynamespace for the example-user user:
 
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1 
metadata:
  name: example-rolebinding 
  namespace: mynamespace 
subjects:
  -	kind: User
    name: example-user # Eric
    apiGroup: rbac.authorization.k8s.io 
roleRef:
    kind: Role
    name: example-role
    apiGroup: rbac.authorization.k8s.io


Here we set:

	subjects:
	kind: User – an object type which will have access, in our case this is a regular user
	name: example-user – a user’s name to set the permissions
	roleRef:
	kind: Role – what exactly will be attached to the user, in this case, it is the Role object type
	name: example-role – and the role name as it was set in the name: example- role in the example above

DEMO
================================
```sh
kubectl get configmap 
```
-result 
NAME               DATA   AGE
kube-root-ca.crt   1      17h

```sh
kubectl get configmap -n kube-system
```
-result 
NAME                                 DATA   AGE
coredns                              1      17h
coredns-autoscaler                   1      17h
extension-apiserver-authentication   6      17h
kops-controller                      1      17h
kops-controller-leader               0      17h
kube-root-ca.crt                     1      17h
weave-net                            0      17h

### How to check permmisions in my cluster ? 
 
```sh
  kubectl auth can-i delete pod
  kubectl auth can-i create svc 
```

### How to check permmisions for superusers/admin in my cluster ? 

```sh
  kubectl auth can-i "*" "*"
```
iam a superuser / Super Admin 

=======================================================
DEMO - 2 
=======================================================

Create a new user for EKS cluster 
name : Angel 
policy : list/read/write 

we will reqiure the following 
 1. ARN :   arn:aws:iam::914620596401:user/Angel
 2. Access Key ID : AKIA5J45CYCYSADFZCUG
 3. Secret Key : 
 
### How can i add user to my aws EKS Cluster and Authorisation users in my cluster ? 
 ? 

As a Admin:
=============

1) Create IAM User With Policy to List & Read EKS Cluster to get Kube Config File in AWS IAM Console.


2) Edit aws-auth to add userarn to aws-auth configmap
 
```sh 
kubectl get configmap -n kube-system
```
aws-auth

```sh
kubectl edit configmap aws-auth -n kube-system
```
Add the following information 

```yml
mapUsers: |
    - userarn: arn:aws:iam::914620596401:user/Angel
      username: Angel
```
final file should look like this : 

```yml
apiVersion: v1
data:
  mapRoles: |
    - groups:
      - system:bootstrappers
      - system:nodes
      rolearn: arn:aws:iam::914620596401:role/EKS-Worker-Nodes
      username: system:node:{{EC2PrivateDNSName}}
  mapUsers: |
    - userarn: arn:aws:iam::914620596401:user/Angel
      username: Angel
kind: ConfigMap
metadata:
  creationTimestamp: "2023-12-11T22:24:32Z"
  name: aws-auth
  namespace: kube-system
  resourceVersion: "40851"
  uid: 25a89b03-afb9-4fbd-803c-7f43558026cf
``` 
3) Create a role and rolebiniding file

vi dev-roles.yaml

```yml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  namespace: default
  name: readonly
rules:
- apiGroups: [""]  # For core group (v1), e.g., pods, services
  resources: ["pods"]
  verbs: ["get", "list"]
- apiGroups: ["apps"]  # For apps group, e.g., apps/v1
  resources: ["deployments", "replicasets", "daemonsets"]
  verbs: ["get", "list"]  # You can also use ["*"] for all verbs

---
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: full_access_role_binding
  namespace: default
subjects:
  - kind: User
    name: Angel
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: readonly
  apiGroup: rbac.authorization.k8s.io

```

 
### How can we access AWS cli and access EKS Cluster? 

Client Side:
===========
1) Install Kubectl & AWS CLI.

- install kubectl 
     
    ```sh
       curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
       
       sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
       kubectl version --client
    ```
- install awscli 
  ubuntu 
    sudo apt update -y
    sudo apt install awscli -y 
 
  Redhat 
    sudo yum update -y
    sudo yum install awscli -y 
      
    or 
    
    ubuntu:
    
    sudo apt update -y
    sudo apt install unzip wget -y
    sudo curl https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o awscli-bundle.zip
    sudo apt install unzip python -y
    sudo unzip awscli-bundle.zip
    sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
    
    redhat:
    
    sudo yum update -y
    sudo yum install unzip wget -y
    sudo curl https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o awscli-bundle.zip
    sudo yum install unzip python -y
    sudo unzip awscli-bundle.zip
    sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

2) Configure AWS CLI(With Access Key & Secret Key of IAM User which you created in AWS IAM)

    aws configure 
   
    Access Key ID : AKIA5J45CYCYSADFZCUG        # replace with your Access key 
    Secret Key : 9ZHF8DXNdqThgjhHYnGlZvPnW6Y3EgC0V3VKiZd  # replace with your secret key 

3) Get Kube-config file

   aws eks update-kubeconfig --name <EKSClusteName> --region <regionName>
   
   ```sh
   aws eks update-kubeconfig --name EKS-Cluster --region us-east-1
   ```
    
4) Execute eks and kubectl commands to access eks cluster
    
    aws eks list-clusters
    kubectl get pods
    
    If you want to know what a user can do, Run the following:
    
    kubectl auth can-i delete pods   response=yes or No
    kubectl auth can-i create service
    kubectl auth can-i create "*".  #Can a user do everything on the server?
    kubectl auth can-i '*' '*'    # am i a superuser

==================================================
END OF DEMO 
====================================================


Role vs ClusterRole

Alongside with the Role and ClusterRole which are set of rules to describe permissions –
Kubernetes also has RoleBinding and ClusterRoleBinding objects.

The difference is that Role is used inside of a namespace, while ClusterRole is cluster-wide permission without a namespace boundaries, for example:
	allow access to a cluster nodes
	resources in all namespaces
	allow access to endpoints like /health

A ClusterRole looks similar to a Role with the only difference that we have to set its kind as ClusterRole:

kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1 
metadata:
  name: example-clusterrole 
  rules:
  -	apiGroups: [""]
resources: ["pods"]
verbs: ["get", "watch", "list"]

And a ClusterRoleBinding example:

kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1 metadata:
name: example-clusterrolebinding 
subjects:
- kind: User
  name: example-user
  apiGroup: rbac.authorization.k8s.io 
roleRef:
  kind: ClusterRole
  name: example-clusterrole 
  apiGroup: rbac.authorization.k8s.io


Keep in mind that once you’ll create a Binding you’ll not be able to edit its roleRef value – instead, you’ll have to delete a Binding and recreate 

•	Kubernetes uses RBAC to control different access levels to its resources depending on the rules set in Roles or ClusterRoles.

•	Roles and ClusterRoles use API namespaces, verbs and resources to secure access.
•	Roles and ClusterRoles are ineffective unless they are linked to a subject (User, serviceAccount...etc) through RoleBinding or             ClusterRoleBinding.
•	Roles work within the constraints of a namespace. 
    It would default to the “default” namespace if none was specified.
•	ClusterRoles are not bound to a specific namespace as they apply to the cluster as a whole.

Roles are assigned to a specific name space
ClusterRoles are assigned to the entire Cluster.


## Create Role/ClusterRole & RoleBinding & ClusterRoleBinding
===========================================================

kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  namespace: default
  name: readonly
rules:
- apiGroups: [""]    # V1 = pods, services
  resources: ["pods","services"]
  verbs: ["get","list","create","delete","update"]
- apiGroups: ["apps"]
  resources: ["deployments","replicasets","daemonsets"]
  verbs: ["get","list"]
---
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: full_access_role_binding
  namespace: default
subjects:
- kind: User
  name: Angel                           # Map with username
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: readonly
  apiGroup: rbac.authorization.k8s.io

================
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  namespace: default
  name: readonly
rules:
- apiGroups: [""]  # v1 = pods services
  resources: ["*"]
  verbs: ["*"]
- apiGroups: ["apps"]
  resources: ["deployments","replicasets","daemonsets"]
  verbs: ["get","list"]
---
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: full_access_role_binding
  namespace: default
subjects:
- kind: User
  name: Bode
- kind: User
  name: Issac
 # Map with username
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: readonly
  apiGroup: rbac.authorization.k8s.io






   
   

