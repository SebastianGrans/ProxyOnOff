ProxyOnOff
==========

Enable or disable automatic proxy configuration in OS X

Installation/Usage
------------------
First, place the `proxy.sh` file somewhere neat. I have created a folder called `~./bin` for all my custom shell scripts. And then added this folder to the path. 

Then you need to edit the file `proxy.sh` to your auto configuration `.pac` file.

	#!/bin/bash

	###
	# These is the variable to change.
	address="http://www.uu.se/proxy.pac"
	service="Wi-Fi"

Then you can simple write 
	
	./proxy.sh
or
	proxy 
to enable or disable the proxy.

Background
----------
Through Uppsala University I have access to a lot of scientific journals provided I am within the university network. If I'm outside the network I must use a proxy to gain access. I found that adding the proxy manually everytime I needed it was to big of a hassle, so I started using the `networksetup` command.

	networksetup -setautoproxyurl Wi-Fi http://someaddress.com/proxy.pac
	networksetup -setautoproxystate Wi-Fi on

But this is still a hassle. So I wrote a command that did this for me.

