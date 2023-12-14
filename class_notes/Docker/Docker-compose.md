# Docker Compose

This Docker Compose file defines a simple setup for running a Spring Boot application with a MongoDB database. Let's break down each section of this file to understand its purpose:

vi docker-compose.yml

version: '3.1'

services:
  springboot:
    image: unitedcore/spring-boot-app
    restart: always 
    container_name: spring-boot-app
    environment:
    - MONGO_DB_HOSTNAME=mongodb
    - MONGO_DB_USERNAME=root
    - MONGO_DB_PASSWORD=admin123
    ports:
      - 3000:8080
    networks:
      - spring-network
    working_dir: /opt/app
    depends_on:
      - mongo
  mongo:
    image: mongo
    container_name: mongodb
    environment:
    - MONGO_INITDB_ROOT_USERNAME=root
    - MONGO_INITDB_ROOT_PASSWORD=admin123
    volumes:
      - data:/data/db
    networks:
      - spring-network
    restart: always
volumes:
  data:
    #external: true
networks:
  spring-network:
    driver: bridge


1. **Version:**
   - `version: '3.1'`: Specifies the version of the Docker Compose file format. This version determines which features and syntax are available.

2. **Services:**
   - This section defines two services, `springboot` and `mongo`, which correspond to two containers that will be created.

3. **Springboot Service:**
   - `image: unitedcore/spring-boot-app`: Specifies the Docker image to use for the Spring Boot application.
   - `restart: always`: Configures the container to restart automatically if it stops. This is ignored in Docker Swarm mode.
   - `container_name: spring-boot-app`: Sets the name of the container.
   - `environment`: Defines environment variables for the Spring Boot application, including MongoDB connection details.
   - `ports`: Maps port 8080 of the container to port 8080 of the host, allowing access to the Spring Boot application from the host machine.
   - `networks`: Assigns this service to the `spring-network` network.
   - `working_dir: /opt/app`: Sets the working directory inside the container.
   - `depends_on`: Ensures that the MongoDB container (`mongo`) is started before the Spring Boot application.

4. **Mongo Service:**
   - `image: mongo`: Specifies the official MongoDB Docker image.
   - `container_name: mongodb`: Sets the name of the MongoDB container.
   - `environment`: Configures MongoDB with a root username and password.
   - `volumes`: Maps a volume called `data` to `/data/db` inside the container, which is the default directory MongoDB uses to store database data.
   - `networks`: Also part of the `spring-network` network.
   - `restart: always`: Ensures the MongoDB container restarts automatically if it stops.

5. **Volumes:**
   - `data`: Defines a named volume for MongoDB data storage. The `#external: true` line is commented out, meaning the volume is managed by Docker Compose and not an external volume.

6. **Networks:**
   - `spring-network`: Defines a custom network using the bridge driver, which allows containers to communicate with each other.

This configuration is a typical setup for a web application with a database backend. The `depends_on` directive ensures that the database is available when the Spring Boot application starts, and the shared network facilitates communication between the two containers. The restart policy enhances reliability, and the volume setup for MongoDB ensures data persistence across container restarts.


**Deploy a web applications with a mongo Database in docker:**

Creating a docker-compose file 

Requirement - 
  docker create volume      
  docker create network  
  docker create containers/services

**Step 1: Docker component**  
services:
volume:
network:

**Step 2: Create resources under each components**
services:
    springboot:
    mongo:
volume:
    data:
network:
    spring-network

**Step 3: Create resources under each components**
services:
    springboot:
        image:  
        container_name: 
        environment:
        ports:
        networks:
        depends_on:
        mongo:
        working_dir: 
        restart: 
    mongo:
        image: 
        container_name: 
        environment:
        volumes:
        networks:
        restart: 
volume:
    data:
network:
    spring-network

**Step 4: Provide resources information under each resource components**

services:
  springboot:
    image: unitedcore/spring-boot-app
    restart: always 
    container_name: spring-boot-app
    environment:
    - MONGO_DB_HOSTNAME=mongodb
    - MONGO_DB_USERNAME=root
    - MONGO_DB_PASSWORD=admin123
    ports:
      - 3000:8080
    networks:
      - spring-network
    working_dir: /opt/app
    depends_on:
      - mongo
  mongo:
    image: mongo
    container_name: mongodb
    environment:
    - MONGO_INITDB_ROOT_USERNAME=root
    - MONGO_INITDB_ROOT_PASSWORD=admin123
    volumes:
      - data:/data/db
    networks:
      - spring-network
    restart: always
volumes:
  data:
    #external: true
networks:
  spring-network:
    driver: bridge

Docker Compose
==============

Docker Compose is a tool for defining/declaring and running multiple 
   containerised micro-services applications.

In real time one application can have more than 7 micro-services:
ebay.com: 

An e-commerce java based web application for zara or 
ebay-web-application:
    Login
    Registration
    cart
    checkout
    Payment
    Order
    mysql db  

docker run --name login -d -p 4000:8080 --network springboot-network -e MONGO_DB_USERNAME=root \
 -e MONGO_DB_PASSWORD=admin123 -e MONGO_DB_HOSTNAME=mongodb unitedcore/login

docker run --name registration -d -p  --network springboot-network -e MONGO_DB_USERNAME=root \
 -e MONGO_DB_PASSWORD=admin123 -e MONGO_DB_HOSTNAME=mongodb unitedcore/registration

docker run --name cart -d -p  --network springboot-network -e MONGO_DB_USERNAME=root \
 -e MONGO_DB_PASSWORD=admin123 -e MONGO_DB_HOSTNAME=mongodb unitedcore/cart

docker run --name checkout -d -p  --network springboot-network -e MONGO_DB_USERNAME=root \
 -e MONGO_DB_PASSWORD=admin123 -e MONGO_DB_HOSTNAME=mongodb unitedcore/checkout

docker run --name checkout -d -p  --network springboot-network -e MONGO_DB_USERNAME=root \
 -e MONGO_DB_PASSWORD=admin123 -e MONGO_DB_HOSTNAME=mongodb unitedcore/checkout

docker run --name springapp -d -p 4000:8080 --network springboot-network -e MONGO_DB_USERNAME=root \
 -e MONGO_DB_PASSWORD=admin123 -e MONGO_DB_HOSTNAME=mongodb unitedcore/spring-boot-mongo


  docker network create ecommerce 

  docker volume create datas 

docker-compose file default name = docker-compose.yml:
     - login, registration, cart, checkout, payment, order 
docker --version 
Docker version 20.10.12,    build 20.10.12-0ubuntu4
3.1                     1.13.1+
3.1                     20.10.12

version: '3.1'
volumes:
  data25:
    driver: local
  data28:
    driver: rexray/ebs
networks:
  ecommerce:
    driver: bridge
  amazon:
    driver: bridge
services:
  login 
  registration 
  cart 
  checkout 
  payment 
  order



yaml/yml: kubernetes / ansible / docker-compose
key:value pairs 
  name: Issac     
dictionary 
  name: Issac   
  age: 25  
  company: unitedcore 
list/array:
students:
  - Issac  
  - james 
  - paul 
environment:
- hostname 
- username  
- password   

docker run --name springapp -d -p 4000:8080 --network springboot-network -e MONGO_DB_USERNAME=root \
 -e MONGO_DB_PASSWORD=admin123 -e MONGO_DB_HOSTNAME=mongodb unitedcore/spring-boot-mongo


version: '3.1'
services:
  springapp:
    image: unitedcore/spring-boot-mongo
    restart: always
    ports:
      - 3000:8080 
    networks:
      - amazon    
    environment:
      - MONGO_DB_HOSTNAME=mongodb
      - MONGO_DB_USERNAME=proddb
      - MONGO_DB_PASSWORD=prod@123      
  mongo:  
    image: mongo 
    restart: always
    volumes:
      - data28:/data/db   
    networks:
      - amazon     
    environment:
      - MONGO_INITDB_ROOT_USERNAME=proddb
      - MONGO_INITDB_ROOT_PASSWORD=prod@123      
volumes:
  data28:
    driver: local
networks:
  amazon:
    driver: bridge


sudo apt  install docker-compose 
Commands
-# Syntax Check
docker-compose config 

deploy with existing network/volumes:
======================
version: '3.1'
services:
  springapp:
    image: unitedcore/spring-boot-mongo
    restart: always
    ports:
      - 3000:8080
    networks:
      - ebay
    environment:
      - MONGO_DB_HOSTNAME=mongodb
      - MONGO_DB_USERNAME=proddb
      - MONGO_DB_PASSWORD=prod@123
  mongo:
    image: mongo
    restart: always
    volumes:
      - ebs30:/data/db
    networks:
      - ebay
    environment:
      - MONGO_INITDB_ROOT_USERNAME=proddb
      - MONGO_INITDB_ROOT_PASSWORD=prod@123
volumes:
  ebs30:
    external: true
networks:
  ebay:
    external: true

             dev     uat      prod   
USERNAME   root     uatdb    proddb   
hostname   mongo     mymongo  mongodb  
password   admin123   uat@123  admib@#123  

# Create Services/Contianers
docker-compose up -d  
  
# Remove Services/Contianers 
docker-compose down


If docker compose file with custom name.  
docker-compose -f <CustomeComposeFileName>.yml <command>

Ex:
docker-compose -f docker-compose-springapp.yml config
docker-compose -f docker-compose-springapp.yml up -d

docker-compose -f docker-compose-springapp.yml down

docker-compose help

Docker Compose Commands:

  Ex:
docker-compose default file: docker-compose.yml
docker-compose -f docker-compose.yml up -d 
docker-compose up -d
docker-compose config 

docker-compose custom file: docker-compose-springapp.yml
docker-compose -f docker-compose-springapp.yml config
docker-compose -f docker-compose-springapp.yml up -d

docker-compose -f docker-compose-springapp.yml down


Commands:
  build              Build or rebuild services
  config             Validate and Aview the Compose file
  create             Create services
  down               Stop and remove resources
  events             Receive real time events from containers
  exec               Execute a command in a running container
  help               Get help on a command
  images             List images
  kill               Kill containers
  logs               View output from containers
  pause              Pause services
  port               Print the public port for a port binding
  ps                 List containers
  pull               Pull service images
  push               Push service images
  restart            Restart services
  rm                 Remove stopped containers
  run                Run a one-off command
  scale              Set number of containers for a service
  start              Start services
  stop               Stop services
  top                Display the running processes
  unpause            Unpause services
  up                 Create and start containers
  version            Show version information and quit

Overlay/multi-Host network  
