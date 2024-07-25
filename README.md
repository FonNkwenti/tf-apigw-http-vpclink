# VPC Peering Demo setup
This terraform project is used to setup the infrastructure required to demo VPC Peering between two VPCs.

## Prerequisites
Before you begin, ensure you have the following:

- 2 VPCs
- each VPC must have a one private subnet
- security groups allowing ICMP Traffic from the peer private IP CIDR
- an EC2 instance in each VPC with an instance role for Systems Manager


## Architecture
![Diagram](aws-client-vpn.webp)

---
## Getting Started

1. Go to the Demos directory:

   ```bash
   cd /Users/fon/AAI/Demos
   ```
2. Navigate to the project directory:
   ```bash
   /Users/fon/AAI/Demos/module_10_networking_2
   ```
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Review and modify `variables.tf` to customize your API configurations.
5. Create a `terraform.tfvars` file in the root directory and pass in values for `region`, `account_id`, `tag_environment` and `tag_project`
   ```bash
    region               = "eu-central-1"
    account_id           = <<your account id>>
    tag_environment      = "dev"
    tag_project          = "module-7-networking-2-vpc-peering
   ```
6. Apply the Terraform configure:
   ```bash
   terraform apply
   ```
7. After the apply is complete, Terraform will output the private API Gateway URL which can be used to access the private Serverless REST API endpoints.

---

## Clean up
Remove all resources created by Terraform.
   ```
   terraform destroy
   ```

---



## License

This project is licensed under the MIT License - see the `LICENSE` file for details.
