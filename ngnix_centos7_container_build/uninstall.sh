#/usr/bin/bash
container_name="nginx-centos7:1.6.1-v1"
image_name="nginx-centos7:1.6.1-v1"
name="nginx_centos"

echo ************正在停止容器 -> %name%
docker stop ${name}
echo ************正在卸载容器 -> %name%
docker rm ${name}
echo ************正在卸载镜像 -> %image%
docker rmi ${image}
echo *************已经清理完毕请按任意键关闭窗口 -!-