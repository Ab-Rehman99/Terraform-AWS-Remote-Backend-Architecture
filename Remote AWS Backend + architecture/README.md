# Terraform-AWS-Remote-Backend-Architecture

Youtube Video Link of course: https://www.youtube.com/watch?v=7xngnjfIlK4

This Repo has script of terraform for using AWS (S3, DynamoDB) as a remote backend and creating an architecture using EC2 and ELB. 

The concept is to use Bootstrapping for migarting local backend to AWS:

- Create S3 bucket for storing state file and dynamoDB for locking using terraform first.
- Update the code to push the state file to that S3 bucket created before.


![architecture](https://github.com/Ab-Rehman99/Terraform-AWS-Remote-Backend-Architecture/assets/85974328/849e7c2b-c556-49df-a2b4-eb8d1891dfef)
