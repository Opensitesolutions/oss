variable "location" {
	description = "Digital Ocean regions"
	#default = "nyc2"
	default = "tor1"
}

variable "websrv_count" {
	description = "Total number of webservers"
	default = 2
}	

variable "haproxy_count" {
	description = "Total number of HAproxies"
	default = 1
}
