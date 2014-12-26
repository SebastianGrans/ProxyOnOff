#!/bin/bash

###
# These is the variable to change.
address="http://www.uu.se/proxy.pac"
service="Wi-Fi"

usage="${0} -- Enables or disables automatic proxy configuration in OS X.\n\n
					\tNote: You need to edit this file and input the adress to the\n
					\tauto configuration file."

status=($(networksetup -getautoproxyurl $service))

if [ $# -gt 0 ]; then
	echo -e $usage
fi

# Check if url is set
if [ ${status[1]} != $address ]; then
	echo -e "The address was not set or was wrong.\nSetting address to $address."
	networksetup -setautoproxyurl $service $address 
fi

# Enable or disable
if [ ${status[3]} == "Yes" ]; then
	echo -e "The proxy is on.\nDisabling..."
	networksetup -setautoproxystate $service off
else
	echo -e "The proxy is off.\nEnabling..."
	networksetup -setautoproxystate $service on
fi

