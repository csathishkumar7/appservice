# Module 1: webapp.tf
module "webapp" {
  source = "../root/webapp"  # Path
  resourcegroupname = "kml_rg_main-1af3390391a94b8a"
}

# Module 2: azcliint.tf
module "azcliint" {
  source = "../root/azcliint"  # Path to the directory containing azcliint.tf
  depends_on = [module.webapp]
  # Assign output as input to azcli 
  RSGname = module.webapp.resource_group_name
  APPsername  = module.webapp.appservice_name
  VNETname    = module.webapp.vnet_name
  SUBname     = module.webapp.subnet_name
}
