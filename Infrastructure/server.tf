resource "digitalocean_droplet" "www-1" {
  image = "ubuntu-16-04-x64"
  name = "HelloWorldHTTPServer"
  region = "nyc2"
  size = "512mb"
  private_networking = true
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]

  connection {
    user = "root"
    type = "ssh"
    private_key = "${var.pvt_key}"
    timeout = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      # Install golang
      "sudo apt-get update",
      "sudo apt-get -y install golang",
      "export GOPATH=/root/gopath",
      "export PATH=$PATH:/root/gopath/bin",
      "go get github.com/Masterminds/glide",
      # Download project repository
      "git clone https://github.com/cube2222/HelloWorldTerraformTest",
      # Build project
      "cd HelloWorldTerraformTest/",
      "glide install",
      "go build",
      "./HelloWorldTerraformTest"
    ]
  }
}