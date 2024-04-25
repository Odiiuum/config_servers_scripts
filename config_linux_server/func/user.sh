#!/bin/bash

echo "Creating a new users..."

read -p "Enter name a new user: " new_user_name

useradd -m -s /bin/bash $new_user_name

read -p "Make a user with sudo? [default: yes] [yes:no]: " add_sudo

add_sudo=${add_sudo:-yes}

if [ "$add_sudo" == "yes" ]; then
  usermod -aG sudo $new_user_name
fi

read -p "Enter a password [$new_user_name]: " new_user_pass

echo "$new_user_name:$new_user_pass" | chpasswd

echo "Create new user: @$new_user_name. "
