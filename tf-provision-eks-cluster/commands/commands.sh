# Terraform workspaces enable you to deploy multiple instances of a configuration
# using the same base code with different values for the config. The result is 
# separate state files for each workspace. We are going to make use of the 
# terraform.workspace value for naming and dynamic configuration values.

# Prepare config
terraform init
terraform fmt
terraform validate

######## Sensitive variables #######
# For Linux and MacOS
export AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY=YOUR_SECRET_ACCESS_KEY

# For PowerShell
$env:AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY"
$env:AWS_SECRET_ACCESS_KEY="YOUR_SECRET_ACCESS_KEY"


######## DEV #######
terraform workspace new Development
terraform workspace list
terraform workspace select Development

# Variables at the command line ex:
terraform plan -var=company="Jumia" -var=billing_code="ACCT8675309" -out statedev.tfplan
# Ugh that's unwieldy. store nonsensitive variables in a file terraform.tfvars

terraform plan -out statedev.tfplan
terraform apply statedev.tfplan

######## UAT #######
terraform workspace new UAT
terraform workspace list
terraform plan -out stateuat.tfplan


terraform apply stateuat.tfplan

# Don't forget to tear everything down when you're done! You'll have to run 
# terraform destroy for each workspace
terraform workspace select Development
terraform destroy -auto-approve

terraform workspace select UAT
terraform destroy -auto-approve

# You can delete a workspace too
terraform workspace show
terraform workspace delete Development

# show states
terraform state list
terraform state show stateuat.tfplan