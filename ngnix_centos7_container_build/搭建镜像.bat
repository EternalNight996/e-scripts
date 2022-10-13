@echo off
set container_name=nginx-centos7:1.6.1-v1
set image_name=nginx-centos7:1.6.1-v1
set name=nginx_centos
set nginx_version=nginx-1.20.1.tar.gz

certutil -urlcache -split -f http://nginx.org/download/%nginx_version% %nginx_version%
certutil -urlcache -split -f http://nginx.org/download/%nginx_version% delete

docker build -t %image_name% .
docker run  --name %name% -d -p 80:80 %container_name%

color 2
echo "------Ok, builded container successful!"
docker ps -a
echo "please enter command into container ->"
echo "---------------------------------------"
echo "---------------------------------------"
echo "docker exec -it <CONTAINER ID> bash"
echo "docker attach <CONTAINER ID>"
echo "---------------------------------------"
echo "cleaning -> %nginx_version%"
del %nginx_version%
pause
