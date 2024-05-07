
# Define a null_resource to run the az cli command
resource "null_resource" "az_cli_command" {
  provisioner "local-exec" {
    command = "az webapp vnet-integration add --resource-group ${var.RSGname} --name ${var.APPsername} --vnet ${var.VNETname} --subnet ${var.SUBname}"
  }
}

# This depends on the null_resource so that the command runs during Terraform apply
output "az_cli_command_output" {
  value = null_resource.az_cli_command.triggers
}
