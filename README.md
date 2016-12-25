# vagrant-counterstrike-1.6

## Installation
1. change the password of your csserver user (located in `setup-base.sh` on line 26)
2. change the name of your server (located in `cstrike/server.cfg` on line 2)
3. change the rcon password of your server (located in `cstrike/server.cfg` on line 5)
2. ```vagrant up --provision```

## Start your counterstrike 1.6 server
```
1. vagrant up
2. vagrant ssh
3. su csserver
4. cd /home/csserver
5. ./csserver start
```
