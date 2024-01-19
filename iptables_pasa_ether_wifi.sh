#!/bin/sh

echo "Aplicando reglas de redireccionamiento....."
/sbin/iptables -t nat -F
echo 1 > /proc/sys/net/ipv4/ip_forward

IPTABLES="/usr/sbin/iptables"
EXTIF="enp1s0"
INTIF="enp1s0"
INTIF2="wlx9c5322ba763c"

##$EXTIP=""
$IPTABLES -A INPUT -s 10.0.10.0/24 -j ACCEPT
$IPTABLES -A INPUT -s 10.0.11.0/24 -j ACCEPT
#$IPTABLES -A INPUT -s 192.0.0.0/8 -j ACCEPT


$IPTABLES -A FORWARD -i $INTIF -o $INTIF2 -m state --state ESTABLISHED,RELATED  -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF2 -o $INTIF -m state --state ESTABLISHED,RELATED  -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF  -m state --state ESTABLISHED,RELATED  -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF2  -m state --state ESTABLISHED,RELATED  -j ACCEPT

$IPTABLES -A FORWARD -i $INTIF -o $INTIF2 -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF2 -o $INTIF -j ACCEPT

$IPTABLES  -t nat -A POSTROUTING -o $INTIF -s 10.0.10.0/24 -d 0/0 -j MASQUERADE
$IPTABLES  -t nat -A POSTROUTING -o $INTIF2 -s 10.0.11.0/24 -d 0/0  -j MASQUERADE
$IPTABLES  -t nat -A POSTROUTING -o $INTIF -s 10.0.11.0/24 -d 0/0 -j MASQUERADE

#$IPTABLES  -t nat -A POSTROUTING -o $INTIF -s 192.0.0.0/8 -d 0/0 -j MASQUERADE


##$IPTABLES  -t nat -A POSTROUTING -o wlx14ebb6189b6e -s 10.0.10.0/24 -d 0/0  -j MASQUERADE


## ALLOW
#/sbin/iptables -A INPUT -s 127.0.0.0/24 -j ACCEPT
#/sbin/iptables -A INPUT -s 10.8.0.0/24 -j ACCEPT
#/sbin/iptables -A INPUT -s  200.0.0.0/255.0.0.0 -j ACCEPT
#/sbin/iptables -A INPUT -s 187.0.0.0/255.0.0.0 -j ACCEPT
#/sbin/iptables -A INPUT -s 148.227.0.0/16 -j ACCEPT

#/sbin/iptables -A INPUT -i enp1s0 -s 200.0.0.0/255.0.0.0 -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
#/sbin/iptables -A INPUT -i enp1s0 -s 10.8.0.0/24 -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
#/sbin/iptables -A INPUT -i enp1s0 -s 10.8.0.0/24 -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
#/sbin/iptables -A INPUT -i enp1s0 -s 10.8.0.0/24 -p tcp --dport 443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
#/sbin/iptables -A INPUT -i enp1s0 -s 10.8.0.0/24 -p tcp --dport 53 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
#/sbin/iptables -A INPUT -i enp1s0 -s  127.0.0.0/24  -p tcp --dport  80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
#/sbin/iptables -A INPUT -i enp1s0 -s  127.0.0.0/24  -p tcp --dport  443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
#/sbin/iptables -A INPUT -i enp1s0 -s  127.0.0.0/24  -p tcp --dport  53 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

#/sbin/iptables -A INPUT -i enp1s0 -s 187.0.0.0/255.0.0.0 -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
#/sbin/iptables -A INPUT -i enp1s0 -s 148.227.0.0/16 -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
#/sbin/iptables -A INPUT -i enp1s0 -s  127.0.0.0/24  -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT


################ bloqueo de red_UAS
#/sbin/iptables  -A PREROUTING  -s 192.168.2.200 -d 0/0 -j DROP

#/sbin/iptables -A INPUT -s 192.168.2.200 -d 0/0 -j DROP
#/sbin/iptables -A INPUT -s 192.168.2.201 -d 0/0 -j DROP
#/sbin/iptables -A INPUT -s  58.218.0.0/16 -d 0/0 -j DROP
#/sbin/iptables -A INPUT -s 218.87.0.0/16 -d 0/0 -j DROP


#/sbin/iptables -A INPUT -i enp1s0 -s 0/0 -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j DROP
#########################################################/sbin/iptables -A INPUT -s 0/0  -j DROP

#/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 9000 -j REDIRECT --to-port 1723
#/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 9000



##/sbin/iptables -t nat -A POSTROUTING -o eth0 -s 0/0 -d 157.240.0.0/16 -j DROP
