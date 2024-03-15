terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }

  # Update this block with the location of your terraform state file
  backend "azurerm" {
    resource_group_name  = "rg-terraform-github-actions-state"
    storage_account_name = "terraformgithubactions"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
  AZURE_TENANT_ID="d7e0ed3c-6dd3-4e5e-98e2-320b13363c65"
  AZURE_CLIENT_ID="be54aca7-0bca-412e-82fc-1003caf00f12"
  AZURE_SUBSCRIPTION_ID="055305ca-e98f-48f2-9e89-04ad7d23a14f"
}

# Define any Azure resources to be created here. A simple resource group is shown here as a minimal example.
resource "azurerm_resource_group" "devops_test" {
  name     = devops
  location = var.location
}
