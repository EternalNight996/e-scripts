@echo off
@title uninstall images and containers

set container=nginx-centos7:1.6.1-v1
set image=nginx-centos7
set name=nginx_centos
echo ************����ֹͣ����  %name%
docker stop %name%
color 2
echo ************����ж������  %name%
docker rm %name%
echo ************����ж�ؾ���  %image%
docker rmi %image%
echo *************�Ѿ���������밴������رմ��� -!-
pause > nul
