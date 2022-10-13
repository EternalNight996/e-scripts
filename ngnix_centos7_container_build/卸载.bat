@echo off
@title uninstall images and containers

set container=nginx-centos7:1.6.1-v1
set image=nginx-centos7
set name=nginx_centos
echo ************正在停止容器  %name%
docker stop %name%
color 2
echo ************正在卸载容器  %name%
docker rm %name%
echo ************正在卸载镜像  %image%
docker rmi %image%
echo *************已经清理完毕请按任意键关闭窗口 -!-
pause > nul
