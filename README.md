# appservice
module to create app service and integrate with the created VNET

The module has main,webapp and azcliint folders serving the modules.
main.tf will call two modules webapp and azcliint,
webapp will create the required resources such as the appservices,serviceplan,service slot VNET,subnet.
azcliint will be used to execute the azcli command for integrating the appservice with the existing VNET created from module 1 using the  local_exec.

main.tf has one variable as input resourcegroup name, 
--->use the module to create the appservices in the same resourge group and integrate with the VNET and provided subnet.


Terraform init to initialize the backend
terraform apply # from the main.tf module to call the 2 other functions.
