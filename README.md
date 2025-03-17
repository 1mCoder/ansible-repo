# 🚀 Terraform Infrastructure Setup with aws-vault

This repository contains Terraform configurations to deploy a simple infrastructure in AWS, including EC2 instances and security groups. It leverages **aws-vault** to securely manage AWS credentials and uses **Ansible** to configure the servers after deployment.

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) (installed on your machine)
- [AWS Account](https://aws.amazon.com/) and IAM credentials with appropriate permissions
- [aws-vault](https://github.com/99designs/aws-vault) (installed on your machine)
- [Ansible](https://www.ansible.com/) (installed on your machine)

## 🛠️ Setup Instructions

Follow these steps to deploy the infrastructure and configure your AWS resources.

### 1. Clone the repository

Clone this repository to your local machine:

```bash
git clone https://github.com/your-username/terraform-repo.git
cd terraform-repo
```

### 2. Configure AWS-vault

Set up your AWS credentials securely using `aws-vault`. This ensures that your credentials are stored securely and that your session is properly managed.

```bash
aws-vault add your-profile
```

Make sure to replace `your-profile` with the actual profile name you want to use for your AWS environment.

### 3. Initialize Terraform

Run the following command to initialize the Terraform working directory. This command will download the necessary provider plugins for AWS.

```bash
aws-vault exec your-profile -- terraform init
```

### 4. Apply the Terraform configuration

Now, apply the Terraform configuration to create the infrastructure on AWS. This command will create EC2 instances and security groups according to your Terraform scripts.

```bash
aws-vault exec your-profile -- terraform apply
```

### 5. Run Ansible Playbook

After Terraform successfully applies the configuration, execute the Ansible playbook to configure the deployed EC2 instances.

```bash
ansible-playbook ansible/site.yml
```

This playbook will handle the configuration of your EC2 instances after they are provisioned.

### 6. Verify the Infrastructure

After applying the Terraform configuration and running the Ansible playbook, you can verify the infrastructure on AWS:

- Log in to your [AWS Console](https://console.aws.amazon.com/).
- Go to the **EC2 dashboard** to check the provisioned instances.
- Check the **Security Groups** in the **VPC** section to ensure the correct configurations are applied.

You can also check the public and private IP addresses, and DNS names of the EC2 instances from the output below.

### 7. Terraform Outputs

After the `terraform apply` command, Terraform will provide the necessary information for connecting to your EC2 instances.

Example of a generated output:

```json
master = {
  "private_ip" = "172.31.31.189"
  "public_dns" = "ec2-13-61-152-234.eu-north-1.compute.amazonaws.com"
  "public_ip" = "13.61.152.234"
}
slave = {
  "private_ip" = "172.31.29.12"
  "public_dns" = "ec2-51-20-125-209.eu-north-1.compute.amazonaws.com"
  "public_ip" = "51.20.125.209"
}
```

You can use this information for further server configurations or for accessing the instances directly.

### 8. Destroy the Infrastructure (Optional)

If you want to tear down the infrastructure after testing, run the following command:

```bash
aws-vault exec your-profile -- terraform destroy
```

This will remove all the resources created during the deployment process.

## 🗂️ Project Structure

This repository is organized into two main folders:

- **`terraform/`**: Contains Terraform scripts that define the infrastructure (EC2 instances, security groups, etc.).
- **`ansible/`**: Contains Ansible playbooks for configuring the servers after deployment (e.g., installing software, setting up configurations).

## 🔐 Security Best Practices

- **aws-vault** ensures that your AWS credentials are stored securely and are used only when needed.
- Ensure your IAM user has minimal privileges required for provisioning resources.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```