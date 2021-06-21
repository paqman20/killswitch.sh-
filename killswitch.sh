#! /bin/bash
#reset the uwf setting from before incase of new server connect 
yes | ufw reset
read -p 'ip addr: ' ipaddr
#go ahead and replace with the INET addr you can find this by running ip addr | grep inet 
sudo ufw allow in to #192.168.1.213/24
sudo ufw allow out to #192.168.1.213/24
#Setting the seetings 
sudo ufw default deny outgoing
sudo ufw default deny incoming
sudo ufw allow out to $ipaddr port 1194 proto udp
sudo ufw allow out on tun0 from any to any
sudo ufw enable
