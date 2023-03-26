#!/bin/bash


#########################################################
#                                                       #
# This custom script is for ubutnu 22 lts configurating #
#                                                       #
#########################################################
#                                                       #
# For run intalation:                                   #
#                                                       #
# - File must be with "x" permission. To give him right #
# for run type "chmod +x ./post_install.sh"             #
#                                                       #
# - To run this scritp just type                        #
# "sudo ./post_install.sh"                              #
#                                                       #
#-------------------------------------------------------#
#                                                       #
# For configure instalation:                            #
#                                                       #
# - To configure this installer you can just comment or #
# delet blocks named "Isntall".                         # 
#                                                       #
# - Same actions you can do with blocks named           #
# "Settings"                                            #
#                                                       #
#########################################################

# Functions

error_exit()
{
    echo "Error: $1"
    exit 1
}

snap_install()
{
	clear
	sudo snap install "$1" || error_exit "$1 setup"
}

apt_install()
{	
	clear
	sudo apt install "$1" || error_exit "$1 setup"
}

# /Functions

set -e

#Run on sudo check
if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
fi
#/Run on sudo check

#Update and Upgrade
echo "Updating and Upgrading"
apt-get update && sudo apt-get upgrade -y

#---------#
# Install #
#---------#

#Install curl
snap_install "curl"
#/Install curl


#Install git
apt_install "git"
#/Install git

#Install vscode
#snap_install "vscode"
#/Install vscode

#Install telegram-desktop
snap_install "telegram-desktop"
#/Install telegram-desktop

#Install google chrome

if (google-chrome --version) then
	echo "chrome already installed"
else
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb || error_exit "chome download"
	sudo dpkg -i --force-depends google-chrome-stable_current_amd64.deb || error_exit "chrome set depends"
	rm google-chrome-stable_current_amd64.deb
fi
#Install 

clear
echo "Install completed!"

#----------#
# /Install #
#----------#


#----------#
# Settings #
#----------#



clear
echo "Settings completed!"

#-----------#
# /Settings #
#-----------#



set +e

