#!/bin/bash

script_dir=$(dirname "$0")

if [[ "$EUID" -ne 0 ]]; then
	echo "Sorry, you need to run this as root"
	exit 1
fi


# Create new user
read -p "Create new user? [default: no] [yes:no]: " create_user
create_user=${create_user:-no}
if [ "$create_user" == "yes" ]; then
  echo
  $script_dir/func/user.sh
fi

# Install software
read -p "Install other package (software)? [default: no] [yes:no]: " install_soft 
install_soft=${install_soft:-no}
if [ "$install_soft" == "yes" ]; then
  echo
  $script_dir/func/install.sh $script_dir
fi



apt install lnav nmap speedtest-cli htop net-tools traceroute tree -y

echo
echo "Installation script has been completed!"
echo