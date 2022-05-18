#!/bin/bash
uninstall()
{
    ISACT=$( (sudo systemctl is-active docker ) 2>&1 )
    ISCOMP=$( (docker-compose -v ) 2>&1 )

        #### Try to check whether docker is installed and running - don't prompt if it is
        if [[ "$ISACT" != "active" ]]; then
            read -rp "Docker-CE (y/n): "  ROCK
        else
        
            echo ""
            echo ""
        fi

        if [[ "$ISCOMP" == *"command not found"* ]]; then
            read -rp "Docker-Compose (y/n): " DCOMP
        else
            echo "Docker-compose appears to be installed."
            echo ""
            echo ""
        fi
}


    if [[ "$ROCK" = [yY] ]]; then
        echo "############################################"
        echo "######     UnInstall Docker-Compose     ######"
        echo "############################################"

        # install docker-compose
        echo ""
        echo "    1. UnInstalling Docker-Compose..."
        echo ""
        echo ""
        sleep 2s

        ######################################
        ###     Install Debian / Ubuntu    ###
        ######################################        
        
        if [[ "$OS" != "1" ]]; then
            sudo apt auto-remove -y >> ~/docker-script-install.log 2>&1
        fi
        exit 1