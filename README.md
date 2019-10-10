# HK News Infrastructure

[![CircleCI](https://img.shields.io/circleci/project/github/ayltai/hknews-infrastructure/master.svg?style=flat)](https://circleci.com/gh/ayltai/hknews-infrastructure)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/ayltai/hknews-infrastructure)](https://cloud.docker.com/u/ayltai/repository/docker/ayltai/hknews-infrastructure)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/3231/badge)](https://bestpractices.coreinfrastructure.org/projects/3231)
[![Release](https://img.shields.io/github/release/ayltai/hknews-infrastructure.svg?style=flat)](https://github.com/ayltai/hknews-infrastructure/releases)
[![License](https://img.shields.io/github/license/ayltai/hknews-infrastructure.svg?style=flat)](https://github.com/ayltai/hknews-infrastructure/blob/master/LICENSE)

Automates HK News server provisioning and configurations. Made with ❤

## Features
* Use [Terraform](https://www.terraform.io/) to provision [AWS](https://aws.amazon.com/) [EC2](https://aws.amazon.com/ec2/) instances
* Use [Ansible](https://www.ansible.com/) to setup application server, database, SSL certificate and system monitoring tools

## Prerequisites
You will need [Terraform](https://www.terraform.io/) and [Ansible](https://www.ansible.com/) to run the scripts in this repository.

### AWS permissions
You will need the following policies attached to the AWS user account used to run the scripts:
* AmazonEC2FullAccess
* AmazonVPCFullAccess
* CloudWatchActionsEC2Access

### Installing Terraform
Follow the [official documentation](https://learn.hashicorp.com/terraform/getting-started/install.html) to install [Terraform](https://www.terraform.io/).

### Installing Ansible
Follow the [official documentation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) to install [Ansible](https://www.ansible.com/).

### SSH key pairs
You will need a key pair for connecting the newly provisioned instance using SSH. Currently [Terraform](https://www.terraform.io/) [does not support](https://www.terraform.io/docs/providers/aws/r/key_pair.html) creating key pairs so you have to supply your own.

1. Follow [AWS documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#how-to-generate-your-own-key-and-import-it-to-aws) to create your key pairs
2. Save your private key to `./ssh/hknews.pem` (or as specified in [variables.tf](https://github.com/ayltai/hknews-infrastructure/tree/master/terraform/variables.tf))
3. Save your public key to `./ssh/hknews.pub` (or as specified in [variables.tf](https://github.com/ayltai/hknews-infrastructure/tree/master/terraform/variables.tf))
4. Change the variables defined in [variables.tf](https://github.com/ayltai/hknews-infrastructure/tree/master/terraform/variables.tf) and [playbook.yml](https://github.com/ayltai/hknews-infrastructure/tree/master/ansible/playbook.yml) to fit your needs.

### Ansible Vault password
The SSH certificate password is encrypted by [Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html). You will need to specify a Vault password file in order to decrypt the password during the Ansible automation process. The file path is defined in [Let's Encrypt role](https://github.com/ayltai/hknews-infrastructure/tree/master/ansible/letsencrypt/vars/main.yml).

### DNS
We prefer to use an external DNS provider instead of [AWS Route53](https://aws.amazon.com/route53/) to manage the server public domain.

The Elastic public IPv4 address of the EC2 instance created will be printed out in your console during the Terraform automation process. You are expected to configure your DNS to resolve the domain name to this IP address. [Let's Encrypt role](https://github.com/ayltai/hknews-infrastructure/tree/master/ansible/letsencrypt) will wait for at most 30 minutes for this.

## Post installation
Since we are associating an Elastic IP to an EC2 instance, the Elastic IP must be created **after** the EC2 instance. The Ansible playbook will be executed against a temporary public IP and when it finishes, you are expected to configure your DNS provider to resolve the domain name to the Elastic IP, which will be displayed at the very end of the whole process.

## Provisioning
1. Go to [terraform](https://github.com/ayltai/hknews-infrastructure/tree/master/terraform) directory
  ```sh
  cd terraform
  ```
2. Initialize Terraform backend and plugins
  ```sh
  terraform init
  ```
3. Plan for the changes
  ```sh
  terraform plan -out main
  ```
4. If the potential changes look fine, apply them
  ```sh
  terraform apply main
  ```

## HK News Backend
[hknews-backend](https://github.com/ayltai/hknews-backend)

## HK News Frontend
[hknews-android](https://github.com/ayltai/hknews-android)
[hknews-web](https://github.com/ayltai/hknews-web)
