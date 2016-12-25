#!/bin/bash

# Step 1.1 - fix locales
locale-gen en_US.UTF-8 de_DE.UTF-8
dpkg-reconfigure locales

# Step 1.2 update apt-get
apt-get update -y

# Step 1.3 - install some utils
apt-get install -y htop unzip

# PRE-REQUISITES for Counter-Strike 1.6 Server
# Step 2.1  - add i386 architecture
dpkg --add-architecture i386

# Step 2.2 update apt-get
apt-get update -y

# Step 2.3 - install some required packages
apt-get install -y lib32gcc1 curl wget file bsdmainutils python bzip2 tmux libstdc++6:i386

# INSTALL Counter-Strike 1.6 Server
# Step 3.1 - setting up new user
useradd -m csserver
echo "csserver:password" | chpasswd
adduser csserver sudo

# Step 3.2 - download csserver from gameservermanager.com
sudo -u csserver -H sh -c "cd /home/csserver/; wget https://raw.githubusercontent.com/dgibbs64/linuxgameservers/master/CounterStrike/csserver; chmod +x csserver"

# Step 3.3 - install csserver
sudo -u csserver -H sh -c "cd /home/csserver/; ./csserver auto-install"

# SERVER CONFIGURATION
# Step 4.1 - copy server.cfg into serverfiles/cstrike dir
cp /vagrant/cstrike/server.cfg /home/csserver/serverfiles/cstrike/
sudo -u csserver -H sh -c "chown csserver: /home/csserver/serverfiles/cstrike/server.cfg"
sudo -u csserver -H sh -c "chmod +x /home/csserver/serverfiles/cstrike/server.cfg"

# SETUP MODS
# Step 5.1 - install metamod and amx mod x
sudo -u csserver -H sh -c "sh /vagrant/setup-mods.sh"

# Step 5.2 - install amx mod x plugins
sudo -u csserver -H sh -c "sh /vagrant/setup-mods-amx-plugins.sh"

# Change ip on every reboot
# Step 6.1 - copy to csserver home
cp /vagrant/boot-changeip.sh /home/csserver/

# Step 6.2 - add to /etc/rc.local
sed -i -e '$i \/bin/bash /home/csserver/boot-changeip.sh\n' /etc/rc.local
