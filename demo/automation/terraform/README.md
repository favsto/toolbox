# Getting started with Terraform and GCP

## Reference guides

* [Official HashiCorp website](https://www.terraform.io/docs/providers/google/index.html)
* [Google Cloud Community](https://cloud.google.com/community/tutorials/managing-gcp-projects-with-terraform)

## Installation

The way I love the most is via Docker:
```bash
docker run -v <local_folder>/terraform:/software sethvargo/hashicorp-installer terraform 0.12.8

# consider adding it into your PATH

# try it
terraform -h
```

If you don't like it you can [download the binary](https://www.terraform.io/downloads.html), copy it in a folder and use it. 

# Run code

## Configuration

Create a service-account.json file. [Reference guide](https://www.terraform.io/docs/providers/google/provider_reference.html).

## Play

```bash
cd example # or whatever example subfolder

terraform init

terraform plan

terraform apply
# ...follow the readme within each subfolder
```