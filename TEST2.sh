 #!/bin/bash

    ISACT=$( (sudo systemctl is-active docker ) 2>&1 )

    #### Try to check whether docker is installed and running - don't prompt if it is
    if [[ "$ISACT" != "active" ]]; then
        read -rp "Uninstall Docker and docker Compose(y/n): " RDOCK
    else
        echo ""
        echo ""
        echo ""
    fi

 if [[ "$RDOCK" == [yY] ]]; then
        echo "############################################"
        echo "######         UnInstalling           ######"
        echo "############################################"

    
        sleep 2s
        sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin >> ~/docker-script-install.log 2>&1
        sudo sudo rm -rf /var/lib/docker >> ~/docker-script-install.log 2>&1
        sudo rm -rf /var/lib/containerd >> ~/docker-script-install.log 2>&1
         
        echo ""
        echo "    Done..."
        echo ""
        echo ""
        sleep 3s
    fi
if [[ "$RDOCK" == [nN] ]]; then
        echo ""
        echo "ZOSTAWIONY"
        echo ""
        echo ""
        sleep 3s
    fi