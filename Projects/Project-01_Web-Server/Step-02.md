# Connecting to EC2 terminal

## Using the terminal on MAC/Linux

1. Open an SSH client.

- The terminal is already installed by default. You just need search for terminal to open it up.

2. Change directory 

- Change directory into the loacation where your PEM file is. Most likely will be in the Downloads folder

```
cd ~/Downloads
```

IMPORTANT - Anywhere you see these anchor tags < > , going forward, it means you will need to replace the content in there with values 
specific to your situation. For example, if we need you to replace the name you have saved the private key on your machine, we will 
write something like my-private-key.pem

If the private key you downloaded was named my-private-key.pem simply remove the anchor tags and insert my-private-key.pem in the command you are required to execute. Lets try this and follow the instructions below to get some work done.

3. Change permission 

- Change premissions for the private-key-file.pem, Run this command, if necessary, to ensure your key is not publicly viewable otherwise you can get an error "Bad permissions"

```
 chmod 400 <private-key-file>.pem
```
4. Connect to your instance using its Public DNS or ip address:

- Connect to the instance by running

```
ssh -i <private-key-name>.pem ubuntu@<Public-IP-address>
```  
  
# Using Windows Terminal/putty

Remember the private key your downloaded from AWS while provisioning the server? It is a PEM file format. You can open it up to see
the content and have a glimpse of what a PEM file looks like.

Now, we are going to use that PEM key to connect to our EC2 Instnace via ssh.

On, windows the windows terminal tool is not installed by default, you can install it from here

```
cd Downloads
```

IMPORTANT - Anywhere you see these anchor tags < > , going forward, it means you will need to replace the content in there with values
specific to your situation. For example, if we need you to replace the name you have saved the private key on your machine, we will 
write something like < private-key-name >.

If the private key you downloaded was named my-private-key.pem simply remove the anchor tags and insert my-private-key.pem in the 
command you are required to execute. Lets try this and follow the instructions below to get some work done.

Connect to the instance by 

```
ssh -i <private-key-name>.pem ubuntu@<Public-IP-address>
``` 
 
 Congratulations! You have just created your very first Linux Server in the Cloud and our set up looks like this now:
  (You are the client)

![projject1-step0](https://user-images.githubusercontent.com/85270361/210112007-5cd14a18-8aaa-4c7a-857e-b18400535bdd.PNG)


## IMPORTANT INFORMATION

Stop EC2

All we need to know right now is that we can use 750 hours (31.25 days) of t2.micro server per month for the first 12 months FOR FREE.

You can launch and stop new instances when you need to, but by default there is a soft-limit of maximum 5 running instances at the same time. In our first projects we will be using only 1 running instance at a time. When you stop an instance – it stops consuming available hours.

Note that every time you stop and start your EC2 instance – you will have a new IP address, it is normal behavior, so do not forget to update your SSH credentials when you try to connect to your EC2 server.

Let us move on and configure our EC2 machine to serve a Web server!