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
clear
echo "Auto-Removing..."
apt auto-remove

sleep 2s

echo "All Done!" 

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
    [Yy]* ) docker compose version $(docker compose version); break;;
    [Nn]* ) echo " Bye Bye " ; exit;;
    * ) echo "Please answer yes or no."; exit 1;;
  esac
done

echo "Removing docker-compose binaries..."
sudo rm /usr/local/bin/docker-compose
sleep 2s 
echo "Removing aplication..."
sudo apt remove docker-compose
sleep 3s
echo "Auto-Removing..."
apt auto-remove

echo "All Done!" 
}

clear

echo "Let's figure what is running."
echo ""
echo ""
echo "    From some basic information on your system, you appear to be running: "
echo "        --  Docker version:                " $(docker -v )
echo "        --  Docker-compose version:        " $(docker compose version)
echo ""
echo "-------------------------------------------------------------------------"
echo ""



PS3="Please select What u Wanna do " 
select _ in \
    "Uninstall Docker" \
    "Uninstal Docker-Compose" \
    "Exit"
do
  case $REPLY in
    1) UninstallDocker ;;
    2) UninstallDocker-Compose ;;
    3) exit ;;
    *) echo "Invalid selection, please try again..." ;;
  esac
done