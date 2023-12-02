# How to setup Master Node 

**Note** This Steps Is Only For Kubernetes Master

### 1. Switch to the root user.
```sh
sudo -i
```
### 2. Initialize Kubernates master by executing below commond.
```sh
kubeadm init
```

### 3. Configure kubectl exit as root user & exeucte as normal ubuntu user
```sh
exit
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

### To verify, if kubectl is working or not, run the following command.
```sh
kubectl get pods -o wide -n kube-system
```

### 4. You will notice from the previous command, that all the pods are running except one: ‘core-dns’. For resolving this we will install a # pod network addon like Calico or Weavenet ..etc. 

**Note:** Install any one network addon dont install both. Install either weave net or calico.

**To install Weaven net run the following command.**
```sh
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
```

Or To install the calico network addon, run the following command:

```sh
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml 
```

### 5. How to Get token
```sh
kubeadm token create --print-join-command
```

#### 6. How to deploy Sample Application into kubenetes cluster

**Deploy Nginx Application**
```sh
kubectl run nginx-demo --image=nginx --port=80 
kubectl expose pod nginx-demo --port=80 --target-port=80 --type=NodePort
```

**Get Node Port details**
```sh
kubectl get services
kubectl get nodes
kubectl get pods 
kubectl get pods --all-namespaces
```
