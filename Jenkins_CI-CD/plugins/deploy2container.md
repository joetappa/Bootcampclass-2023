# How to install "Deploy to Container" plugin
To use the Deploy to Container Plugin in Jenkins, you'll need to install the plugin and then configure it as part of your build and deploy process. Here's how you can do that:

### Install Deploy to Container Plugin:

1. Go to the Jenkins dashboard and Click on "Manage Jenkins" on the left side.
![manage jenkins](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/4438d209-a0b9-408e-8f6f-65c98164ca20)

2. Click on "Manage Plugins".
![plugin](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/2cceb803-5266-41fe-9b7a-f2ca130b9169)

3. Go to the "Available" tab.
![avaliable_plugin](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/54c49bf6-e4ea-4972-b561-f44b93ed6612)

4. In the filter box, type "Deploy to container".
![fliterbox](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/d71a9a6e-30c4-49dd-98c9-4e64ca920b1e)

5. Select the checkbox next to "Deploy to container" and Click "Install without restart".
![checkbox](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/dfe4ec06-4cd0-4117-bf7d-c4802495c108)

6. Select "go back to the top page" to return to dashboard .
![Screenshot 2023-10-19 at 21 24 36](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/1bc7b434-1023-42fc-871a-af70f1cb60ff)




# Configure Deploy to Container Plugin:

Once the plugin is installed, you can add a post-build step to deploy to a container.

1. Go to your job configuration page.
![project-dashboard](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/09e2cd75-bc99-46b6-9be6-6eefb4ab232a)

2. Scroll down to the "Post-build Actions" section.
![postbuild-action](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/fe8154f0-9558-45b2-bd3b-4bf7508b4816)

3. Click "Add post-build action" and select "Deploy war/ear to a container".
  ![add-post-build](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/7d7db221-2d23-4dd9-acfe-342d6b2f5cd2)

4. Click "Add container" and select "Tomcat 9.x" and Configure the following options:
   - **WAR/EAR files**: The path to your WAR/EAR files that you want to deploy.
   - **content Path**: Leave blank
   - **Containers Creden(tials**: The username and password for authentication Tomcat container.
   - **URL**: Container (Tomcat) url or public or private ip address  

5. Click "Add" to input Container (Tomcat) Credentials.
   - Add Tomcat Credentials to jenkins 
   ![Post-build](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/bd276d37-4cb8-46c2-8060-5cdccbd5296b)

6. Enter Container Credentials.
   - Enter username and password into the Jenkins Credentials Provider and click add 
   ![jenkins-credentials](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/5907f924-6569-48ee-aaeb-6cb648240b9d)

Once you've configured the Deploy to Container post-build action, Jenkins will deploy your application to the specified container as part of your build process.
