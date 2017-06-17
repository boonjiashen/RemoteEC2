#!/bin/sh

# To install stuff in RHEL
sudo yum -y groupinstall "X Window System" Desktop gnome kde-desktop "Graphics Creation Tools" && sudo yum install gnome-core xfce4 firefox vnc-server vim zsh

# To set password for vncserver
vncserver

# Run server
./myVncserver.sh

# Run gnome on vnc connection
echo "exec gnome-session &" >> $HOME/.vnc/xstartup

# Set VNC connection settings
sudo bash -c "cat >> /etc/sysconfig/vncservers" << EOL
VNCSERVERS="1:ec2-user"
VNCSERVERARGS[1]="-geometry 1024x768"
EOL
