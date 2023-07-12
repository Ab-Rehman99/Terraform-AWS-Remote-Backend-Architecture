#!/bin/bash

# Clone the repository
echo "Cloning the repository..."
git clone https://github.com/Ab-Rehman99/Terraform-EC2-RDS.git

# Move into the cloned directory
echo "Moving into the cloned directory..."
cd Terraform-EC2-RDS

# Run Terraform and save the output to a file
echo "Initializing Terraform..."
terraform init
echo "Applying Terraform configuration..."
terraform apply -auto-approve
echo "Terraform output saved..."
terraform output > /home/ubuntu/output.txt