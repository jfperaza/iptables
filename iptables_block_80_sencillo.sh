#!/bin/sh

echo "Aplicando reglas de redireccionamiento....."
iptables -t nat -F
echo 1 > /proc/sys/net/ipv4/ip_forward


/sbin/iptables  -t nat -A POSTROUTING -o enp1s0 -s 10.8.0.0/16  -j MASQUERADE

## ALLOW
#/sbin/iptables -A INPUT -s 127.0.0.0/24 -j ACCEPT
#/sbin/iptables -A INPUT -s 10.8.0.0/24 -j ACCEPT
#]/sbin/iptables -A INPUT -s  200.0.0.0/255.0.0.0 -j ACCEPT
#/sbin/iptables -A INPUT -s 187.0.0.0/255.0.0.0 -j ACCEPT

/sbin/iptables -A INPUT -i enp1s0 -s 148.227.227.11/255.255.255.255 -p tcp --dport  80 -j DROP 

