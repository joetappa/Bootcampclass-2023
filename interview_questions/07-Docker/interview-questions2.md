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

1. What is Docker?  
Docker Interview Questions 
2. What is the difference between Docker image and Docker container?  
3. How will you remove an image from Docker?  
4. How is a Docker container different from a virtual machine?  
5. Explain basic Docker usage workflow?  
6. What is the most popular use of Docker?  
7. What is a Docker Image?  
8. What is a Docker Container?  
9. Can we lose our data when a Docker Container exits?  
10. How do you make sure our data exists even though you deleted container?  
11. How can you do a Volume Mapping?  
12. Can I do a Read-only Mapping? 
13. How to mount files from physical server to docker container?  
14. Can we run more than one process in a Docker container?  
15. What is Docker Hub?  
16. What are the main features of Docker Hub?  
17. How can we check the status of a Container in Docker?  
18. What is the difference between docker ps and dockerps-a commands?  
19. How do you login to the running container?  
20. What are the various states that a Docker container can be in at any given point in time?  
21. What are the main benefits of using Docker?  
22. What are the popular tasks that you can do with Docker Command line tool?  
23. What is the user of Dockerfile?  
24. What is the difference between Add and Copy command in a Dockerfile?  
25. What is the difference between RUN and CMD command in a Dockerfile?  
26. What is Docker Entrypoint?  
27. What is the difference between CMD and ENTRYPOINT command in a Dockerfile?  
28. What is Build cache in Docker?  
29. What are the most common instructions in Dockerfile? 
30. What is the purpose of EXPOSE command in Dockerfile?  
31. Which kind of network you are using in docker?  
32. What is Overlay network in Docker swarm?  
33. What are the main features of Docker-compose?  
34. How can we control the start-up order of services in Docker compose?  
35. How will you customize Docker compose file for different environments?  
36. Which version of docker compose you have used?  
37. In compose file what is the difference between Links and depends on?  
38. How to get docker container logs?  
39. What is Docker Swarm?  
40. What are the features of Docker Swarm? 
