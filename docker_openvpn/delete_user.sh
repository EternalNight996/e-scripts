#!/bin/bash
read -p "Please input delete username: " NAME
OVPN_DATA=/data/openvpn
OVPN_SOURCE=/etc/openvpn
docker run -v $OVPN_DATA:$OVPN_SOURCE --rm kylemanna/openvpn ovpn_getclient easyrsa revoke $NAME
docker run -v $OVPN_DATA:$OVPN_SOURCE --rm kylemanna/openvpn ovpn_getclient easyrsa gen-crl
docker run -v $OVPN_DATA:$OVPN_SOURCE --rm kylemanna/openvpn ovpn_getclient rm -f "$OVPN_SOURCE"/pki/reqs/"$NAME".req
docker run -v $OVPN_DATA:$OVPN_SOURCE --rm kylemanna/openvpn ovpn_getclient rm -f "$OVPN_SOURCE"/pki/private/"$NAME".key
docker run -v $OVPN_DATA:$OVPN_SOURCE --rm kylemanna/openvpn ovpn_getclient rm -f "$OVPN_SOURCE"/pki/issued/"$NAME".crt
# restart vpn server
docker restart vpn