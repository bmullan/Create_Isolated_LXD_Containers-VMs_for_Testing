#!/bin/bash  

# Create and Network Isolate 3 LXD Containers from each other but not
# the LXD Host or Internet

  
#====================================================================
# Purpose:  
# to create 3 LXD containers on 1 host that are isolated from each 
# other but NOT from the Host or the Internet. This allows testing of
# VPN (as an example) as a means to interconnect the isolated 
# containers to simulate servers in a multi-cloud, multi-server
# environment
  
#====================================================================
# Create 3 LXD bridges
  
lxc network create lxdbr1  
lxc network create lxdbr2  
lxc network create lxdbr3  
    
#====================================================================
# Create ACL firewall rules required to isolate C1 and C2 from direct 
# communication with each other.  
  
sudo iptables -A FORWARD -i lxdbr1 -o lxdbr2 -j REJECT
sudo iptables -A FORWARD -i lxdbr1 -o lxdbr3 -j REJECT
sudo iptables -A FORWARD -i lxdbr2 -o lxdbr1 -j REJECT
sudo iptables -A FORWARD -i lxdbr2 -o lxdbr3 -j REJECT
sudo iptables -A FORWARD -i lxdbr3 -o lxdbr1 -j REJECT
sudo iptables -A FORWARD -i lxdbr3 -o lxdbr2 -j REJECT
  
#====================================================================
# Create 2 LXD containers using Ubuntu 22.04LTS
#
# Assign C1 to use the LXDBR1 bridge
# Assign C2 to use the LXDBR2 bridge
# Assign C3 to use the LXDBR3 bridge
  
lxc launch images:ubuntu/24.02 c1 -n lxdbr1
lxc launch images:ubuntu/24.02 c2 -n lxdbr2
lxc launch images:ubuntu/24.02 c3 -n lxdbr3

