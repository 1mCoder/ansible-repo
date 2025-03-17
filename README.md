# Terraform Infrastructure Setup with aws-vault

This repository contains Terraform configurations for deploying a simple infrastructure in AWS, including EC2 instances and security groups. It uses `aws-vault` to securely manage AWS credentials.

## Prerequisites

- Terraform (installed on your machine)
- AWS Account and IAM credentials
- `aws-vault` (installed on your machine)

## Setup Instructions

1. **Clone the repository**:
   Clone this repository to your local machine.

   ```bash
   git clone https://github.com/your-username/terraform-repo.git
   cd terraform-repo
   ```

2. **Configure AWS-vault**:
   Set up your AWS credentials securely using aws-vault. Ensure you have the necessary IAM user and the credentials configured.

   ```bash
   aws-vault add your-profile
   ```
3. **Initialize Terraform**:
   Run the following command to initialize the Terraform working directory. This will download necessary provider plugins.
   Use aws-vault exec to set the environment variables for AWS credentials:

   ```bash
   aws-vault exec your-profile -- terraform init
   ```

4. **Apply the configuration**:
   Apply the Terraform configuration to create the resources on AWS.

   ```bash
   aws-vault exec your-profile -- terraform apply
   ```

5. **Verify the results**:
    After the apply command completes successfully, you can verify the infrastructure:

    Log in to your AWS Console.
    Check the EC2 instances in the EC2 dashboard.
    Verify the Security Groups in the VPC section.

6. **Destroy the infrastructure (optional)**:
    If you want to tear down the infrastructure after testing, run:

   ```bash
   aws-vault exec your-profile -- terraform destroy
   ```