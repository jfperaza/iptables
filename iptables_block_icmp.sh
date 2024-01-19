#!/bin/sh

echo "Aplicando reglas de IPTABLES....."
/sbin/iptables -t nat -F
echo 1 > /proc/sys/net/ipv4/ip_forward



/sbin/iptables -A INPUT  -i enp1s0 -s 148.227.227.61 -p icmp  -j ACCEPT


/sbin/iptables -A INPUT  -i enp1s0 -s 0/0 -p icmp  -j DROP

