terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_ssh_key" "ssh_key" {
  name       = "mykey"
  public_key = file("/Users/apple/terraform/id_rsa.pub")
}

provider "digitalocean" {
}

resource "digitalocean_droplet" "example" {
  name   = "example-droplet"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-20-04-x64"
  ssh_keys = [
    digitalocean_ssh_key.ssh_key.fingerprint
    ]
}

