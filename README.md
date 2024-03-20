# Projet SurfOnCloud

Project Objective: Build your AWS infrastructure using Terraform.

## Prerequies

Create a file .tfvars and fill variables

ex : `secrets.tfvars`

```hcl
region     = "us-east-1"
access_key = ""
secret_key = ""
token      = ""
vpn_ip     = "" # if not specified, nobody will access to internal LB
```

## Install

Then apply your terraform with your `-var-file="secrets.tfvars"`

```shell
terraform apply -var-file="secrets.tfvars"
```
