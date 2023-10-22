# Role Base Authorization Strategy

To install and configure Role-Based Authorization in Jenkins, follow these steps:

## Install Role-based Authorization Strategy Plugin:

1. Navigate to your Jenkins dashboard.
2. Go to "Manage Jenkins" > "Manage Plugins".
3. Click on the "Available" tab.
4. In the "Filter" text box, type "Role-based Authorization Strategy" to search for the plugin.
5. Check the checkbox next to "Role-based Authorization Strategy".
6. Click on "Install without restart" or "Download now and install after restart" to install the plugin.

## Configure Role-Based Authorization Strategy:

After installing the plugin, you need to configure Jenkins to use the Role-Based Authorization Strategy.

1. Go back to your Jenkins dashboard.
2. Go to "Manage Jenkins" > "Security".
3. Under the "Authorization" section, select "Role-Based Strategy" from the dropdown list.
4. Now you should see the "Roles" section added to the bottom of the page.
5. Click on "Add Role" to add a new role. Enter the role name, pattern for jobs that this role can access, and permissions.
6. Go to "Assign Roles" to assign the created roles to specific users or groups.
7. Click "Save" to save the configuration.

Now Jenkins will use the Role-Based Authorization Strategy to manage permissions for users and groups according to the roles you have defined.