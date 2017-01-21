resource "digitalocean_droplet" "www" {
	image = "ubuntu-14-04-x64"
	count = "${var.websrv_count}"
	name = "websrv-${format("%02d",count.index+1)}"
	region = "${var.location}"
	size = "512mb"
	private_networking = true

	# Install uploaded ssh key into authorized key file of the root user
	ssh_keys = [ "${var.ssh_fingerprint}" ]
}
