# IaC with Terraform 

## Prerequisites
### Installing Terraform 
Download Binaries here: https://www.terraform.io/downloads.html

``Terraform is distributed as a single binary. Install Terraform by unzipping it and moving it to a directory included in your system's PATH . ``

### Chosing the Provider
For this example `aws` is used as a provider (see `main.tf` provider resource).<br>
You can use any provider of your choice. An overview of all providers you can see here: https://www.terraform.io/docs/providers/index.html

If you change the provider, please be sure to subsequently change the resources, as well!

### Setting up Access credentials
There are multiple ways to use your cloud provider's credentials.
More information can be found here: https://www.terraform.io/docs/providers/aws/index.html

For example:
* using hard coded credentials: https://www.terraform.io/docs/providers/aws/index.html#static-credentials<br>
Need to update the provider ressource in `main.tf`
* using environment variables: https://www.terraform.io/docs/providers/aws/index.html#environment-variables<br>
I used this in combination with the profile provided by the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html),<br>
by using `AWS_PROFILE=<my_aws_cli_profile> terraform <command>`

## Using these Scripts
1.  navigate into the directory `s3-static-website`
2. initialise Terraform provider with `terraform init`
3. [optional] using `terraform validate` to check if the scripts are valid
4. planning your infrastructure using the variables file via<br>
 `terraform plan -var-file=variables.tfvars`
5. if your are happy with your plan, apply<br>
  `terraform apply -var-file=variables.tfvars`<br> 
    * _Side note:_ with `terraform apply -auto-approve [...]` you can skip the additional input after the planning step
6. if you are tired of your infrastructure you can run `terraform destroy -var-file=variables.tfvars`<br> 
    * _Side note:_ with `terraform destroy -auto-approve [...]` you can skip the additional input after the planning step
    
## Contact
Feel free to contact me in case of questions. :wave: <br>
:baby_chick: (aka Twitter): [@wolkencode](https://twitter.com/wolkencode) <br>
:email: schille.nora@gmail.com or nora.schille@codecamp-n.com
