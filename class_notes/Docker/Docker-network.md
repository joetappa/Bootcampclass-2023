# Recap on Docker 

Docker:
  We use Docker for containerization
  We use Kubernetes for container orchestration/MGT   
We install the docker containerization software:
In Linux/Windows/MacOS  
  docker client /cli      = docker 
  docker daemon/service   =  
  docker registry         = ship/share    

Application architecture:
  Monolithic  '
  Micro-services'

Which kind of applications can be containerised??  
  - All applications [java/python/nodeJS, etc.]

What is needed to containerise an application:
  docker installed
  Dockerfile -- Instructions on how to build an image   
  Docker Image -- is a package with apps code + dependencies
  containers -- apps or running instance/process of a docker image 
  networks--- communication[internal or external]        

docker:
  image      = packaging 
  containers = process of the image 
  networks   = communication
  volumes    = storage/mounts for the containers



# Docker networks:
======================

### What is a network ?
A group of servers/devices interconnected within a specific network allows each servers/devices to communicate with others in the same network. This arrangement facilitates the exchange of data and resources among servers seamlessly.

### What is Docker network ? 

Docker networking enables containers to communicate with each other and with the outside world. Here are some key points about Docker networking:

#### 1. Isolation and Communication: 
Docker networks provide isolation for containers, ensuring they can communicate securely. Containers on the same network can talk to each other, while those on separate networks are isolated.

#### 2. Network Drivers: 
Docker supports different types of network drivers that dictate how networks are implemented and how containers can use them. Common drivers include:

  - Bridge: 
    The default network driver for containers, are useful for standalone containers needing to communicate.

  - Host: 
    Removes network isolation between the container and the Docker host, using the host’s networking directly.

  <!-- - Overlay:
    Enables networking among multiple Docker daemons and is ideal for Swarm/kubernetes ( clustering and scheduling tool) setups. -->

#### 3. Port Mapping: 
Docker allows for port mapping, which means specific ports on the host can be opened and directed to ports in the container. This is crucial for accessing applications running in containers from outside the Docker host.

#### 4. Network Creation: 
Users can create custom networks in Docker, which allow for more advanced networking features like manual IP address assignment, choosing different drivers, and setting up network gateways.

# Demo - Docker Network - get started 
```Docker
docker network --help
```
outputs: 
Usage:  docker network COMMAND
Manage networks
Commands:
  connect     Connect a container to a network
  create      Create a network
  disconnect  Disconnect a container from a network
  inspect     Display detailed information on one or more networks
  ls          List networks
  prune       Remove all unused networks
  rm          Remove one or more networks

## 1. ls - List networks
  
  ### How to list networks in docker?
```Docker 
docker network ls
```
Outcome 
ubuntu@docker:~$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
7b51ede636f3   bridge    bridge    local
a00011a24f3f   host      host      local
4a1dde3cd8e5   none      null      local



## 2. create - Create a network
  
  Types of networks 
  - Default bridge : 
  - host
  - none 
  - custom bridge

Note: We can only create two types of network Default bridge and a custom bridge
the host and null are automatically created upon intallation and only one instance of "null" or "host" network is allowed


#### Creating a Default bridge network
```Docker 
docker network create <network-name>
```
Example : 
docker network create default-network 

Output:
ubuntu@docker:~$ docker network create default-network
ffc0324f2f3e7340f8b16e8027391d702ccbe0b71620f6da250b7e23e8bbc91f

#### Creating a Custom bridge network
docker network create --help 
 -d, --driver string     Driver to manage the Network (default "bridge")

```Docker 
docker network create -d bridge <network-name>
```
Example: 
docker network create -d bridge custom-network

Output:
ubuntu@docker:~$ docker network create -d bridge custom-network
f5f83ee43ba1171458d2a823e0df57b2577ebbb2cd05e13dc9030c749ab69472

#### Creating a Host/null network
- No Need to Create: The Docker daemon automatically creates a network using the host/null network driver upon installation, Since the host network is already available by default, you don't need to manually create it. You can directly use it when running a container by specifying --network host in the Docker run command.

- Host Network Driver: When you use the host network driver in Docker, it means that the container shares the host’s networking resources.

- If we create container in none/null network. Container will not have IP Address.
We can't access   containers in this network  

## Display all networks created 
```Docker 
docker network ls
```

Outcome:
ubuntu@docker:~$ docker network ls
NETWORK ID     NAME              DRIVER    SCOPE
7b51ede636f3   bridge            bridge    local
a00011a24f3f   host              host      local
4a1dde3cd8e5   none              null      local
7b51ede636f3   default-network   bridge    local
4a1dde3cd8e5   custom-network    bridge    local
   

# Demo - Docker Network - 
#### Creating a Docker container in a default Bridge Network

docker pull maven-web-app
docker pull java-web-app

docker run -name maven-web-app -d -p 4040:8080 --network default-network maven-web-app
docker run -name java-web-app -d -p 4041:8080 --network default-network maven-web-app

docker inspect maven-web-app | grep 172.18
docker inspect java-web-app  | grep 172.18

docker exec -it maven-web-app bash
 curl -v 172.18.1.0:4041

#### Creating a Docker container in a default Bridge Network

docker pull unitedcoresystem/springboot-app
docker pull mongo
docker network create -d bridge spring-network

docker run --name springboot-app -d -p 3000:8080 --network spring-network -d \
    -e MONGO_DB_USERNAME=root \
    -e MONGO_DB_PASSWORD=admin123 \
    -e MONGO_DB_HOSTNAME=mongodb unitedcoresystem springboot-app
    
docker run --name mongodb -d --network spring-network -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=admin123 mongo

## 3. Connect - Connect a container to a network
#### How to connect applications to multiple network 

- Comparing cidr block of both network 
docker inspect spring-network
docker inspect custom-network

- get ip address of both application  
docker inspect springboot-app
docker inspect mongo

-  add mongo to custom default network 
```docker 
docker network connect custom-network mongo
```

- confirm if mongo has both networks 
docker inspect mongo

## 4. disconnect - Disconnect a container from a network
#### How to disconnect applications from multiple network 

- add mongo to custom default network 
```docker 
docker network disconnect spring-network mongo
```
- Test application to see if its working 

## 5. Prune - Remove unused networks
```Docker
docker network prune 
```
## 6. Remove Network
```Docker
docker network rm <networkNameOrId>
```
# Demo - Docker Network - 
#### Creating a Docker container in a Host Network

If we create containers in host network. Container will not have an IP Address. Container will be created in a system network.

But we can't create more than one container with same container port in host network.

#### Example of bridge network; 
   java-web-app      = containerPort,  EXPOSE=8080  
   maven-web-app     = containerPort,  EXPOSE=8080  

   docker run --network bridge --name javaapp -d -p  7000:8080
   docker run --network bridge --name mavenapp -d -p 5500:8080

#### Example of Host network:
We no need to do port publish to access containers.

docker pull hello-world
docker pull nginx 

   docker run --name hello-app --network host -d mylandmarktech/hello 
   docker run --network host -d --name webserver nginx


docker run --name hello-app2 --network custom-network -d -p 90:80 hello-world

netstat -tulpn  




