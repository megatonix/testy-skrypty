#!/bin/bash

# Aktualizacja systemu
cd ~
press_enter()
{
    echo -en "\nPress Enter to continue"
    read
    clear
}
selection=
until ["$selection" = "0" ]; do
echo "
PROGRAM MENU
1 - Aktualizacja systemu
2 - Usuwanie zbędnych plików
3 - Instalacja repozytoriów Dockera

0 - Wyjście
"
    echo -n "Wybierz opcję: "
    read selection
    echo""
    case $selection in 
        1 ) sudo apt update && sudo apt upgrade && sudo apt dist-upgrade -y ; press_enter ;;
        2 ) echo "apt auto-remove" ; sudo apt auto-remove -y ; press_enter ;;
        3 ) sudo apt install curl ; press_enter ;; 
        0 ) exit ;;
        * ) echo "proszę wybrać numer" ; press_enter
    esac
done