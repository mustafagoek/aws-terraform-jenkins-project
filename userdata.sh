#!/bin/bash
sudo yum update -y
# install docker
sudo amazon-linux-extras install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# install git
sudo yum install git -y
# install jenkins
sudo git clone https://github.com/oguzhanaydogan/aws-terraform-modules-jenkins
cd aws-terraform-modules-jenkins
docker build -t jenkins .
docker run -p 8080:8080 -p 50000:50000 -d --restart=on-failure -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/datadir:/var/jenkins_home --name jenkins-nodejs-dind jenkins
