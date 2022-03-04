resource "digitalocean_droplet" "container" {
  image  = "rancheros"
  name   = "lostcities-gamestate"
  region = "nyc2"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]

  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      //"docker pull ${var.oci_path}"
      "docker pull ghcr.io/lostcities-cloud/lostcities-gamestate:latest"
      "docker run dereknelson.io/library/lostcities-gamestate ."
    ]
  }
}
