#!/bin/bash

ISACT=$( (sudo systemctl is-active docker ) 2>&1 )

if [[ "$ISACT" != "inactive" ]]; then


    read -p "Remove Docker Compose (Y/N): " yn
    case $yn in
        [Yy]* ) docker -v$(docker -v); break;;
        [Nn]* ) echo "Removing Applications..."
                sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin; exit;;
        * ) echo "Please answer yes or no."; exit 1;;
    esac
    done
fi
