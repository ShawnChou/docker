# Dockerfile for container1
FROM ubuntu:latest

# 安装必要的包
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    git \
    && apt-get clean

CMD ["tail", "-f", "/dev/null"]
