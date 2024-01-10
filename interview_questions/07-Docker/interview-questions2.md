Basic Interview Questions of Docker:-

1. How will you run multiple Docker containers in one single host? 

Answer: Docker Compose is the best way to run multiple containers as a single service by defining them in a docker-compose.
yml file.

3. If you delete a running container, what happens to the data stored in that container? 

Answer: When a running container is deleted, all data in its file system also goes away. However,
we can use Docker Data Volumes to persist data even if the container is deleted.

4. How do you manage sensitive security data like passwords in Docker?
 
   Answer: Docker Secrets and Docker Environment Variables can be used to manage sensitive data.

7. What is the difference between Docker Image and a Docker Container?

   Answer: Docker Image is a template that contains the application, libraries, and dependencies required to run an application,
   whereas a Docker Container is the running instance of a Docker Image.

11. How do you handle persistent storage in Docker?
 
Answer: Docker Volumes and Docker Bind Mounts are used to handle persistent storage in Docker.

13. What is the process to create a Docker Container from a Dockerfile? 

Answer: Docker Build command is used to create Docker images from a Dockerfile and then Docker Run command is used to
create Containers from Docker images.

15. How will you scale Docker containers based on traffic to your application?
  
 Answer: Docker Swarm or Kubernetes can be used to auto-scale Docker Containers based on traffic load.
