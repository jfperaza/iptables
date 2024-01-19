#!/bin/sh

echo " limpia iptables...."
/sbin/iptables -t nat -F
echo 1 > /proc/sys/net/ipv4/ip_forward


/sbin/iptables -F # flush all chains
/sbin/iptables -t nat -F
/sbin/iptables -t mangle -F
/sbin/iptables -X # delete all chains
/sbin/iptables -t filter -F
