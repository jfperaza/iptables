#!/bin/sh

echo "creando interfaces....."

/usr/sbin/ifconfig enp1s0:2 10.0.10.254/24
/usr/sbin/ifconfig enp1s0:3 10.0.11.254/24

#/usr/sbin/ifconfig enp1s0:1 192.10.10.254/8
