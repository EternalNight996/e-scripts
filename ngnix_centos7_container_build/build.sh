#/usr/bin/bash

container_name="nginx-centos7:1.6.1-v1"
image_name="nginx-centos7:1.6.1-v1"
name="nginx_centos"
nginx_version="nginx-1.20.1.tar.gz"

sudo apt update
sudo apt install curl
curl http://nginx.org/download/${nginx_version} >${nginx_version}

docker build -t ${image_name} .
docker run  --name ${name} -d -p 80:80 ${container_name}

echo "------Ok, builded container successful!"
docker ps -a
echo "please enter command into container ->"
echo "---------------------------------------"
echo "---------------------------------------"
echo "docker exec -it <CONTAINER ID> /etc/bash"
echo "docker attach <CONTAINER ID>"
echo "---------------------------------------"
echo "cleaning -> %nginx_version%"
rm -rf %nginx_version%