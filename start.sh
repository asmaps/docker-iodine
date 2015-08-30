#!/bin/sh

set -e

TUNNEL_IP=${IODINE_TUNNEL_IP:-"10.10.10.1"}

sysctl -w net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -s 10.10.10.0/24 -o eth0 -j MASQUERADE

iptables -S
iptables -S -t nat

iodined -c -f $TUNNEL_IP $IODINE_HOST -P $IODINE_PASSWORD -n $EXTERNAL_IP
