#!/bin/bash  

# Create and Network Isolate 3 LXD Containers from each other but not
# the LXD Host or Internet


#====================================================================
# Purpose:
#
# Create 3 LXD containers & 3 LXD VMs on 1 host that are isolated
# from each other but NOT from the Host or the Internet. This allows
# testing of VPN (as an example) as a means to interconnect the
# isolated containers to simulate servers in a multi-cloud,
# multi-server environment.
#
# General explanation...  when this script completes LXD Container
# CN1 will be able to communicated with the Host/Internet and only
# VM1,  CN2 with Host/Internet and only VM2, CN3 with Host/Internet
# and VM3.
#====================================================================


#====================================================================
# Create 3 LXD bridges.  LXD Containers and LXD VMs created and 
# attached to these LXD Bridges will be on different 10.x.x.x subnets
# from each other depending on which LXDBRx bridge they are attached
# to at creation.

lxc network create lxdbr1
lxc network create lxdbr2
lxc network create lxdbr3

#====================================================================
# Create ACL firewall rules required to isolate cn1, cn2 and cn3 from
# direct communication with each other as well as vm1, vm2 and vm3
# isolated from each other

sudo iptables -A FORWARD -i lxdbr1 -o lxdbr2 -j REJECT
sudo iptables -A FORWARD -i lxdbr1 -o lxdbr3 -j REJECT
sudo iptables -A FORWARD -i lxdbr2 -o lxdbr1 -j REJECT
sudo iptables -A FORWARD -i lxdbr2 -o lxdbr3 -j REJECT
sudo iptables -A FORWARD -i lxdbr3 -o lxdbr1 -j REJECT
sudo iptables -A FORWARD -i lxdbr3 -o lxdbr2 -j REJECT

#====================================================================
# Create 3 LXD containers using Ubuntu 22.04LTS
#
# Assign cn1 to use the LXDBR1 bridge
# Assign cn2 to use the LXDBR2 bridge
# Assign cn3 to use the LXDBR3 bridge

lxc launch ubuntu:22.04 cn1 -n lxdbr1
lxc launch ubuntu:22.04 cn2 -n lxdbr2
lxc launch ubuntu:22.04 cn3 -n lxdbr3


#====================================================================
# Create 3 LXD VMs (vm1, vm2, vm3) using Ubuntu 22.04LTS
#
# Assign vm1 to use the LXDBR1 bridge
# Assign vm2 to use the LXDBR2 bridge
# Assign vm3 to use the LXDBR3 bridge

lxc launch ubuntu:22.04 vm1 --vm -n lxdbr1
lxc launch ubuntu:22.04 vm2 --vm -n lxdbr2
lxc launch ubuntu:22.04 vm3 --vm -n lxdbr3

echo
echo
echo "Listing of new LXD Containers, VMs and their LXD Bridges..."
echo
echo "Note:"
echo "The VMs may take a few seconds to get their IPv4 address listed."
echo "Notice CN1 and VM1 etc...  are on the same 10.x.x.x subnet."
echo
echo

lxc ls

echo
echo
echo

