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
db_name    = "" # optional
db_user    = "" # optional
db_pass    = "" # optional
```

Then apply your `secrets.tfvars`

```shell
terraform apply -var-file="secrets.tfvars"
```
