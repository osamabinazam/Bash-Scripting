#!/bin/bash

echo -e "\nHello From Update Script\n"
path_netplan="/etc/netplan/01-Network-Manager_all.yaml"
find_file=$(find /etc/netplan -type f -name 01-Network-Manager_all.yaml)


echo -e "\n\n**************************************************************************\n"
echo -e "* * * * * * * * * * * * * * Checking OS  * * * * * * * * * * * * * * * *  *\n"
echo -e "**************************************************************************\n"


OS=$(lsb_release -si 2>&-)

if [ $OS == "Ubuntu" ] 
then 
	echo -e "\nOS Codename is: $OS. \nThis OS is compatible to this script"
elif [ $OS == "Lubuntu" ]
then 
	echo -e "\nOS Codename is: $OS.\nThis OS is compatible to this script"
elif [ $OS == "LUbuntu" ]
then
	echo "\nOS Codename is: $OS. \nThis OS is compatible to this script"
else
	echo "\nOS Codename is: $OS. \n"
	echo "Abort, this script is only intended for Ubuntu-like distros"
	exit 2
fi

echo -e "\n\n**************************************************************************\n"
echo -e "* * * * * * * Changing from static IP to DHCP address  * * * * * * * * * *\n"
echo -e "**************************************************************************\n"

if [ "$find_file" == "$path_netplan" ];
then
	sudo rm /etc/netplan/01-Network-Manager_all.yaml
fi


var=$(ifconfig | grep "enp")
index=$(awk -v c="$var" -v d=":" 'BEGIN{print index(c,d)}')
interface="${var:0:index}"
echo -e "[+] Ethernet interface : $interface \n"
echo -e "[+] Updating netplan configuration file in /etc/netplan.\n"

sudo echo "# Let NetworkManager manage all devices on this system
# This file describes the network interfaces available on your system
# For more information, see netplan(5).
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    $interface
     dhcp4: true" >> /etc/netplan/01-Network-Manager_all.yaml
     
echo -e "[+] Applying netplan Configuration\n"
sudo netplan apply

echo -e "[*] Waiting for Internet Connection\n"
sleep 10
echo -e "[+] successfully connected to DHCP \n"

echo -e "\n***************************************************************************\n"
echo -e "* * * * * * * * * * * Updating source repositories  * * * * * * * * * * * *\n"
echo -e "***************************************************************************\n"

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'
sudo apt-get update

echo -e $TEXT_YELLOW
echo 'APT update finished...'
echo -e $TEXT_RESET

echo -e "\n***************************************************************************\n"
echo -e "* * * * * * * * * * * * * * Upgrading Packages *  * * * * * * * * * * * *\n"
echo -e "***************************************************************************\n"

sudo apt-get upgrade

echo -e $TEXT_YELLOW
echo 'APT upgrade finished...'
echo -e $TEXT_RESET

echo -e "\n***************************************************************************\n"
echo -e "* * * * * * * * * * * * * * Upgrading Distribution *  * * * * * * * * * * * *\n"
echo -e "***************************************************************************\n"

sudo apt-get dist-upgrade
echo -e $TEXT_YELLOW
echo 'APT distributive upgrade finished...'
echo -e $TEXT_RESET

echo -e "\n***************************************************************************\n"
echo -e "* * * * * * * * * * * * * * Removing old Packages *  * * * * * * * * * * * *\n"
echo -e "***************************************************************************\n"


sudo apt-get autoremove
echo -e $TEXT_YELLOW
echo 'APT auto remove finished...'
echo -e $TEXT_RESET

if [ -f /var/run/reboot-required ]; then
    echo -e $TEXT_RED_B
    echo -e 'Reboot required! \n'
    echo -e "Rebooting"
    sudo reboot
    echo -e $TEXT_RESET
fi

