#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y xrdp xfce4

# Configure xrdp to use xfce as your desktop environment
# https://docs.microsoft.com/en-us/azure/virtual-machines/linux/use-remote-desktop
echo xfce4-session >~/.xsession

# You should see xrdp listening on 3389
# http://www.itzgeek.com/how-tos/linux/centos-how-tos/install-xrdp-on-centos-7-rhel-7.html
sudo netstat -antup | grep xrdp

read -n1 -r -p "Press space to continue..." key

# Restart the xrdp service:
sudo service xrdp restart

# Set a password for your user account if currently only using SSH key for
sudo passwd ubuntu
