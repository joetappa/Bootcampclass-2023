
```sh
kubectl create ns efk --v=2
helm repo add elastic https://helm.elastic.co
helm repo update
```
```sh
mkdir efk && cd efk
helm search repo elastic
helm show values elastic/elasticsearch >> elasticsearch.values
```

# Update replicas & minimumMasterNodes, And Resource requests and limits (Min: Memor y 2Gi)in elasticsearch.values

change replicaSet to 1
master node to 1 


```sh
 helm install elasticsearch elastic/elasticsearch -f elasticsearch.values -n efk
 
helm install filebeat elastic/filebeat  -n efk

 helm show values elastic/kibana >> kibana.values
```