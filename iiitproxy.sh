#!/bin/bash/

# If it's connected to a IIIT network, moodle should work regardless of any setting. 
# Even on VPN connectivity, there is no loss in functionality by setting up the proxies
len=`ping -c 1 moodle.iiit.ac.in`
st=`echo "$len" | wc -l`

if (( $st > 1 )); then
	# I'm not sure if it's supposed to be socks, I'm reasonably
	# certain there was some bug here
	export ALL_PROXY=socks://proxy.iiit.ac.in:8080/ 
	export all_proxy=socks://proxy.iiit.ac.in:8080/ 

	export FTP_PROXY=ftp://proxy.iiit.ac.in:8080/
	export ftp_proxy=ftp://proxy.iiit.ac.in:8080/

	export SOCKS_PROXY=socks://proxy.iiit.ac.in:8080/
	export socks_proxy=socks://proxy.iiit.ac.in:8080/

	export HTTP_PROXY=http://proxy.iiit.ac.in:8080/
	export http_proxy=http://proxy.iiit.ac.in:8080/

	export HTTPS_PROXY=https://proxy.iiit.ac.in:8080/
	export https_proxy=https://proxy.iiit.ac.in:8080/

	# setting exception list
	export no_proxy=localhost,127.0.0.1,iiit.ac.in,.iiit.ac.in,iiit.net,.iiit.net,172.16.0.0/12,192.168.0.0/16,10.0.0.0/8
	export NO_PROXY=localhost,127.0.0.1,iiit.ac.in,.iiit.ac.in,iiit.net,.iiit.net,172.16.0.0/12,192.168.0.0/16,10.0.0.0/8

	# Setting up the apt.conf file for apt access.
	echo 'Acquire::http::proxy "http://proxy.iiit.ac.in:8080/";' > /etc/apt/apt.conf
	echo 'Acquire::http::proxy "https://proxy.iiit.ac.in:8080/";' >> /etc/apt/apt.conf
	echo 'Acquire::ftp::proxy "ftp://proxy.iiit.ac.in:8080/";' >> /etc/apt/apt.conf
	echo 'Acquire::socks::proxy "socks://proxy.iiit.ac.in:8080/";' >> /etc/apt/apt.conf

else
	unset ALL_PROXY
	unset all_proxy

	unset FTP_PROXY
	unset ftp_proxy
	
	unset SOCKS_PROXY
	unset socks_proxy

	unset HTTP_PROXY
	unset http_proxy
	
	unset HTTPS_PROXY
	unset https_proxy
	
	unset no_proxy
	unset NO_PROXY

	# Unsetting the apt conf file
	echo "" > /etc/apt/apt.conf

fi
