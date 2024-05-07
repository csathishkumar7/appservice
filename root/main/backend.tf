terraform {
  backend "azurerm" {
    storage_account_name = "newstorageaccproj"
    container_name       = "newstorcontprojnew"
    key                  = "terraform.tfstate"
    resource_group_name  = "kml_rg_main-1af3390391a94b8a"
    subscription_id      = "a2b28c85-1948-4263-90ca-bade2bac4df4"
  }
}
