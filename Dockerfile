FROM ubuntu:19.04

MAINTAINER zxl0715

ADD assets /assets
RUN /assets/setup.sh
#安装ssh
RUN apt-get install tzdata  openssh-server apt-utils  sudo -y \
&& sudo sed -i "/#PermitRootLogin prohibit-password/i\PermitRootLogin yes" /etc/ssh/sshd_config \
&& echo 'root:gszh8899Oracle' |chpasswd
#设置为上海时区，通过安装tzdata
ENV TZ Asia/Shanghai

VOLUME ["/u01/app"]

EXPOSE 22
EXPOSE 1521
EXPOSE 8080

CMD /usr/sbin/startup.sh&& /etc/init.d/ssh start && tail -f /dev/null
