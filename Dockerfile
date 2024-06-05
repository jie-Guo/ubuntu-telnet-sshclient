FROM ubuntu:24.04

WORKDIR /app

RUN apt update && apt full-upgrade -y \
        && DEBIAN_FRONTEND=noninteractive apt install -y openssh-clients telnet locales tzdata pkg-config \
        && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
        && echo "Asia/Shanghai" > /etc/timezone \
        && rm -rf /var/lib/apt/lists/*

# 字符集、时区 环境变量
ENV LANG=en_US.utf8
ENV LC_ALL=en_US.utf8
ENV TZ=Asia/Shanghai

CMD ["/bin/bash"]
