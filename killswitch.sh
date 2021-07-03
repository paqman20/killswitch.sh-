#! /bin/bash
#reseting the uwf setting from before incase of new server connection.
#This is also where you will enter your IP of your SERVER not you
#You NEED to do this so your Firewall can deny other connections expet this one
yes | ufw reset
read -p 'ip addr: ' ipaddr
read -p '"u" for udp "t" for tcp protocol : ' protocol

#go ahead and replace with the INET addr you can find this by running ip addr | grep inet

dev_add= ip addr | grep -o -P '(?<=inet).*(?=brd)' | sed -n '1~2p'
echo $dev_add
sudo ufw allow in to 10.0.0.203/24
sudo ufw allow out to 10.0.0.203/24


#Taking out all the traffic so we can start from scracth
sudo ufw default deny incoming

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

 #echo $sum
