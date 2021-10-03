FROM centos:7.9.2009
MAINTAINER 7956214@qq.com

ENV TZ="Asia/Shanghai"
ENV LANG en_US.UTF-8

RUN set -eux; \
	cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup && \
        sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org|baseurl=https://mirrors.tuna.tsinghua.edu.cn|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-*.repo && \
	yum update -y && \
	yum install -y \
        zip unzip gzip tar wget expect \
        iproute openssh-server openssh-clients sudo\
        which binutils 	freetype fontconfig \
	&& \
	rm -rf /var/cache/yum && \
        sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config && \
        echo "root:pass" | chpasswd && \
        echo "root   ALL=(ALL)       ALL" >> /etc/sudoers &&\
        ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key && \
        ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key && \
        mkdir /var/run/sshd;

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
