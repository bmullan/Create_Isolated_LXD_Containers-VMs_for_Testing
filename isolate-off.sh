#!/bin/bash
#
# isolate-off.sh
#
#====================================================================
# Purpose:
# Cleanup the LXD containers and LXD bridge networks created
# previously by the "isolate-on.sh" script

#====================================================================
# Delete 3 LXD containers created by "isolate-on.sh"
#

lxc delete cn1 --force
lxc delete cn2 --force
lxc delete cn3 --force

#====================================================================
# Delete 3 LXD containers created by "isolate-on.sh"
#

lxc delete vm1 --force
lxc delete vm2 --force
lxc delete vm3 --force

#====================================================================
# Delete the 3 LXD bridges created by "isolate-on.sh"

lxc network delete lxdbr1
lxc network delete lxdbr2
lxc network delete lxdbr3

