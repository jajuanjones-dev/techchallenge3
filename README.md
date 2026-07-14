> **TL;DR:** Infrastructure as Code project demonstrating a two-tool provisioning workflow — Terraform provisions AWS infrastructure (EC2, S3, IAM role, security group), then Ansible configures the server (installs and configures Nginx to serve a live web page). Demonstrates the separation of concerns between infrastructure provisioning and configuration management, two distinct and commonly-paired DevOps disciplines.

---

# Tech Challenge 3 — Infrastructure as Code with Terraform and Ansible

A "Hello, World!" web page deployed on AWS EC2, provisioned with **Terraform** and configured with **Ansible**.

## Live Web Page
http://3.86.34.201

## Project Overview
This project uses Terraform to provision AWS infrastructure (EC2 instance, S3 bucket, IAM role, and security group), then uses Ansible to configure that EC2 instance with an Nginx web server serving a "Hello, World!" page.

## Tech Stack
- **Infrastructure:** Terraform, AWS EC2, S3, IAM, Security Groups
- **Configuration Management:** Ansible
- **Web Server:** Nginx

## Prerequisites
- AWS account with configured credentials (`aws configure`)
- Terraform
- Ansible
- An SSH key pair (generated as part of this project)

## Setup Instructions

### 1. Clone the repo

git clone https://github.com/LifeasJJ/techchallenge3.git
cd techchallenge3

### 2. Generate an SSH key pair (if not already present)

### 3. Configure AWS credentials

## Deployment Steps

### 1. Provision infrastructure with Terraform

Confirm with `yes` when prompted. Note the `ec2_public_ip` output — you'll need it for the next step.

### 2. Update the Ansible inventory
Edit `ansible/inventory.ini` and replace the IP address with your new `ec2_public_ip` output.

### 3. Configure the server with Ansible

### 4. Verify

You should see "Hello, World!"

## Explanation of the Code

### Terraform
- **provider.tf** — declares the AWS and random providers, sets the region to `us-east-1`
- **security_group.tf** — creates a security group allowing inbound SSH (22) and HTTP (80), and all outbound traffic
- **iam.tf** — creates an IAM role for the EC2 instance with read-only S3 access, wrapped in an instance profile
- **s3.tf** — creates an S3 bucket with a randomized suffix for a globally unique name
- **keypair.tf** — registers the local SSH public key with AWS so it can be attached to the instance
- **ami.tf** — looks up the latest Ubuntu 22.04 AMI dynamically
- **ec2.tf** — provisions the EC2 instance, attaching the security group, key pair, and IAM instance profile
- **outputs.tf** — outputs the EC2 public IP and S3 bucket name after apply

### Ansible
- **inventory.ini** — defines the target host (the EC2 instance) and how to connect to it (SSH user and private key)
- **playbook.yml** — a single play with four tasks:
  1. Updates the apt package cache
  2. Installs Nginx
  3. Starts and enables the Nginx service
  4. Deploys a static `index.html` with "Hello, World!" to Nginx's web root


