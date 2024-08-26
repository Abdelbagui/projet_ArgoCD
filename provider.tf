provider "azurerm" {
  features = {}
}

terraform { 
  cloud { 
    
    organization = "ABDELBAGUI" 

    workspaces { 
      name = "group" 
    } 
  } 
}
