$container_name = 'nginx-centos7:1.6.1-v1'
$image_name = 'nginx-centos7:1.6.1-v1'
$name = 'nginx_centos'
$nginx_version = 'nginx-1.20.1.tar.gz'

# 下载nginx
$client = new-object System.Net.WebClient
$client.DownloadFile("http://nginx.org/download/${nginx_version}", $nginx_version)

docker build -t $image_name .
docker run  --name $name -d -p 80:80 $container_name

echo "------Ok, builded container successful!"
docker ps -a
echo "please enter command into container ->"
echo "---------------------------------------"
echo "---------------------------------------"
echo "docker exec -it <CONTAINER ID> bash"
echo "docker attach <CONTAINER ID>"
echo "---------------------------------------"
echo "cleaning -> ${nginx_version}"
rm $nginx_version
pause
