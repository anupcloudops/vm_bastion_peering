terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.72.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name = "adotest"
  #   storage_account_name = "adostoragetest888"
  #   container_name = "teststatefile"
  #   key = "test.tfstate"
  # }
}
provider "azurerm" {
  features {}
  subscription_id = "448f5bc1-2cca-479b-80a7-aab8ffdc01b9"
}