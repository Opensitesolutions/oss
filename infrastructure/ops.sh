#! /bin/bash

dir=$(pwd)
vbgui="true"

if [ $vbgui = "true" ];then
	Virtualbox list vms &
else
	echo "Not launching Virtualbox"
fi

clear
# Rebuilding environment
echo -e "\t\t\t Rebuilding the environment"
echo -e "\t\t\t ========================== "
echo ""
echo ""

echo "Destroying environment:"
echo ""
cd $dir/ops

# Check if this is a vagrant environment
if [ -f Vagrantfile ]; then
	vagrant destroy --force
else
	echo "No vagrant file detected .. exiting"
	exit 1
fi

echo ""
echo -e "\t\t\tBuild Local infrastructure using Vagrant"
echo -e "\t\t\t========================================"
echo ""
vagrant status

echo ""
echo -e "\t\t\tBuilding Vagrant (Virtualbox(s)"
echo -e "\t\t\t==============================="
echo ""
vagrant up 

echo ""
echo -e "\t\t\tProvisioning servers"
echo -e "\t\t\t===================="
echo ""

echo "Running Site build:"
echo ""
cd  $dir/ops
ansible-playbook ../configuration/ops.yml
