#!/usr/bin/env bash
sed -i -r 's/^ip=.*/ip="'$(ifconfig | grep -A 1 eth1 | grep inet | awk '{print $2}' | cut -c 6-)'"/' /home/csserver/csserver
