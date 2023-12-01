#!/bin/bash

sudo killall dhcpcd
sudo ip link set br0 down
sudo brctl delbr br0