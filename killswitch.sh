#! /bin/bash
#reseting the uwf setting from before incase of new server connection. 
#This is also where you will enter your IP of your SERVER not you
#You NEED to do this so your Firewall can deny other connections expet this one 
yes | ufw reset
ipaddr=$(wget https://duckduckgo.com/?q=whats+my+ip -q -O - | grep -Eo '\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>') 
read -p '"u" for udp "t" for tcp protocol : ' protocol 	
#devip =$(ip a s #wlp2s0# | egrep -o 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d' ' -f2)


#Taking out all the traffic so we can start from scracth 
sudo ufw default deny outgoing
sudo ufw default deny incoming

#allow in to our machine 
sudo ufw allow in to $devip 
sudo ufw allow out to $devip

#choosing the protocol UDP or TCP
if  (( "$protocol" = "u" )); 
	then  
		sudo ufw allow out to $ipaddr port 1194 proto udp
fi


if  (( "$protocol" = "t" )); 
	then  
		sudo ufw allow out to $ipaddr port 1194 proto tcp
fi 


sudo ufw allow out on tun0 from any to any
sudo ufw enable


#so you can stop it and make sure it is still running. this allows for a simple shut off switch
read -p 'stop :' stop 

if [ "$stop" == 'y' ] ; then  
	sudo ufw disable

 fi	
 
 echo $sum
