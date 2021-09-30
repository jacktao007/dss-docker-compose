FROM java:0.0.8
MAINTAINER 7956214@qq.com
RUN yum install -y libaio numactl
COPY setup/mysql-5.7.34-el7-x86_64.tar.gz /opt
RUN tar -zxvf /opt/mysql-5.7.34-el7-x86_64.tar.gz -C /opt

CMD ["/opt/mysql-5.7.34-el7-x86_64/bin/mysqld","--defaults-file=/opt/mysql-5.7.34-el7-x86_64/my.cnf","--user=root"]
