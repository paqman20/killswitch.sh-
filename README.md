# killswitch.sh
This a complete rewrite of the documentation
# Click RAW rigth next to edit button

This script is using UFW. The Uncomlicated Firewall. This a firewall such as iptables I have decided to use UFW but this could very well change in the future but for now this is what I have chosen. This script starts a firewall that makes sure your vpn goes down it will take the rest of your internet connections stopping potential leaks before they begin. This is written in the shell scripting laungae bash, as such it is a reqesit. This is made to be used on a linux system so i have not tested any other opertation system before hand it is also meant to use openvpn so keep that n mind

# Install
You are going to want to install this using your package manager
            Sudo apt install ufw
            sudo pacman -S ufw
            sudo emerge -av ufw

# Configuratiom
The only manula work yo have to do is find your network interface wlan0 eth0 etc.
you can do this by running 
            ifconfig or ip addr 
            the look for something along the lines enp0s31fs or wlan0 or anything like that it is not lo or tun
After that just go ahead and add it to the script instead of the thing between the parentheses as seeen here  
                     |   
                     |
                    \ /
devip=$( ip a s #enp0s31f6# | egrep -o 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d' ' -f2 )


After make it eexcutable 
          chmod u+x killswitch.sh
         
# usage 
to start 
            sudo ./killswitch.sh
            
  
  
Anyway enjoy i tried to make the guide as simple as possible.

