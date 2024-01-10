Interview: Kubernetes for DevOps – 12 Common Questions

Question 1. What is Kubernetes?

➢ Kubernetes is an open-source container orchestration platform originally
developed by Google. It automates the deployment, scaling, and management
of containerized applications. Containers allow developers to package an
application along with its dependencies and libraries into a portable unit that
can run consistently across various environments.

Question 2. Why should I use kubernetes for DevOps?
1. Portability: Consistent deployment across diverse environments.
2. Automation: Automated deployment, scaling, and recovery based on defined
configurations.
3. Resource Efficiency: Optimized utilization of computing resources.
4. High Availability: Built-in features for fault tolerance and automatic container recovery.
5. Infrastructure Abstraction: Focus on development without worrying about specific
infrastructure details.
6. Continuous Delivery: Integration with CI/CD pipelines for faster and reliable software
releases.
7. Ecosystem and Extensibility: Wide range of tools for customization and integration.
8. Declarative Configuration: Easy management of configurations using a declarative
approach.
9. Community Support: Backed by a large open-source community, providing continuous
development and support.
10. Scalability: Easy horizontal scaling for handling varying workloads efficiently
 
Question 3. What are the commands used in kubernetes for DevOps?
• kubectl get nodes: Displays information about nodes in the cluster.
kubectl get nodes
2. kubectl get pods: Lists all pods in the current namespace.
kubectl get pods
3. kubectl describe pod <pod-name>: Provides detailed information about a specific pod.
kubectl describe pod my-pod
4. kubectl create deployment <deployment-name> --image=<image-name>: Creates a
deployment with a specified container image.
kubectl create deployment nginx-deployment --image=nginx:latest
5. kubectl expose deployment <deployment-name> --port=<port>: Exposes a deployment
as a service.
kubectl expose deployment nginx-deployment --port=80
6. kubectl scale deployment <deployment-name> --replicas=<replica-count> : Scales the
number of replicas for a deployment.
kubectl scale deployment nginx-deployment --replicas=3
7. kubectl get services: Lists all services within the cluster.
kubectl get services
8. kubectl delete pod <pod-name>: Deletes a specific pod.
kubectl delete pod my-pod
 
9. kubectl delete deployment <deployment-name>: Deletes a deployment.
kubectl delete deployment nginx-deployment
10.kubectl apply -f <filename>: Applies a configuration to a cluster using a YAML or JSON
file.
kubectl apply -f my-config.yaml
11.kubectl edit <resource-type> <resource-name>: Edits a resource in real-time.
kubectl edit deployment nginx-deployment
12.kubectl rollout status deployment/<deployment-name> : Checks the status of a
deployment rollout.
kubectl rollout status deployment/nginx-deployment
13.kubectl get namespaces: Lists all namespaces in the cluster.
kubectl get namespaces
14.kubectl describe service <service-name>: Displays detailed information about a service.
kubectl describe service my-service
15.kubectl exec -it <pod-name> -- <command> : Executes a command in a running pod.
kubectl exec -it my-pod -- bash
16.kubectl logs <pod-name>: Displays logs from a specific pod.
kubectl logs my-pod
17.kubectl get deployments: Lists all deployments in the cluster.
kubectl get deployments
 
18.kubectl get configmaps: Lists all ConfigMaps in the cluster.
kubectl get configmaps
19.kubectl create namespace <namespace-name>: Creates a new namespace.
kubectl create namespace my-namespace
20.kubectl port-forward <pod-name> <local-port>:<remote-port>: Forwards a local port
to a port on a specific pod.
kubectl port-forward my-pod 8080:80

Question 4: Explain the difference between a Kubernetes Deployment
and a Kubernetes StatefulSet.
Answer:
• Kubernetes Deployment: It manages stateless applications and scales them by creating and
managing replica sets. It's suitable for applications where instances can be added or
removed without impacting the system's overall state.
• Kubernetes StatefulSet: It's designed for stateful applications requiring stable, unique
network identifiers and persistent storage. StatefulSets maintain a predictable naming
scheme, stable network identities, and ordered deployment/termination.

Question 5: What are Kubernetes Pods, and why are they considered
ephemeral?
Answer:
• Kubernetes Pods: Pods are the smallest deployable units in Kubernetes, comprising one or
more containers sharing storage and network resources. They represent a logical application
and include containers running in the same execution environment.
• Ephemeral nature: Pods are considered ephemeral because they are disposable and
replaceable. Their lifespan isn't guaranteed, and they can be created, deleted, or rescheduled
at any time due to scaling, updates, failures, etc.
 
Question 6: Explain the concept of Kubernetes namespaces and their
significance.
Answer:
• Kubernetes Namespaces: Namespaces are virtual clusters within a Kubernetes cluster,
providing a scope for resources to avoid naming collisions. They help divide cluster
resources between multiple users or teams.
• Significance: Namespaces help in organizing and isolating resources, providing a way to
logically divide cluster resources, such as pods, services, and deployments. They enhance
cluster security by segmenting resources and controlling access.

Question 7: How does Kubernetes manage container networking, and
what is the significance of CNI (Container Networking Interface)?
Answer:
• Kubernetes Networking: Kubernetes manages container networking via a flat, virtual
network that allows communication between pods across nodes. Each pod gets its unique IP
address, and containers within the same pod share the network namespace.
• CNI Significance: CNI is a plugin-based networking standard used by Kubernetes to
facilitate communication between containers and manage networking. It allows different
networking solutions to be used within Kubernetes, providing flexibility and supporting
various network configurations.

Question 8: Explain the process of deploying a multi-container
application using Kubernetes.
Answer:
• Deployment Steps:
1. Define a multi-container pod specification (using YAML or JSON).
2. Create a Kubernetes deployment manifest referencing the defined pod specification.
3. Apply the deployment manifest using kubectl apply -f
deployment.yaml.
4. Kubernetes scheduler creates pods based on the deployment specifications.
 
Question 9: Describe Kubernetes ConfigMaps and Secrets. How are
they used in application deployments?
Answer:
• ConfigMaps: ConfigMaps store non-sensitive configuration data in key-value pairs, used
by applications as environment variables, command-line arguments, or configuration files.
• Secrets: Secrets store sensitive information, like passwords, tokens, or keys, securely
within the cluster. They are Base64 encoded but should be treated with caution.
• Usage in deployments: ConfigMaps and Secrets allow for decoupling configuration from
application containers, making it easier to manage and update configurations without
changing the application code.

Question 10: What is Horizontal Pod Autoscaling in Kubernetes?
How does it work?
Answer:
• Horizontal Pod Autoscaling (HPA): HPA automatically adjusts the number of replica pods
in a deployment based on CPU utilization or custom metrics.
• Working: HPA monitors the specified metrics, like CPU usage. When metrics surpass
predefined thresholds, it triggers Kubernetes to scale the number of pods up or down to
maintain the defined resource utilization targets.

##Question 11: Explain the difference between a Kubernetes Service
and an Ingress.
Answer:
• Kubernetes Service: It's an abstraction that defines a logical set of pods and policies to
access them, providing a stable endpoint to connect to a group of pods.
• Kubernetes Ingress: Ingress manages external access to services within a Kubernetes
cluster, providing HTTP and HTTPS routing rules to different services based on the
incoming requests' paths and hosts.
 
Question 12: What are Custom Resource Definitions (CRDs) in
Kubernetes? How are they used?
Answer:
• CRDs: CRDs extend the Kubernetes API to create custom resources and controllers,
allowing users to define their own API objects and controllers.
• Usage: CRDs enable users to define and use custom resources and controllers tailored to
specific applications or use cases that are not covered by the Kubernetes core API. For
instance, CRDs enable the creation of custom resources like databases, queues, etc., with
specific behaviors managed by custom controllers.
 
