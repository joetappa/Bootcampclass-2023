
# GitHub and Jenkins Setup

To accomplish the GitHub and Jenkins setup for your project, follow these step-by-step instructions:

### Step 1: Fork or Clone the GitHub Repository

1. **Navigate** to the Crispy Kitchen repository at [https://github.com/emortoo-projects/crispy-kitchen.git](https://github.com/emortoo-projects/crispy-kitchen.git).
2. Click on the **Fork** button at the top right to fork the repository to your GitHub account, or click on the **Code** button then **Clone** to clone it directly to your local machine or development environment.

### Step 2: Create a Freestyle Project in Jenkins

1. **Log in** to your Jenkins server.
2. Go to the **Dashboard**, click on **New Item** at the top left.
3. Enter a **name** for your project, select **Freestyle project**, and click **OK**.
4. In the **Source Code Management** section, select **Git** and enter the repository URL of your forked or cloned repository.
5. If your repository is private, you may need to add credentials by clicking on **Add > Jenkins**.

### Step 3: Connect Your Project to GitHub via Webhook

1. In GitHub, navigate to your repository, then go to **Settings > Webhooks > Add webhook**.
2. For the **Payload URL**, enter `http://<Jenkins_URL>/github-webhook/`, replacing `<Jenkins_URL>` with your actual Jenkins server URL.
3. Select **application/json** for the content type.
4. Choose **Just the push event**.
5. Ensure **Active** is checked and click **Add webhook**.
6. Back in Jenkins, ensure the **Build Triggers** section of your project is set to **GitHub hook trigger for GITScm polling**.

### Step 4: Install Maven Plugin in Jenkins

1. Go to **Manage Jenkins > Manage Plugins**.
2. Switch to the **Available** tab and search for **Maven Integration plugin**.
3. Select it and click **Install without restart**.

### Step 5: Configure the Project to Build a WAR File

1. In the project configuration, go to the **Build** section, click on **Add build step > Invoke top-level Maven targets**.
2. In **Goals**, enter `clean package` to clean and build the project, generating the WAR file.

### Step 6: Deploy WAR File to NFS Server Using Publish Over SSH

1. First, ensure the **Publish Over SSH** plugin is installed in Jenkins (similar to the Maven plugin installation).
2. In **Manage Jenkins > Configure System**, scroll to **Publish over SSH** and configure your SSH server (NFS server) details.
3. Back in your project configuration, add a post-build action: **Send build artifacts over SSH**.
4. Configure it to send the WAR file (usually found in the `target` directory of your Maven project) to the desired location on your NFS server.

After configuring these steps, every push to the GitHub repository will trigger a Jenkins build, which will compile the Java code into a WAR file and deploy it to the NFS server, automating your build and deployment process.