#!/bin/bash
# Author: Eternal

# cehck docker installed
echo "Checking docker is installed?"
docker -v
if [ $? -eq  0 ]; then
    echo "Found docker!"
else
    echo "Not Found docker!"
    echo "trying build environment of docker..."
    curl -sSL https://get.daocloud.io/docker | sh
    docker -v
    if [ $? -eq  0 ]; then
        # restart docker service
        systemctl enable docker.service
        systemctl restart docker.service
        echo "Finished!"
    else
        echo "Couldn't build enviroment of docker, maybe you need to manual build of docker!"
        exit 1
    fi
fi
if [ `uname -m` != 'x86_64' ]; then
    echo "** Build a Docker Image from the kylemanna/openvpn repository **"
    git clone https://github.com/kylemanna/docker-openvpn.git && cd docker-openvpn
    DOCKERFILE_CUSTOM=Dockerfile.`uname -m`
    if [ `uname -m` != 'aarch64' ]; then
        cp Dockerfile.aarch64 $DOCKERFILE_CUSTOM
    fi
    # Upgrade Alpine Image for OpenVPN
    IMAGE_LINE=`cat -n $DOCKERFILE_CUSTOM | grep FROM |  awk '{print $1}'`	 # search line with the old Image
    sed -i ${IMAGE_LINE}d $DOCKERFILE_CUSTOM				                            # delete this old Image
    sed -i "${IMAGE_LINE}a\FROM alpine:3.8.4" $DOCKERFILE_CUSTOM            # append new Image
    docker build --no-cache -t kylemanna/openvpn -f $DOCKERFILE_CUSTOM .
    cd .. && rm -f -r docker-openvpn
else
    echo "** Pull the Docker Image from kylemanna/openvpn repository **"
    docker pull kylemanna/openvpn
fi

sleep 1

OVPN_DATA=/data/openvpn
OVPN_SOURCE=/etc/openvpn

rm -rf "$OVPN_DATA"/*
mkdir -p "$OVPN_DATA"/conf

read -p "Please input server ip : " IP
read -p "Please input server port(1194) : " PORT
read -p "Please choose your Protocol (tcp / [udp]):   " PROTOCOL

if [ "$PROTOCOL" != "tcp" ]; then
    PROTOCOL="udp"   # set the default Protocol
else
    PROTOCOL="tcp"   # change Protocol to tcp
fi

if [ "$PORT" == "" ]; then
    PORT="1194" 
fi

read -p "Please enter the Admin Password (default [odaiwdjao132]): " PASSWORD
if [ "$PASSWORD" == "" ]; then
    PASSWORD="odaiwdjao132"
fi

docker run -v $OVPN_DATA:$OVPN_SOURCE --rm kylemanna/openvpn ovpn_genconfig -u $PROTOCOL://$IP:$PORT
docker run -v $OVPN_DATA:$OVPN_SOURCE --rm -it kylemanna/openvpn ovpn_initpki

read -p "Please Provide Your Client Name(mskc): " CLIENTNAME
if [ "$CLIENTNAME" == "" ]; then
    CLIENTNAME="mskc"
fi
docker run -v $OVPN_DATA:$OVPN_SOURCE --rm -it kylemanna/openvpn easyrsa build-client-full $CLIENTNAME nopass

docker run -v $OVPN_DATA:$OVPN_SOURCE --rm kylemanna/openvpn ovpn_getclient $CLIENTNAME > $OVPN_DATA/conf/$CLIENTNAME.ovpn

# read current ServerIP
# HostIP=`ip -4 addr show scope global dev eth0 | grep inet | awk '{print \$2}' | cut -d / -f 1`
# TODO: This will fail on MacOS, no `ip` command
if hostname -I | awk '{print $1}' ; then
    # read IP with Linux Host
    HostIP=`hostname -I | awk '{print $1}'`
else
    # read IP with MacOS Host
    HostIP=`ipconfig getifaddr en0`
fi

# Show all values
echo -e "\n ____________________________________________________________________________"
echo -e "    Your VPN Domain is:                $PROTOCOL://$IP"
echo -e "    Your Pi-Hole Password is set:      $PASSWORD"
echo -e "   ____________________________________________________________________________\n"
# create a new sub-network (if not exist)
# docker network inspect vpn &>/dev/null || docker network create --driver=bridge --subnet=172.1.1.0/24 --gateway=172.1.1.1 vpn
docker run --name vpn --restart=always --cap-add=NET_ADMIN -v /etc/localtime:/etc/localtime -v /etc/timezone:/etc/timezone:ro -v $OVPN_DATA:$OVPN_SOURCE -d -p $PORT:1194/$PROTOCOL kylemanna/openvpn