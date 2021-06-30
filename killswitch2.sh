#! /bin/bash
#reseting the uwf setting from before incase of new server connection. 
#This is also where you will enter your IP of your SERVER not you
#You NEED to do this so your Firewall can deny other connections expet this one 
yes | ufw reset
read -p 'ip addr: ' ipaddr


#go ahead and replace with the INET addr you can find this by running ip addr | grep inet   . 
#We need this to go ahead and make sure you can connect to the internet 

sudo ufw allow in to 10.0.0.203/24
sudo ufw allow out to 10.0.0.203/24


#Setting the outgoing and incoming configuratiosn to allow the vpn connection to be the only connection allowed. So if your connection to VPN 
#goes down so does your internet.
sudo ufw default deny outgoing
sudo ufw default deny incoming
sudo ufw allow out to $ipaddr port 1194 proto udp
sudo ufw allow out on tun0 from any to any
sudo ufw enable


#so you can stop it and make sure it is still running. this allows for a simple shut off switch
read -p 'stop :' stop 

if [ $stop = "y" ] ; then  
	sudo ufw disable

 fi	
