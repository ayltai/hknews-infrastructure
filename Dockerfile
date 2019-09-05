FROM amd64/ubuntu:18.04

RUN apt-get update
RUN apt-get install software-properties-common
RUN apt-add-repository -y -u ppa:ansible/ansible
RUN apt-get install -y ansible
RUN apt-get install wget unzip
RUN wget https://releases.hashicorp.com/terraform/0.12.8/terraform_0.12.8_linux_amd64.zip
RUN unzip ./terraform_0.12.8_linux_amd64.zip -d /usr/local/bin/
