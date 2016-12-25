#!/usr/bin/env bash
# Step 1.1 - download installation file
sudo -u csserver -H sh -c "cd /home/csserver/; wget http://www.amxmodx.org/release/metamod-1.21.1-am.zip"

# Step 1.2 - unzip
sudo -u csserver -H sh -c "unzip /home/csserver/metamod-1.21.1-am.zip -d /home/csserver/serverfiles/cstrike/"

# Step 1.3 - create plugins.ini file
sudo -u csserver -H sh -c "cd /home/csserver/serverfiles/cstrike/addons/metamod/; touch plugins.ini"

# Step 1.4 - navigate to cstrike folder and edit 'liblist.gam'
# remove following lines
#   gamedll "dlls\mp.dll"
#   gamedll_linux "dlls/cs.so"
#   gamedll_osx "dlls/cs.dylib"
sudo -u csserver -H sh -c "sed -i.bak '/gamedll/d' /home/csserver/serverfiles/cstrike/liblist.gam"
sudo -u csserver -H sh -c "echo 'gamedll_linux \"addons/metamod/dlls/metamod.so\"' >> /home/csserver/serverfiles/cstrike/liblist.gam"

# Step 2.1 - download AMX Mod X Base & download AMX Mod X Counter-Strike Addon
sudo -u csserver -H sh -c "cd /home/csserver/; wget http://www.amxmodx.org/release/amxmodx-1.8.2-base-linux.tar.gz; wget http://www.amxmodx.org/release/amxmodx-1.8.2-cstrike-linux.tar.gz"

# Step 2.2 - extract both to addons dir
sudo -u csserver -H sh -c "tar xzvf /home/csserver/amxmodx-1.8.2-base-linux.tar.gz -C /home/csserver/serverfiles/cstrike/; tar xzvf /home/csserver/amxmodx-1.8.2-cstrike-linux.tar.gz -C /home/csserver/serverfiles/cstrike/"

# Step 2.3 - edit plugins.ini file and insert:
#   linux addons/amxmodx/dlls/amxmodx_mm_i386.so
sudo -u csserver -H sh -c "echo 'linux addons/amxmodx/dlls/amxmodx_mm_i386.so' >> /home/csserver/serverfiles/cstrike/addons/metamod/plugins.ini"
