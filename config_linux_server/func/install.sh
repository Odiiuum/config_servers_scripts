#!/bin/bash

# DOCKER AND DOCKER COMPOSE

read -p "Install docker? [default: yes] [yes:no]: " install_docker

install_docker=${install_docker:-no}

if [ "$install_docker" == "yes" ]; then
  echo 
  echo "Installing Docker and Docker Compose (latest version)"
  $1/software/docker.sh
fi

#