len=`ping -c 1 moodle.iiit.ac.in`
st=`echo "$len" | wc -l`

if (( $st > 1 )); then
	
	export ALL_PROXY=socks://proxy.iiit.ac.in:8080/
	export ftp_proxy=ftp://proxy.iiit.ac.in:8080/
	export no_proxy=localhost,127.0.0.1,iiit.ac.in,.iiit.ac.in,iiit.net,.iiit.net,172.16.0.0/12,192.168.0.0/16,10.0.0.0/8
	export https_proxy=https://proxy.iiit.ac.in:8080/
	export socks_proxy=socks://proxy.iiit.ac.in:8080/
	export all_proxy=socks://proxy.iiit.ac.in:8080/
	export http_proxy=http://proxy.iiit.ac.in:8080/
else
	unset ALL_PROXY
	unset ftp_proxy
	unset no_proxy
	unset https_proxy
	unset socks_proxy
	unset all_proxy
	unset http_proxy
fi
