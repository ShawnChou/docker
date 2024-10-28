FROM ubuntu:latest

# 安装 Docker CLI
RUN apt-get update && apt-get install -y \
    docker.io \
    && apt-get clean

# 设置容器启动时运行的命令
CMD ["tail", "-f", "/dev/null"]
