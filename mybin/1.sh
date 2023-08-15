#!/bin/bash
#

# Script to run docker commands as non root


sudo apt remove docker-desktop

for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done


# Dependencies
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

# Add docker keyrings
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

 # Add docker repos to apt sources list
 echo \
	 "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
	 "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
	 sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

 sudo apt-get update

 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

helloworld_output=$(sudo docker run hello-world)

if [[ $helloworld_output == *"permission denied"* ]]; then
    echo "Permission denied issue detected."
	exit(1)
else
    echo "No permission denied issue."
fi



