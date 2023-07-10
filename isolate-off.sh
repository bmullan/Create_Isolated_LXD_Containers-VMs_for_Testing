
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
  
lxc delete c1 --force  
lxc delete c2 --force   
lxc delete c3 --force  

#====================================================================  
# Delete the 3 LXD bridges created by "isolate-on.sh"  

lxc network delete lxdbr1
lxc network delete lxdbr2
lxc network delete lxdbr3

