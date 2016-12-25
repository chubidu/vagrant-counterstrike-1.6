#!/usr/bin/env bash
# Install Quakesounds - https://forums.alliedmods.net/showthread.php?p=638940?p=638940
sudo -u csserver -H sh -c "cp /vagrant/cstrike/cstrike/mods/quakesounds/quakesounds.amxx /home/csserver/serverfiles/cstrike/addons/amxmodx/plugins/; chmod +x /home/csserver/serverfiles/cstrike/addons/amxmodx/plugins/quakesounds.amxx"
sudo -u csserver -H sh -c "cp /vagrant/cstrike/mods/quakesounds/quakesounds.txt /home/csserver/serverfiles/cstrike/addons/amxmodx/data/lang/; chmod +x /home/csserver/serverfiles/cstrike/addons/amxmodx/data/lang/quakesounds.txt"
sudo -u csserver -H sh -c "unzip /vagrant/cstrike/mods/quakesounds/sound.zip -d /home/csserver/serverfiles/cstrike/sound/; chmod +x /home/csserver/serverfiles/cstrike/sound/qs/*"

# enable Quakesounds plugin
sudo -u csserver -H sh -c "echo 'quakesounds.amxx' >> /home/csserver/serverfiles/cstrike/addons/amxmodx/configs/plugins.ini"


# Install Bullet Damage - https://forums.alliedmods.net/showthread.php?t=151190
sudo -u csserver -H sh -c "cp /vagrant/cstrike/mods/bullet_damage/bullet_damage.amxx /home/csserver/serverfiles/cstrike/addons/amxmodx/plugins/; chmod +x /home/csserver/serverfiles/cstrike/addons/amxmodx/plugins/bullet_damage.amxx"

# enable Bullet Damage plugin
sudo -u csserver -H sh -c "echo 'bullet_damage.amxx' >> /home/csserver/serverfiles/cstrike/addons/amxmodx/configs/plugins.ini"


# Install C4Timer - https://forums.alliedmods.net/showthread.php?t=483666
sudo -u csserver -H sh -c "cp /vagrant/cstrike/mods/c4timer/c4timer.amxx /home/csserver/serverfiles/cstrike/addons/amxmodx/plugins/; chmod +x /home/csserver/serverfiles/cstrike/addons/amxmodx/plugins/c4timer.amxx"

# enable C4Timer plugin
sudo -u csserver -H sh -c "echo 'c4timer.amxx' >> /home/csserver/serverfiles/cstrike/addons/amxmodx/configs/plugins.ini"
