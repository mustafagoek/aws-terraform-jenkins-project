# AWS-Terraform-Modules: Jenkins
Using Terraform, 
1. An EC2 instance was created on AWS, 
1. Docker was installed on the instance, and 
1. A Jenkins image and container were built. 

The remaining steps will be completed manually as below
## To be able to start Jenkins on AWS EC2:
1. Open your VS Code with terminal and locate your pwd as where your .pem file
1. Open AWS EC2 instance and find SSH Client page and copy all starts with 'ssh -i ...'
1. On terminal, connect to the EC2 through copying ssh information
1. Get docker images and docker containers information. You should see jenkins image is started
    ```
        docker images && docker container ls
    ```
1. ifyou used different image your have to change the container name. My container's name is **'jenkins-nodejs-dind'**. Here we used **exec** to be able to execute the container where we started using Jenkins
    ```
        docker exec -it jenkins-nodejs-dind /bin/bash
    ```
1. on the terminal, copy the below on your opened container cli, if it doesn't work add 'sudo' before the *cat*
    ```
        cat /var/jenkins_home/secrets/initialAdminPassword
    ```
1. Get the output and copy to your Jenkins entry page as your password

1. Now it is ready to go on Jenkins on AWS EC2. To do that open new browser page and paste your EC2 instance's public IP address (x.x.x.x) with the default Jenkins' port number 8080 as below
```
    x.x.x.x:8080
```
1. Paste the password where we got before

### *Jenkins is ready to use!*

