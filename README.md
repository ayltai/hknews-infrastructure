# HK News Infrastructure

[![CircleCI](https://img.shields.io/circleci/project/github/ayltai/hknews-infrastructure/master.svg?style=flat)](https://circleci.com/gh/ayltai/hknews-infrastructure)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/ayltai/hknews-infrastructure)](https://cloud.docker.com/u/ayltai/repository/docker/ayltai/hknews-infrastructure)
[![License](https://img.shields.io/github/license/ayltai/hknews-infrastructure.svg?style=flat)](https://github.com/ayltai/hknews-infrastructure/blob/master/LICENSE)

Automates HK News server provisioning and configurations. Made with ❤

## Features
* Use [Terraform](https://www.terraform.io/) to provision [AWS](https://aws.amazon.com/) [EC2](https://aws.amazon.com/ec2/) instances
* Use [Ansible](https://www.ansible.com/) to setup application server, database, SSL certificate and server monitoring tools

## Prerequisites
You will need [Terraform](https://www.terraform.io/) and [Ansible](https://www.ansible.com/) to run the scripts in this repository.

### Installing Terraform
Follow the [official documentation](https://learn.hashicorp.com/terraform/getting-started/install.html) to install [Terraform](https://www.terraform.io/).

### Installing Ansible
Follow the [official documentation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) to install [Ansible](https://www.ansible.com/).

### SSH key pairs
You will need key pairs for connecting the newly provisioned system using SSH. Currently [Terraform](https://www.terraform.io/) [does not support](https://www.terraform.io/docs/providers/aws/r/key_pair.html) creating key pairs so you have to supply your own.

1. Follow [AWS documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#how-to-generate-your-own-key-and-import-it-to-aws) to create your key pairs
2. Save your private key to `./ssh/hknews.pem` (or as specified in [variables.tf](https://github.com/ayltai/hknews-infrastructure/tree/master/terraform/variables.tf))
3. Save your public key to `./ssh/hknews.pub` (or as specified in [variables.tf](https://github.com/ayltai/hknews-infrastructure/tree/master/terraform/variables.tf))
4. Change the variables defined in [variables.tf](https://github.com/ayltai/hknews-infrastructure/tree/master/terraform/variables.tf) and [playbook.yml](https://github.com/ayltai/hknews-infrastructure/tree/master/ansible/playbook.yml) to fit your needs.

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
