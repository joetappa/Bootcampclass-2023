grafana   https://grafana.github.io/helm-charts   
  helm repo add grafana https://grafana.github.io/helm-charts
  helm install grafana grafana/grafana 

kubectl get secret grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo