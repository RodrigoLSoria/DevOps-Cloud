module "modulito" {
  source = "../lab1"

  resource_group_name = "rg-rod"
  location            = "eastus"

  public_subnet_id  = azurerm_subnet.public_subnet.id
  private_subnet_id = azurerm_subnet.private_subnet.id

  subnets = {
    private_subnet = {
      name             = "private_subnet"
      address_prefixes = ["10.0.1.0/24"]
    },
    public_subnet = {
      name             = "public_subnet"
      address_prefixes = ["10.0.2.0/24"]
    }
  }


  traffic_rules = [{
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    },
    {
      name                       = "HTTP"
      priority                   = 101
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]

  resource_groups = {
    "rg-ro1" = {
      location = "East US"
      tags     = { environment = "test" }
      virtual_machines = {
        vm1 = { size = "Standard_DS1_v2", /* other VM configurations */ },
        vm2 = { size = "Standard_DS1_v2", /* other VM configurations */ },
        vm3 = { size = "Standard_DS1_v2", /* other VM configurations */ },
        vm4 = { size = "Standard_DS1_v2", /* other VM configurations */ }
      }
    },
    "rg-ro2" = {
      location = "West Europe"
      tags     = { environment = "prod" }
      virtual_machines = {
        vm1 = { size = "Standard_DS1_v2", /* other VM configurations */ },
        vm2 = { size = "Standard_DS1_v2", /* other VM configurations */ }
      }
    },
    "rg-ro3" = {
      location = "East US"
      tags     = { environment = "test" }
      virtual_machines = {
        vm1 = { size = "Standard_DS1_v2", /* other VM configurations */ },
      }
    },
    "rg-ro4" = {
      location = "East US"
      tags     = { environment = "test" }
      virtual_machines = {
        vm1 = { size = "Standard_DS1_v2", /* other VM configurations */ },
        vm2 = { size = "Standard_DS1_v2", /* other VM configurations */ },
        vm3 = { size = "Standard_DS1_v2", /* other VM configurations */ },
        vm4 = { size = "Standard_DS1_v2", /* other VM configurations */ },
        vm5 = { size = "Standard_DS1_v2", /* other VM configurations */ },
        vm6 = { size = "Standard_DS1_v2", /* other VM configurations */ },
        vm7 = { size = "Standard_DS1_v2", /* other VM configurations */ },
        vm8 = { size = "Standard_DS1_v2", /* other VM configurations */ }
      }
    }
  }


}