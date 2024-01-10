# How to Launch an Ubuntu(22.04) T2 Medium Instance on AWS

- To launch an Ubuntu 22.04 T2 Large instance on AWS, follow these step-by-step instructions:

1. **Log in to AWS Management Console**:
    - Go to https://aws.amazon.com/ and sign in to your account.
    or 
    - Go to https://acloudguru.com/ sign in to your account and launch an AWS playground.

2. **Open EC2 Dashboard**:
    - In the AWS Management Console, find and click on the "Services" dropdown in the top left corner.
    - Select "EC2" from the list of services.

3. **Launch Instance**:
    - On the EC2 Dashboard, click the "Launch Instance" button.

4. **Choose an Amazon Machine Image (AMI)**:
    - In the "Choose an Amazon Machine Image (AMI)" step, search for "Ubuntu" in the search bar.
    - From the list of results, select "Ubuntu Server 22.04 LTS (HVM), SSD Volume Type".

5. **Choose an Instance Type**:
    - In the "Choose an Instance Type" step, select "t2.medium" from the list of available instance types.
    - Click the "Next: Configure Instance Details" button.

6. **Configure Instance Details**:
    - Configure the instance details as per your requirements.
    - Once done, click the "Next: Add Storage" button.

7. **Add Storage**:
    - Add storage as per your requirements.
    - Click the "Next: Add Tags" button.

8. **Add Tags**:
    - Add tags if required.
    - Click the "Next: Configure Security Group" button.

9. **Configure Security Group**:
    - Configure the security group settings as per your requirements.
    - Click the "Review and Launch" button.

10. **Review and Launch**:
    - Review all the settings and configurations.
    - Click the "Launch" button.

11. **Key Pair**:
    - A pop-up window will appear asking you to select an existing key pair or create a new one.
    - If you have an existing key pair, select "Choose an existing key pair", select the key pair from the dropdown, and click the "Launch Instances" button.
    - If you need to create a new key pair, select "Create a new key pair", give it a name, download the private key file (.pem), and then click the "Launch Instances" button.

12. **Launch Status**:
    - You will be taken to the launch status page, where you can see the progress of your instance launch.
    - Once the instance is running, click the "View Instances" button to go to the Instances page, where you can see your newly launched instance.

Your Ubuntu 22.04 T2 meduim instance is now launched and running on AWS!