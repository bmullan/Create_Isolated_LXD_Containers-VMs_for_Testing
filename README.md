# H3 Create_Isolated_LXD_Containers_for_Testing  

Scripts to Create &amp; Cleanup 3 Network (lxdbr1, lxdbr2, lxdbr3) Isolated LXD containers (C1, C2, C3) 

*Here are 2 simple Bash scripts.*

> **isolate-on.sh**  
> **isolate-off.sh**

# H4 isolate-on
  
***Purpose:***   
* Create 3 new LXD Bridges (lxdbr1, lxdbr2, lxdbr3)
* Create 3 new LXD Containers and attached each one to its corresponding LXD Bridgge

***Assignments are***  

| LXD Container   | Bridge |
| :-------------- | ------:|
| C1              | lxdbr1 |
| C2              | lxdbr2 |
| C3              | lxdbr3 |

After executing isolate-on.sh each of those 3 LXD Containers will be network isolated from each other  
but not from their Host or the Internet  
  
# H4 isolate-off  
  
***Purpose:*** 
* Delete the 3 isolated LXD lxd Containers (C1, C2, C3)  
* Delete the LXD Network Bridges (lxdbr1, lxdbr2, lxdbr3)  
  
After executing isolate-off will clean up the containers (C1, C2, C3) and remove LXD Bridges (lxdbr1, lxdbr2, lxdbr3


