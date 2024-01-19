#!/bin/sh

echo "Aplicando reglas de redireccionamiento....."
iptables -t nat -F
echo 1 > /proc/sys/net/ipv4/ip_forward


/sbin/iptables  -t nat -A POSTROUTING -o enp1s0 -s 192.0.0.0/8  -j MASQUERADE
#iptables -t nat -A POSTROUTING -o eth0 -s 172.16.10.0/16 -j MASQUERADE

#iptables -t nat -A PREROUTING -p tcp -s 172.16.16.0/16 --dport 80 -j REDIRECT --to-port 3128

#iptables -t nat -A POSTROUTING -o eth0 -s 172.16.16.0/16 -j MASQUERADE

## ALLOW
/sbin/iptables -A INPUT -s 127.0.0.0/24 -j ACCEPT
/sbin/iptables -A INPUT -s 192.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 148.227.0.0/16 -j ACCEPT

/sbin/iptables -A INPUT -i enp1s0 -s 192.0.0.0/8 -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
/sbin/iptables -A INPUT -i enp1s0 -s 192.0.0.0/8 -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
/sbin/iptables -A INPUT -i enp1s0 -s 192.0.0.0/8 -p tcp --dport 443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
/sbin/iptables -A INPUT -i enp1s0 -s 192.0.0.0/8 -p tcp --dport 53 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
/sbin/iptables -A INPUT -i enp1s0 -s  127.0.0.0/24  -p tcp --dport  80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
/sbin/iptables -A INPUT -i enp1s0 -s  127.0.0.0/24  -p tcp --dport  443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
/sbin/iptables -A INPUT -i enp1s0 -s  127.0.0.0/24  -p tcp --dport  53 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

/sbin/iptables -A INPUT -i enp1s0 -s 187.0.0.0/255.0.0.0 -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
/sbin/iptables -A INPUT -i enp1s0 -s 148.227.0.0/16 -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
/sbin/iptables -A INPUT -i enp1s0 -s  127.0.0.0/24  -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT


################ bloqueo de red_UAS
#/sbin/iptables  -A PREROUTING  -s 192.168.2.200 -d 0/0 -j DROP

#/sbin/iptables -A INPUT -s 192.168.2.200 -d 0/0 -j DROP
#/sbin/iptables -A INPUT -s 192.168.2.201 -d 0/0 -j DROP
#/sbin/iptables -A INPUT -s  58.218.0.0/16 -d 0/0 -j DROP
#/sbin/iptables -A INPUT -s 218.87.0.0/16 -d 0/0 -j DROP


#######################/sbin/iptables -A INPUT -i enp1s0 -s 0/0 -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j DROP
#########################################################/sbin/iptables -A INPUT -s 0/0  -j DROP

#/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 9000 -j REDIRECT --to-port 1723
#/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 9000
