/* terraform {
  cloud {
    hostname
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.00.0"
    }
  }
  required_version = ">= 0.14.0"
} */

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.0.0"
    }
  }
  required_version = ">=0.14.0"
  cloud {
    hostname     = "app.terraform.io"
    organization = "fm-dev"
    workspaces {
      name = "learn-terraform-dev"

    }
  }
}



/* terraform {
  required_version = "<version>"
  required_providers {
    <PROVIDER> {
      version = "<version-constraint>"
      source = "<provider-address>"
    }
  }
  provider_meta "<LABEL>" { 
    # Shown for completeness but only used for specific cases     
  }
  backend "<TYPE>" {        
    # `backend` is mutually exclusive with `cloud` 
    "<ARGUMENTS>"
  }
  cloud {                   
    # `cloud` is mutually exclusive with `backend` 
    organization = "<organization-name>"
    workspaces {
      tags = [ "<tag>" ]
      name = "<workspace-name>"
      project = "<project-name>"
    }
    hostname = "app.terraform.io"
    token - "<TOKEN>"
  }
  experiments = [ "<feature-name>" ]
} */
