# killswitch.sh-
this is kill switch for a vpn all you have to do is connect to your VPN server and get your IP Address then after that plug that is and BOOM you now have a kill switch your VPN goes down and your internet connection goes down with it. 

DOCUMENTATION

SETUP
Please run beforeins.sh just makes sure your file gets moved to /opt directory. Now I would rather have it there then taking up space in my home directory but it is whatever move it whereever you want just go ahead and make sure to change the symbolic link too.

After having run the script make sure you have "ufw" you can install it with 
            sudo apt install ufw
            sudo dnf install ufw
            sudo zypper install ufw 
            sudo pacman -S install ufw 

There is are two things you must do FRIST before you run the script.

#1 You must find the inet addres of your device this is nneded. This is very simeple to add and find all you should need to do is run ip addr | grep inet  it should be the third one down with a brd next to the end. So go ahead and add this to script where the # are infront of the two identical ip addr 

#2 find the ip address of the server you can do this very easily by just typing "What is my ip" and plug that in when it says so. PS. make sure your using udp if not then change udp to tcp.

#3 After connecting and shutting down run "sudo ufw disable" before doing anything else

ALIAS 
#4 Complety optinal but you can go ahead and run "sudo echo "alias killswitch="sudo bash killswitch.sh" >> ~/.bashrc" and  "sudo echo alias="sudo disable uwf"  " >> ~/.bashrc" and "source ~/.bashrc" this is optinal I would not people toching my ~/.bashrc folder so here you go with the symbolic link and this yu should just type killswitch and it will iniciate and dwn will now take the firewall down ready for the next time.

Then you should be good to go if you have any questions feel free to reach out im new and this was pretty hard for me but im sure we could work something out

USING THE SCRIPT

Go ahead and connect to your vpn server of choice after that go ahead and type "What is my ip" then take that number and type that into the script and you should be all set to go as long as you relplaced the old inet links with your own. Anyways thanks everone and have a great time using it peace. 
