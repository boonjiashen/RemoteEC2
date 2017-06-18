#!/bin/bash

# If you just do apt-get update/upgrade you'll have some weird grub pop-up
# screen
# https://serverfault.com/questions/662624/how-to-avoid-grub-errors-after-runing-apt-get-upgrade-ubunut
# so instead of apt-get update/upgrade, run:
sudo apt-get -y update && \
sudo rm /boot/grub/menu.lst && \
sudo update-grub-legacy-ec2 -y && \
sudo apt-get upgrade

# Allow password authentication
sudo sed -i.bak 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# Restart the SSH daemon to make this change take effect.
sudo /etc/init.d/ssh restart

export DEBIAN_FRONTEND=noninteractive && \
sudo -E apt-get update && \
sudo -E apt-get install -y ubuntu-desktop

#Install XRDP and other xfce4 resources.
sudo apt-get install xfce4 xrdp && \
sudo apt-get install xfce4 xfce4-goodies

#Make xfce4 the default window manager for RDP connections.
echo xfce4-session > ~/.xsession

#Copy .xsession to the /etc/skel folder so that xfce4 is set as
#the default window manager for any new user accounts that are
#created.
sudo cp /home/ubuntu/.xsession /etc/skel

#Open the xrdp.ini file to allow changing of the host port
#you will connect to.
#Look for the section [xrdp1] and change the following
#text (then save and exit [:wq]).
#TODO make it such that only replace xrdp1 section
sudo sed -i.bak 's/port=-1/port=ask-1/g' /etc/xrdp/xrdp.ini

#Restart xrdp.
sudo service xrdp restart
