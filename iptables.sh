#!/bin/bash
iptables -I INPUT -p tcp -m tcp --dport 8051 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 8052 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 8053 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 8056 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 8058 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 5432 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 5433 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 8061 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 9090 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 6789 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 6800:7300 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 3260 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 3333 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 3334 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 2049 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 4379 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 139 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 445 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 111 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 11995 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 11996 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 11997 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 11998 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 11999 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 7480 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 8060 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp --dport 22 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m multiport --dport 2379,2380,9200,9300 -j DROP && service iptables save
iptables -I INPUT -p tcp -m iprange --src-range 172.16.0.124-172.16.0.132 -m multiport --dports 2379,2380,9200,9300 -j ACCEPT && service iptables save
iptables -I INPUT -p tcp -m tcp -s 127.0.0.1 -m multiport --dports 2379,2380,9200,9300 -j ACCEPT && service iptables save
iptables -L -n
service iptables save
