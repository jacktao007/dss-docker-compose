FROM java:0.0.8
MAINTAINER 7956214@qq.com

RUN echo -e '[nginx]\n\
name=nginx repo\n\
baseurl=http://nginx.org/packages/centos/7/$basearch/\n\
gpgcheck=0\n\
enabled=1' >> /etc/yum.repos.d/nginx.repo
RUN yum -y install nginx
COPY setup/web.tar.gz /opt/
RUN tar -xzvf /opt/web.tar.gz -C /opt

CMD ["/usr/sbin/nginx"]
