# DSAG Hackathon 2024

![image](https://github.com/randomstr1ng/dsag-hackathon-2024/assets/68017536/9e812311-a75e-48aa-b23e-e2fa1024c91d)


## How to
- clone repository including all submodules
```bash
git clone --recurse-submodules  git@github.com:randomstr1ng/dsag-hackathon-2024.git
```
- prepare deployment
```bash
cd infrastructure-deployment
terraform init
```
- add `terraform.tfvars` file with the following content
```terraform
aws_profile = <your aws profile>
aws_region = <your aws region>
```
- deploy infrastructure
```bash
terraform apply
```