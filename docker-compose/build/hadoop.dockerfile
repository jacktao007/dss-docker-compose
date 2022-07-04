FROM java:0.0.8
MAINTAINER 7956214@qq.com

COPY setup/hadoop-2.7.2.tar.gz /opt
RUN tar -zxvf /opt/hadoop-2.7.2.tar.gz -C /opt
ENV HADOOP_HOME=/opt/hadoop-2.7.2
ENV PATH=$PATH:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin
ENV HADOOP_CONF_DIR=/opt/hadoop-2.7.2/etc/hadoop
COPY setup/ssh-copy-id.sh /opt/
COPY setup/entrypoint.sh /opt/
COPY setup/wait-and-kill.sh /opt/
RUN echo -e  'y\n'|ssh-keygen -q -t rsa -N "" -f ~/.ssh/id_rsa

CMD ["/opt/entrypoint.sh"]
