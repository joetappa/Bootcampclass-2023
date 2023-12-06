Configuration of NFS Server
===========================

Step 1: 

Create one Server for NFS

Install NFS Kernel Server in 
Before installing the NFS Kernel server, we need to update our system’s 
repository index with that of the Internet through the following apt command as sudo:
$sudo apt-get update
     the above command lets you install the latest available version of a software
     through the ubuntu repositories.
     Now, run the following command in order to install the NFS kernel server on 
     your system : 
     $sudo apt install nfs-kernel-server -y 
Step 2: Create the Export Directory [mount point]
      sudo mkdir -p /mnt/share/
      ## As we want all clients to access the directory, we will remove restrictive 
      permissions.
      sudo mkdir -p /mnt/share/
      sudo chown nobody:nogroup /mnt/share/
      sudo chmod 777 /mnt/share/
 step 3: Assgn server access to client(s) 
         through NFS export file

         sudo vi /etc/exports  

         # /mnt/share/  <clientIP or Clients
          CIDR>(rw,sync,no_subtree_check,no_root_squash)
          #Ex:
          /mnt/share/ *(rw,sync,no_subtree_check,no_root_squash)

 Step 4: Export the shared directory
          $ sudo exportfs -a
          $ sudo systemctl restart nfs-kernel-server

 Step 5: Open firewall for the client (s) Port 2049.


Configuring the cient Machine
================================
Step 6: Install NFS common 
        Before installing the NFS common application 
        we need to update our system's repository
        index with that of the internet through the 
        following apt command as sudo:

        $sudo apt-get update -y && sudo apt-get install nfs-common -y 
        Install NFS agents on all worker nodes (Node1 and Node 11) 
        using the above command
        $sudo apt-get install nfs-common

