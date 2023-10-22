# User Management in Jenkins 

User management in Jenkins involves creating and managing users and their permissions. Jenkins provides built-in functionality for user management, and you can also use external user directories like LDAP or Active Directory.

## Authentication 

### Creating and Managing Users in Jenkins:

1. **How to Create a User:**
   - Navigate to the Jenkins dashboard.
   - Click on "Manage Jenkins" and select "Manage Users."
   - Click on "Create User" and fill in the details like username, password, full name, and email address.
   - Click "Create User" to create the user.

2. **Edit or Delete a User:**
   - In the "Manage Users" section, click on the username you want to edit or delete.
   - Click "Configure" to edit the user details, or click "Delete" to delete the user.

3. **How to allow users to signup** 
    - Navigate to your Jenkins dashboard and click on "Manage Jenkins".
    - Under Security section click on "Security".
    - Under "Security Realm", select "Jenkins’ own user database".
    - Check "Allow users to sign up". 
    
    Note: With signup enabled, anyone on your network can become an authenticated user. It is recommended in this case to minimize the permissions granted to any authenticated user.

## Authorization 

### Managing Permissions in Jenkins:

Jenkins provides fine-grained access control using its built-in authorization strategies, as well as plugins like Role-based Authorization Strategy.

1. **Using Matrix-based security Built-in Authorization:**
   - Navigate to "Manage Jenkins" and select "Security"
   - Under the "Authorization" section, choose the   "Matrix-based security" authorization strategy.
   - Add users and Configure permissions as needed.

2. **Using Role-Based Authorization Strategy (requires the plugin to be installed):**
   - Install [Role-Based Authorization Strategy](../plugins/Role-base_authorization.md)plugin
   - Navigate to "Manage Jenkins" and select "Security"
   - Under the "Authorization" section, choose "Role-Based Strategy."
   - Click "Manage and Assign Roles" to create roles and assign them to users.

3. **How to use project based mixed Authorization Strategy:**
    - Navigate to "Manage Jenkins" and select "Security"
    - Under "Authorization", select "Project-based Matrix Authorization Strategy".
    - Add users and configure other security settings as needed, then save the configuration.
    - Go to your Jenkins dashboard and click on the Freestyle job you want to configure.
   - Click on "Configure".
   - Scroll down to find the "Enable project-based security" checkbox and select it.
   - Under "Authorization", you will see a matrix where you can specify permissions for users or groups. Add the necessary users or groups and set their permissions for this specific job.
   - Save the configuration.


### Managing Permissions in Jenkins with LDAP:

To use an LDAP server for managing user permissions in Jenkins, you need to perform the following steps:

### 1. Install LDAP Plugin:

- Navigate to "Manage Jenkins" > "Plugins".
- Go to the "Available" tab and search for "LDAP".
- Install the "LDAP Plugin".

### 2. Configure LDAP for Authentication:

- Navigate to "Manage Jenkins" > "Security".
- In the "Security Realm" section, select "LDAP".
- Provide the necessary LDAP server details. You may need to consult your LDAP administrator to get the correct values for these fields. Here are the fields you will need to configure:

  - **Server**: The address of your LDAP server.
  - **Root DN**: The base DN where Jenkins will start searching for user entries.
  - **User search filter**: The filter Jenkins uses to search for user entries.
  - **Group search filter**: The filter Jenkins uses to search for group entries.

- Test the LDAP connection to make sure Jenkins can connect to your LDAP server.

### 3. Configure Authorization:

- In the "Authorization" section, select "Matrix-based security" or "Project-based Matrix Authorization Strategy".
- Add the necessary users or groups from your LDAP directory and assign them permissions.

### 4. Save Configuration:

- Click "Save" to save your configuration.

Once you've configured Jenkins to use an LDAP server for authentication, Jenkins will use the LDAP server to authenticate users and apply the permissions you've configured in the authorization matrix. This allows you to manage Jenkins user permissions using your organization's LDAP directory.