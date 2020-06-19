#镜像基于的版本
FROM nginx:1.14
#作者
MAINTAINER  Shawn.Chou  "shawnchou1988@gmail.com"
#更新
RUN apt-get update
#安装必要工具集
RUN apt-get install -y procps vim net-tools
#目录部署
RUN mkdir -p /workspace/logs
RUN mkdir -p /workspace/htdocs
RUN mkdir -p /workspace/tools
#配置nginx配置文件
RUN rm -rf /usr/local/nginx/conf/nginx.conf
COPY nginx.conf /usr/local/nginx/conf/nginx.conf
RUN nginx -c /etc/nginx/nginx.conf
EXPOSE 80
EXPOSE 22
EXPOSE 443

