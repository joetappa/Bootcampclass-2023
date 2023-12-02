# Kubernetes Setup

### Prerequisite
#### AWS Acccount.
- Create 3 - Ubuntu Servers -- 18.04.
- 1 Master (4GB RAM , 2 Core) t2.medium
- 2 Workers (1 GB, 1 Core) t2.micro
- Create Security Group and open required ports for kubernetes.
- Open all port for this illustration
- Attach Security Group to EC2 Instance/nodes.
- Assign hostname & login as ‘root’ user because the following set of commands need to be executed with ‘sudo’ permissions.


#### Select the type of application to install and configure kubenetes

- [Kube ADM](./Kube-adm)
- [KOPS](./KOPS)
- [AWS EKS](./EKS)

