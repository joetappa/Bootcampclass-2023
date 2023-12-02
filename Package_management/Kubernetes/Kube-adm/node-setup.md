# How to setup woker Node 

**Note** This Steps Is Only For Kubernetes worker nodes

### How to add Worker Machines to Kubernates Master

Copy kubeadm join token from and execute in Worker Nodes to join to cluster

**replace this token with yours**

kubeadm join 10.0.0.11:6443 --token 03em5o.agjpy9wbj98izbpn \
        --discovery-token-ca-cert-hash sha256:92a1cf1e452961a550f05eff32f25500fc9bcfd5d5f771689e8ee21b6a0da243