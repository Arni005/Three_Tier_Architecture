# Terraform 3-Tier Architecture Project

## Overview
This project demonstrates a basic **3-tier architecture** infrastructure setup using Terraform on AWS. It is designed as a learning project to understand Infrastructure as Code (IaC) concepts and how cloud resources are provisioned and connected.

The architecture includes:
- Web Tier
- Application Tier
- Database Tier

---

## Architecture

- **Web Tier**
  - EC2 instance running Apache HTTP Server
  - Exposed to the internet via public subnet

- **App Tier**
  - EC2 instance in a private subnet
  - Handles backend logic (placeholder setup for learning)

- **Database Tier**
  - Amazon RDS MySQL instance (or EC2-based DB if configured)
  - Hosted in a private subnet for security

- **Networking**
  - Custom VPC
  - Public and private subnets
  - Internet Gateway
  - NAT Gateway for private subnet internet access

---

## Technologies Used

- Terraform
- AWS (EC2, VPC, Subnets, RDS, NAT Gateway)
- Apache HTTP Server
- Ubuntu

---

## How It Works

1. Terraform creates the AWS infrastructure:
   - VPC
   - Subnets (public & private)
   - Route tables
   - NAT Gateway
   - EC2 instances
   - RDS database

2. User data script installs and configures Apache on the Web Tier EC2.

3. The Web Tier serves a simple HTML page to confirm deployment.

---

## User Data Script

The web server is configured using `userdata.sh`:

- Installs Apache HTTP Server
- Starts and enables the service
- Creates a default `index.html` page

---

## Architecture Diagram

<video width="600" controls>
  <source src="assets/WhatsApp Video 2026-05-18 at 3.49.09 PM.mp4" type="video/mp4">
</video>

---

## How to Deploy

```bash
terraform init
terraform plan
terraform apply 
```
To destroy the infrastructure:

```bash
terraform destroy
```

---

## Learning Outcome

This project helps understand:

- Infrastructure as Code (IaC)
- AWS networking (VPC, subnets, routing)
- Multi-tier architecture design
- EC2 and RDS provisioning
- Basic automation using Terraform
