#!/bin/sh

# To put in remote desktop
mv server-side-functions.zsh ~/.zshrc

# To install stuff in RHEL
sudo yum -y groupinstall "X Window System" Desktop gnome kde-desktop "Graphics Creation Tools" && sudo yum install gnome-core xfce4 firefox vnc-server vim zsh

# To set password for vncserver
vncserver

# Run server
myVncserver
