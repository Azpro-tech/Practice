module "vnet1" {
  source = "../../module/vnet"
vnet_name = "vnet909"
vnet_location = "central india"
rg_name = "azim-rg"
address_space = ["10.0.0.0/16"]
}

module "subnet" {
  source = "../../module/subnet"
  subnet_name = "frontend-subnet"
  rg_name = "azim-rg"
  vnet_name = "vnet909"
  address_prefixes = ["10.0.1.0/24"]
}

module "subnet" {
  source = "../../module/subnet"
  subnet_name = "backend-subnet"
  rg_name = "azim-rg"
  vnet_name = "vnet909"
  address_prefixes = ["10.0.2.0/24"]
}

terraform {
  backend "azurerm" {}
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.38.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "fadfa500-48fa-4d7d-ae72-215103d56b2f"
}
