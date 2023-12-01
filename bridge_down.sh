#!/bin/bash

killall dhcpcd
ip link set br0 down
brctl delbr br0