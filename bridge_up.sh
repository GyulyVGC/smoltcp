#!/bin/bash

ETH=ens19

modprobe bridge
modprobe br_netfilter

sysctl -w net.bridge.bridge-nf-call-arptables=0
sysctl -w net.bridge.bridge-nf-call-ip6tables=0
sysctl -w net.bridge.bridge-nf-call-iptables=0

ip tuntap add name tap0 mode tap user $USER
brctl addbr br0
brctl addif br0 tap0
brctl addif br0 $ETH
ip link set tap0 up
ip link set $ETH up
ip link set br0 up

dhcpcd br0