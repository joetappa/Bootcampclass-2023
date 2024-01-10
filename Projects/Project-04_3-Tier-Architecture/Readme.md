# Project 4 : Deploying a Three-tier Architecture

As a DevOps engineer, your deep understanding of core components of web solutions and ability to troubleshoot them will play essential role in your further progress and development.
A three-tier architecture comprises three layers, namely the presentation tier, the application tier (Bussiness layer), and the data tier. The presentation tier serves as the front-end, hosting the user interface, such as the website that users or clients interact with. The application tier, commonly referred to as the back-end, processes the data. Finally, the data tier is responsible for data storage and management it will further be explained below.

# Three-tier Architecture
Generally, web, or mobile solutions are implemented based on what is called the Three-tier Architecture.

Three-tier Architecture is a client-server software architecture pattern that comprise of 3 separate layers.


![5021](https://user-images.githubusercontent.com/85270361/210136746-989083fe-d67f-4454-97d5-5f7cc8f921f3.PNG)


1. Presentation Layer (PL): This is the user interface such as the client server or browser on your laptop.
2. Business Layer (BL): This is the backend program that implements business logic. Application or Webserver
3. Data Access or Management Layer (DAL): This is the layer for computer data storage and data access. 

[Database](https://www.computerhope.com/jargon/d/database-server.htm) Server or File System Server such as [FTP](https://titanftp.com/2022/07/05/what-is-an-ftp-server/) server, or [NFS](https://www.techtarget.com/searchenterprisedesktop/definition/Network-File-System) Server

On the diagram below you can see a common pattern where several stateless Web Servers share a common database and also access 
the same files using Network File Sytem (NFS) as a shared file storage. Even though the NFS server might be located on a completely 
separate hardware – for Web Servers it look like a local file system from where they can serve the same files.


![6000](https://user-images.githubusercontent.com/85270361/210138947-340454da-2ca8-4041-84e7-324d685612a4.PNG)


It is important to know what storage solution is suitable for what use cases, for this – you need to answer following questions: what 
data will be stored, in what format, how this data will be accessed, by whom, from where, how frequently, etc. Base on this you will
be able to choose the right storage system for your solution.

