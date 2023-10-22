# Jenkins Freestyle Project And Setup In AWS EC2 Instance.
Running a freestyle project in Jenkins involves creating a job that defines the build steps, triggers, and other configurations. Here's a step-by-step procedure to create and run a freestyle project in jenkins:

##### Pre-requisite
+ AWS Acccount - [Luanch an ec2 instance](../../Package_management/EC2_Instances)
+ Create ec2 t2.medium Instance with 4GB RAM.
+ Create Security Group and open Required ports.
   + 8080 ..etc
+ Attach Security Group to EC2 Instance.
+ [Install and configure jenkins.](../../Package_management/Jenkins_installation)

1. **Access Jenkins**:
   - Open your web browser and navigate to the Jenkins server's URL. Typically, it's http://localhost:8080 or the URL provided by your Jenkins administrator.

2. **Log In**:
   - If you haven't already logged in, enter your Jenkins username and password to access the dashboard.
    ![login_result](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/02449f12-68ce-472a-a95b-8308871e42ab)

3. **Create a New Freestyle Project**:
   - Click on "New Item" or "Create a job" on the Jenkins dashboard.
    ![jenkins-dashboard](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/a6d8981d-259e-44cd-85da-7005e815bc0a)
   - Enter a name for your project/job and select the "Freestyle project" option.
   - Click on "OK" or "Save" to create the project.
   ![freestyle-project](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/fb088212-07fd-416a-b22c-acdf6f6c0f1e)

4. **Configure General Settings**:
   - In the project configuration page, scroll down to the "General" section.
   - You can configure project-specific settings here, such as a description, discard old builds, etc.
   ![project-configuration](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/0fc2c65b-0788-4296-be42-1c1608c19e66)

5. **Source Code Management (Optional)**:
   - If your project requires source code management (e.g., Git, SVN), configure it in the "Source Code Management" section.
   ![SCM](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/bb8d1862-46b4-4f40-ab30-b7e7794e1198)

6. **Build Triggers**:
   - Configure when the project should be built. Common options include:
     - **Build after other projects are built**: You can specify upstream projects that trigger this job.
     - **Build periodically**: You can schedule builds at specific intervals using cron syntax.
     - **Poll SCM**: Jenkins can periodically check your source code repository for changes and trigger a build when changes are detected.
     ![build-triggers](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/e6e3e4fc-791d-49ae-80eb-9ce842a11567)


7. **Build Environment (Optional)**:
   - You can set up build environment variables or options here if needed.
   ![build-triggers](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/0e62d76f-a855-4819-ba86-9bce1ebe9293)

8. **Build**:
   - In the "Build" section, click on "Add build step" and select the type of build step you need (e.g. "Invoke top-level Maven Targets").
   ![build-steps](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/51347ba1-f5ff-452f-ac6a-11c766c66f9a)

   - Configure the build step according to your project's requirements. You can add multiple build steps as seen.
   1. clean package --> The clean phase will remove the target/ directory that contains the build output from previous runs whiles The package phase will compile your code, run tests, and then package the compiled code into a JAR or WAR file, depending on your project type. This file will be placed in the target/ directory.
   2. sonar:sonar --> The sonar:sonar goal is used to start the SonarQube analysis of your project. SonarQube is a tool for continuous inspection of code quality, and it can analyze and detect bugs, vulnerabilities, and code smells in your project.
   3. deploy --> The term "deploy" in software development usually refers to the process of moving a software application from a development or testing environment to a production environment, making it available for users.

    ![build-configuration](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/6c7202ab-0761-484c-b6d0-ca00292028a8)

9. **Post-build Actions**:
   - Install the plugin "Deploy to container" --> (../plugins/deploy2container.md)
   - Configure deploy to container plugin --> (../plugins/deploy2container.md)
   - After the build, configure post-build actions "deploy to container".
   ![add-post-build](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/7d7db221-2d23-4dd9-acfe-342d6b2f5cd2)

10. **Save the Project Configuration**:
    - Scroll to the bottom of the configuration page and click on "Save" to save your project's configuration.
    ![save project](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/41483519-bc1e-4774-8bf3-fe8e921e67ac)

11. **Build the Project**:
    - On the project's dashboard page, click on "Build Now" to manually trigger a build. Alternatively, if you've configured a trigger in step 6, Jenkins will automatically start a build when the trigger conditions are met.
    ![buildnow](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/05ca1e19-035e-434a-8005-54fa6ff671d6)

12. **View Build Results**:
    - After the build is complete, you can view the build results, console output, and any post-build actions you've configured.
    ![Screenshot 2023-10-19 at 21 34 12](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/eda5152c-6f8f-4131-a370-b6e310ef677a)
