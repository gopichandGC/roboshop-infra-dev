#!/bin/bash

component=$1
environment=$2 #dont use env as a variable here, it is reserved in linux
yum install python3.11-devel python3.11-pip -y
pip3.11 install ansible botocore boto3
# Ansible pull -> pulls playbooks from a VCS repo and excutes them on target host
ansible-pull -U https://github.com/gopichandGC/roboshop-ansible-roles-tf.git -e component=$component -e env=$environment main-tf.yaml
