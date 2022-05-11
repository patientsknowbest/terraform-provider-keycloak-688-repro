terraform {
  required_version = ">=1.0.0, <2.0.0"
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "3.6.0"
    }
  }
  backend "local" {
    path = "./.state/tfstate.json"
  }
}

provider "keycloak" {
  client_id = "admin-cli"
  username  = "admin"
  password  = "admin"
  url       = "http://localhost:8080"
  base_path = "/"
}

resource "keycloak_realm" "my_realm" {
  realm                       = "my-realm"
  enabled                     = true
}

resource "keycloak_openid_client" "my_client" {
  realm_id    = keycloak_realm.my_realm.id
  client_id   = "my-client"
  enabled     = true
  access_type = "BEARER-ONLY"
}