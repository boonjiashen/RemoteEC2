#!/bin/bash

# Enable EPEL packages
# http://fedoraproject.org/wiki/EPEL/FAQ#How_can_I_install_the_packages_from_the_EPEL_software_repository.3F
sudo rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm

# xrdp lets us remotely connect to the desktop environment
# http://www.itzgeek.com/how-tos/linux/centos-how-tos/install-xrdp-on-centos-7-rhel-7.html
sudo yum -y groupinstall "X Window System" "KDE Desktop"
sudo yum -y install xrdp

# Not sure how this is different from "X Window System"
# Xfce is the desktop environment
# https://unix.stackexchange.com/questions/181503/how-to-install-desktop-environments-on-centos-7
sudo yum -y groupinstall X11
sudo yum --enablerepo=epel -y groups install "Xfce"

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
sudo passwd ec2-user
