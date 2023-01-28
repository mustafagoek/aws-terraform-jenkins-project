# AWS-Terraform-Modules: Jenkins
Using Terraform, 
1. An EC2 instance was created on AWS, 
1. Docker was installed on the instance, and 
1. A Jenkins image and container were built. 

The remaining steps will be completed manually as below
## To be able to start Jenkins on AWS EC2:
1. Open your VS Code with terminal and locate your pwd as where your .pem file
1. Open AWS EC2 instance and find SSH Client page
1. On terminal, connect to the EC2 through copying below with changing 'yourpassword' to your pem file's name
    ```
        ssh -i "yourpassword.pem" ec2-user@ec2-3-88-232-161.compute-1.amazonaws.com
    ```
1. Get docker images and docker containers information. You should see jenkins image is started
    ```
        docker images -a && docker container ls -a
    ```
1. Make sure you copy your container name, in my code 'jenkins-nodejs-dind' is the container name. With that **exec**, we execute the container where we started using Jenkins
    ```
        docker exec -it jenkins-nodejs-dind /bin/bash
    ```
1. Copy the below on your opened container cli, if it doesn't work delete 'sudo'
    ```
        sudo cat /var/jenkins_home/secrets/initialAdminPassword
    ```
1. Get the output and copy to your Jenkins entry page as your password

1. Now it is ready to go on Jenkins on AWS EC2. To do that open new browser page and paste your EC2 instance's public IP address (x.x.x.x) with the default Jenkins' port number 8080 as below
```
    x.x.x.x:8080
```
1. Paste the password where we got before

### *Jenkins is ready to use!*

