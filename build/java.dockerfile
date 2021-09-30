FROM centos:7.9.2009
MAINTAINER 7956214@qq.com

ENV TZ="Asia/Shanghai"
ENV LANG en_US.UTF-8
RUN set -eux; \
	yum install wget expect -y; \
	cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup && \
        sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org|baseurl=https://mirrors.tuna.tsinghua.edu.cn|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-*.repo && \
	yum update -y; \
	yum install -y \
		gzip \
		tar \
		unzip \
        which \
		binutils \
		freetype fontconfig \
	; \
	rm -rf /var/cache/yum
RUN yum install -y openssh-server sudo
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN yum  install -y openssh-clients
RUN echo "root:pass" | chpasswd
RUN echo "root   ALL=(ALL)       ALL" >> /etc/sudoers
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN mkdir /var/run/sshd
EXPOSE 22

COPY setup/jdk1.8.0_301-amd64.tar.gz /opt/
RUN tar -xzvf /opt/jdk1.8.0_301-amd64.tar.gz -C /opt
ENV JAVA_HOME /opt/jdk1.8.0_301-amd64
ENV JRE_HOME  /opt/jdk1.8.0_301-amd64/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH





CMD ["/usr/sbin/sshd", "-D"]
