# AWS-Terraform-Modules: Jenkins
By using Terraform,
1. An EC2 instance was created on AWS,
1. Docker was installed on the instance, and
1. A Jenkins image and container were built.

#### Pre-configurations
You should update your main.tf and save as below:
- You must already have a *.pem* key in AWS and
- You have to download it to your local computer.
- **key_name** must be the same as the downloaded *.pem* key under the **resource "aws_instance"** in the main.tf,.

The remaining steps will be completed manually as below

> **Note:** Wait for 1-2 minutes while EC2 instance initializing
## To be able to start Jenkins on AWS EC2:
1. Copy **instance_public_ip** address to a new browser page with :8080 port. 
    - Here you go the jenkins is there! Now we need the **Administrator password**
1. Open your VS Code with terminal and locate your pwd as where your .pem file
1. Open AWS EC2 instance, select the instance and then click the **connect** and navigate to **SSH Client** page and copy the given example as 'ssh -i ...' and 
1. On terminal, copy and connect to the EC2 through ssh information.

    **Note:** Make sure you are on the same directory as your .pem file.

1. Get docker images and docker containers information. You should see jenkins image is started
    ```
        docker images && docker container ls
    ```
    **Note:** If you use different image, your have to change the container name. My container's name is **'jenkins-nodejs-dind'**.

1. Copy below on your terminal
    ```
        docker exec -it jenkins-nodejs-dind /bin/bash
    ```
   **Note:** Here we used **exec** to be able to execute the container where we started using Jenkins

1. On the terminal, copy the below on your opened container terminal.
    **Note:** If it doesn't work add 'sudo' before the *cat*
    ```
        cat /var/jenkins_home/secrets/initialAdminPassword
    ```
1. Copy the output on to your Jenkins entry page as your **Administrator password** 

## *Jenkins is ready to use!*

