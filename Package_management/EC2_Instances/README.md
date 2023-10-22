# United Core Systems

### Contacts: 774-515-0044, 617-955-5115<br> WebSite : <http://unitedcoresystem.com/><br>Email: info@unicoresystem.com <br>Address: Worcester, (MA)

#  How to create a Red Hat EC2 instance on AWS

## **Sign in to the AWS Management Console**: 
   #### Navigate to the EC2 dashboard.
 ![EC2 dashboard](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/9c1ce213-66c0-4e26-b508-6cee483a3bcb)

## **Launch a new instance**:
   #### Click on the “Launch Instance” button.
   ![Launch Instance](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/bb4e871a-bf65-4b9c-8914-ab3f30f5aeca)

## **Choose an Amazon Machine Image (AMI)**:
   -  "Step 1: Enter the name of your server eg. Maven-Server
   -  "Step 2: Select "Red Hat" in the quick start menu.
   -  "Step 3: Choose a "Free tier eligible" Amazon Machine Image (AMI)" by selecting "Red Hat Enterprise Linux 9 (HVM) SSD Volume Type" or other free tier versions.
     
   ![Enter the name](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/b3f60d38-b23b-4669-96ae-9cbf366ae36b)

## **Choose an Instance Type**:
   - In "Step 4: Choose an Instance Type", select the desired instance type based on your requirements (e.g., `t2.micro`, `t2.small`).

![Choose an Instance Type](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/a11f5aa4-1532-463a-9094-7b59f28f94d0)

## **Create a Key pair**:
   #### In "Step 5: Click on "Create new key pair" or select on existing Key pair from dropdown buttom
   ![Create new key pair](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/6905b589-c697-4ce7-9538-76640cf854ed)
   
   #### In "Step 6: Enter Key pair name and click  "Create key pair" to create new key pair<br>
   NB: Key pair will be automatically downloaded into your download folder
   ![Create key pair](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/57f33526-510a-4648-ac84-65b824e7164c)

##  **Configure Security Group**:
   - In "Step 7: Configure Security Group", you can either create a new security group or select an existing one. 
   - In "Step 8: Add new rules to allow necessary traffic from required ports  (e.g., Type --> Custom TCP,  Port Range --> 8080, Source Type --> Anywhere).

   ![Configure Security Group](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/7b4b4c78-6568-44cd-870a-6d95c9509634)

## **Review and Launch**:
   - Review the configurations and select the number of instance to launch. If everything looks good, click the "Launch" button.
   ![Review and Launch](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/a173a504-2438-4841-a825-88c8e762e5af)

## **Accessing the Instance**:
   - After a short while, your Red Hat EC2 instance will be up and running. Click on view all instances.
   ![Accessing the Instance](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/04f4a37c-1b15-4c89-9a2a-4835e5e44c92)

## **Connecting via SSH**:
   - You can connect to your insatance using SSH and the key pair you downloaded. The default user for Red Hat instances is usually `ec2-user`.
   ![Connecting via SSH](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/fc2e3d97-4d43-4c4c-8c2c-7d80fbaf78e8)

## **Connection Instructions**:
   - Follow the instructions to connect to EC2 instance
   ![instructions to connect](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/9af130cc-f7b1-45e2-88de-c445dc52f37d)

