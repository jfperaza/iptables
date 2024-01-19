#!/bin/sh

echo "asignando gateways....."

ip="/usr/bin/ip"
LAN1_IP="10.0.10.254"
LAN1_NET="10.0.10.0/24"
Provider1_NET="148.227.227.0/24"
IF1="enp1s0"
IP1="148.227.227.62"
Provider1="148.227.227.1"
Tabla1="fibra"

LAN2_IP="10.0.11.254"
LAN2_NET="10.0.11.0/24"
Provider2_NET="192.168.50.0/24"
IF2="wlx9c5322ba763c"
IP2="192.168.50.64"
Provider2="192.168.50.254"
Tabla2="wifi"


#LAN3_IP="192.10.10.254"
#LAN3_NET="192.0.0.0/8"


echo " LAN 1 "
$ip route add $LAN1_NET dev $IF1 src $LAN1_IP  table $Tabla1
$ip route add $Provider1_NET dev $IF1 src $IP1 table $Tabla1
$ip route add default via $Provider1 table $Tabla1

echo " lAN 2 "
$ip route add $LAN2_NET dev $IF1 src $LAN2_IP  table $Tabla2
$ip route add $Provider2_NET dev $IF2 src $IP2 table $Tabla2
$ip route add default via $Provider2 table $Tabla2

#echo " Lan 3 "
#$ip route add $LAN3_NET dev $IF1 src $LAN3_IP table $Tabla1
#$ip route add $Provider1_NET dev $IF1 src $IP1 table $Tabla1
#$ip route add default via $Provider1 table $Tabla1


echo " proveedores "
$ip route add $Provider1_NET dev $IF1 src $IP1
$ip route add $Provider2_NET dev $IF2 src $IP2

### Rules
echo "rules ... "

$ip rule add from $Provider1_NET table $Tabla1
$ip rule add from $LAN1_NET table $Tabla1
$ip rule add from $IP1 table $Tabla1

$ip rule add from $Provider2_NET table $Tabla2
$ip rule add from $LAN2_NET table $Tabla2
$ip rule add from $IP2 table $Tabla2


#$ip rule add from $Provider1_NET table $Tabla1
#$ip rule add from $LAN3_NET table $Tabla1

