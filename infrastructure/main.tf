terraform {
        required_version = ">=0.13.5"
    backend "azurerm" {
        storage_account_name = "__terraform_storage_account__"
            container_name   = "terraform"
            key              = "terraform.tfstate"
        access_key = "_storage_key_"
        features{}        
    }

}
provider "azurerm" {
    version = "=2.34.0"
    features{}
}

resource "azurerm_resource_group" "rg" {
    name     = "REACT_Terraform" 
    location = "EAST US"
}

resource "azurerm_app_service_plan" "rg" {
    name     = "_app_service_plan_" 
    location = "$(azurerm_resource_gruop.rg.location)"
    resource_group_name = "$(azurerm_resource_gruop.rg.name)"

    sku {
        tier = "free"
        size = "f1"
    }
}
