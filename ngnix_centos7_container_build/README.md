<center><h1>Docker制作nginx镜像文档</h1></center>

***

> [立即前往博客配置以及安装Docker教程](https://www.cnblogs.com/eternalnight/p/15173158.html)

> [立即前往此项目的博客教程](https://www.cnblogs.com/eternalnight/p/15201521.html)

#### 自动制作镜像
> windows 自动化脚本，以管理权限运行即可, 需要段时间。
> > 搭建镜像.bat
> > 搭建镜像.ps1

> linux 自动化脚本
> > sudo chmod +x build_image.sh
> > /bin/bash build_image.sh
>> build_image.sh

#### 手动制作镜像
```powershell
docker build -t nginx-centos7:1.6.1-v1 .
docker run  --name nginx_centos -d -p 80:80 nginx-centos7:1.6.1-v1
docker exec -it <CONTAINER ID> bash
```
