#!/bin/bash

#Automate retrieving of System’s Information.

echo
echo 'Welcome to Info Extractor!'
echo

#~ 1. Public IP Address

IP_Public_ADD=$(curl -s ipinfo.io/ip)
echo "1. Your Public IP is $IP_Public_ADD"

#~ 2. Internal IP address of the machine
echo
IP_ADD=$(ifconfig | grep broadcast | awk '{print $2}')
echo "2. Your Internal IP is $IP_ADD."

#~ 3. The MAC address of the machine(censor the 1st section)
echo

MAC_ADD=$(ip a | grep link/ether | awk '{print $2}' | awk -F: '{print "XX:XX:XX:" $4 ":" $5 ":" $6}')

echo "3. Your MAC address is $MAC_ADD."

#~ 4. Display the top 5 processes’ CPU usage(percentage)
echo

Top_5=$(ps -eo comm,%cpu --sort=-%cpu | head -n 6)

echo "4. Your top 5 processes' CPU usage are: "
echo
echo "$Top_5"

#~ 5. Display the Memory Usage, Free and Used
echo
Mem=$(free -h | head -n 2)
echo "5. Your Memory Usage, Free and Used:"
echo
echo "$Mem"

#~ 6. Display your Active system services and status
echo
Active=$(systemctl --type=service --state=running)
echo "6. These are your Active system services and status:"
echo
echo "$Active"


#~ 7. Display the top 10 files(size) from the `/home` directory
echo
echo "7. Please provide your password to view the top 10 files from the '/home' directory:"
Display=$(sudo du -a /home | sort -n -r | head -n 10)
echo
echo "$Display"

