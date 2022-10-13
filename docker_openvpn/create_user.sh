#!/bin/bash
read -p "Please input client username : " NAME
OVPN_DATA=/data/openvpn
OVPN_SOURCE=/etc/openvpn
# create client id key; 'mskc' is client name
docker run -v $OVPN_DATA:$OVPN_SOURCE --rm -it kylemanna/openvpn easyrsa build-client-full $NAME nopass
# export config
mkdir -p "$OVPN_DATA"/conf
docker run -v $OVPN_DATA:$OVPN_SOURCE --rm kylemanna/openvpn ovpn_getclient $NAME > "$OVPN_DATA"/conf/"$NAME".ovpn
# restart vpn
docker restart vpn