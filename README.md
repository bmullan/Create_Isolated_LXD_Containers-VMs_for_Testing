# Create Network Isolated LXD Containers/VMs for Testing purposes  

Two Bash Scripts to *Create* (***isolate-on.sh***) &amp; and to *Cleanup* (***isolate-off.sh)***
three separated LXD Network bridges (lxdbr1, lxdbr2, lxdbr3) and the attached but 
Network Isolated (from each other) LXD containers (cn1, cn2, cn3) and LXD VMs (vm1, vm2, vm3).

Why?  
There are probably alot of examples but one might be that you may want to test something 
like a VPN between servers on multiple Clouds but don't want to pay for multiple Cloud Server 
Instances.   You could use these scripts to simulate isolated Cloud servers.
  
*Here are 2 simple Bash scripts.*  
  
> **isolate-on.sh**  
> **isolate-off.sh**

---

### isolate-on.sh
  
***Purpose:***   
* Create 3 new LXD Bridges (lxdbr1, lxdbr2, lxdbr3)
* Create 3 new LXD Containers and 3  LXD VMs, each attached to a corresponding LXD Bridge

***Assignments are***  

| LXD Container/VM | Bridge |
| :--------------- | ------:|
| cn1              | lxdbr1 |
| cn2              | lxdbr2 |
| cn3              | lxdbr3 |
| vm1              | lxdbr1 |
| vm2              | lxdbr2 |
| vm3              | lxdbr3 |

After executing ***isolate-on.sh*** each of those 3 LXD Containers/VM will be network isolated from each other  
but not from their Host, the Internet or their "counterpart".

Example:   
CN1 and VM1 will get IPv4 addresses on the same subnet so they can communicate with the internet/Host
and each other.   The same happens for CN2/VM2 and CN3/VM3.

---
  
### isolate-off.sh  
  
***Purpose:*** 
* Delete the 3 isolated LXD lxd Containers (cn1, cn2, cn3 and vm1, vm2, vm3)
* Delete the LXD Network Bridges (lxdbr1, lxdbr2, lxdbr3)  
  
After executing ***isolate-off.sh*** LXD will clean/remove the LXD Containers (cn1, cn2, cn3), the LXD VMs
(vm1, vm2, vm3) and remove the LXD Network Bridges (lxdbr1, lxdbr2, lxdbr3)  



