#!/bin/bash


UninstallDocker()
{
    if [ "${USER}" != "root" ]; then
    echo "$0 must be run as root!"
    exit 2
fi

while true; do
  read -p "Remove Docker (Y/N): " yn
  case $yn in
    [Yy]* ) docker -v $(docker ps); break;;
    [Nn]* ) echo " Bye Bye " ; exit;;
    * ) echo "Please answer yes or no."; exit 1;;
  esac
done

echo "Removing Applications..."
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin 

sleep 2s

echo "Removing docker binaries..."
rm -f /usr/local/bin/docker
rm -rf /var/lib/docker
rm -rf /var/lib/containerd

sleep 2s

echo "Auto-Removing..."
apt auto-remove

sleep 2s

echo "All Done!" 
clear
}
press_enter()
{
    echo -en "\nPress Enter to continue"
    read
    clear
}

UninstallDocker-Compose()
{
      if [ "${USER}" != "root" ]; then
    echo "$0 must be run as root!"
    exit 2
fi

while true; do
  read -p "Remove Docker Compose (Y/N): " yn
  case $yn in
    [Yy]* ) docker-compose version $(docker-compose version); break;;
    [Nn]* ) echo " Bye Bye " ; exit;;
    * ) echo "Please answer yes or no."; exit 1;;
  esac
done

echo "Removing Applications..."
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin 

echo "Removing docker binaries..."
rm -f /usr/local/bin/docker
rm -f /usr/local/bin/docker-machine
rm -r /usr/local/bin/docker-machine-driver*
rm -f /usr/local/bin/docker-compose

echo "Removing boot2docker.iso"
rm -rf /usr/local/share/boot2docker

echo "All Done!" 
}

clear

echo "Let's figure what is running."
echo ""
echo ""
echo "    From some basic information on your system, you appear to be running: "
echo "        --  Docker version:                " $(docker-compose -v )
echo "        --  Docker-compose version:        " $(docker compose version)
echo "        --  OSVer        " $(lsb_release -r)
echo "        --  CdNme        " $(lsb_release -c)
echo ""
echo "------------------------------------------------"
echo ""



PS3="Please select What u Wanna do " 
select _ in \
    "Uninstall Docker" \
    "Uninstal Docker-Compose" \
    "Ubuntu 18.04 (Bionic)" \
    "Ubuntu 20.04 / 21.04 (Focal / Hirsute)" \
    "Arch Linux" \
    "End this Installer"
do
  case $REPLY in
    1) UninstallDocker ;;
    2) UninstallDocker-Compose ;;
    3) UninstallDocker ;;
    4) UninstallDocker ;;
    5) UninstallDocker ;;
    6) exit ;;
    *) echo "Invalid selection, please try again..." ;;
  esac
done