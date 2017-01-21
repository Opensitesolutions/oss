Check SSH fingerprint
- ssh-keygen -E md5 -f .ssh/id_rsa.pub -lv

Once Public ssh keys are uploaded you can connect using the commands below
find the IP address of the server you want to connect to 
- terraform state show digitalocean_droplet.www[0]
-connect using ssh -i .ssh/id_rsa root@162.243.104.143
