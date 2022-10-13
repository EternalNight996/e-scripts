FROM centos:centos7.7.1908
LABEL author="1379_Pudge"
LABEL maintainer="EternalNightYeah@yeah.net"
LABEL version="1.0"
LABEL description="这是一个centos nginx 容器镜像"


RUN yum -y update
# 配置中文解决乱码
ENV LC_ALL zh_CN.utf8

# 下载安装依赖
RUN yum install -y  gcc  pcre pcre-devel  openssl openssl-devel \
    && useradd -r -s /sbin/nologin nginx
#RUN yum install -y gcc-c++ zlib zlib-devel 
# 下载并编译nginx
ADD nginx-1.20.1.tar.gz /usr/local/src/ 
RUN cd /usr/local/src/nginx-1.20.1 \
    && ./configure --prefix=/apps/nginx \
    && make \
    && make install \
    && rm -rf /usr/local/src/nginx*
# 配置nginx
ADD nginx.conf /apps/nginx/conf/nginx.conf
# 可以更改nginx默认的主页
COPY html/* /apps/nginx/html/
RUN ln -s /apps/nginx/sbin/nginx /usr/sbin/nginx 
# 环境变量
ENV PATH /usr/local/nginx/sbin:$PATH
RUN yum clean all 
# 声明映射的端口80和443
EXPOSE 80 443
# 默认容器开始时执行的命令
CMD ["nginx","-g","daemon off;"]

# docker build -t nginx-centos7:1.6.1-v1 .
# docker run  -d -p 80:80  nginx-centos7:1.6.1-v1 
# docker exec -it <ID> /etc/bash