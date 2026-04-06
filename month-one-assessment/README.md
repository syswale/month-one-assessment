# AWS Architecture - Month 1 Assessment

This repository contains Terraform configuration files to provision a highly available, secure 3-tier web application architecture on AWS. It deploys a custom VPC, public and private subnets, NAT Gateways, an Application Load Balancer, a Bastion Host, Apache Web Servers, and a PostgreSQL Database.

## Prerequisites
Before you begin, ensure you have the following installed and configured on your local machine:
* **Terraform** (v1.14.8)
* **AWS CLI** configured with your IAM credentials (`aws configure`)
* An existing **EC2 Key Pair** in your AWS account (to SSH into the instances)

## Project Structure
* `main.tf`: Contains all AWS resource definitions (VPC, EC2, ALB, Security Groups).
* `variables.tf`: Variable declarations and defaults.
* `outputs.tf`: Defines the outputs displayed after a successful deployment.
* `terraform.tfvars.example`: Example template for sensitive variables.
* `user_data/`: Contains shell scripts to configure the Web and DB servers on boot.
* `evidence/`: Contains screenshots proving successful deployment and functionality.

## Deployment Steps

**1. Clone the repository and navigate to the project directory**
Ensure you are in the `month-one-assessment` folder.

**2. Configure your variables**
Never commit your real IP address or Key Pair name. Copy the example variables file to create a local, ignored file:
     `cp terraform.tfvars.example terraform.tfvars`
Open terraform.tfvars and replace the placeholder values with your actual AWS Key Pair name and your current public IP address (in x.x.x.x/32 format).

**3. Initialize Terraform**
    `terraform init`
This will download the necessary AWS provider plugins.


**4. Review the execution plan**
      `terraform plan`
Verify the resources that Terraform will create.
 
**5. Deploy the infrastructure**
     `terraform apply`
Apply the configuration to your AWS account. You will be prompted to type yes to confirm.


**6. Accessing the Infrastructure**
Once the deployment is complete, Terraform will output three values:

`vpc_id`: The ID of the newly created VPC.

`alb_dns_name`: Paste this URL into your browser to view the running web application. Refresh to see the Load Balancer route traffic between instances.

`bastion_public_ip`: Use this IP to SSH into the Bastion Host securely.

SSH command:
`ssh -i your-key-pair-name.pem ec2-user@<bastion_public_ip>`

Cleanup Instructions (Teardown)
This architecture includes NAT Gateways and an Application Load Balancer, which incur hourly charges on AWS. To avoid unnecessary costs, destroy the infrastructure immediately after testing.

Run the following command to delete all resources created by this project. Type yes when prompted to confirm
 `terraform destroy`
