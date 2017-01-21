variable "do_token" {}
variable "pub_key" {}
variable "priv_key" {}
variable "ssh_fingerprint" {}

provider "digitalocean" {
        token = "${var.do_token}"
}

# Upload local public key to Digital Ocean
resource "digitalocean_ssh_key" "default" {
        name = "Terraform - Open Site Solutions"
        public_key = "${file(".ssh/id_rsa.pub")}"
}
