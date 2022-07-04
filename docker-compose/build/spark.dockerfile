FROM hive:0.0.8
MAINTAINER 7956214@qq.com

COPY setup/spark-2.4.3-bin-hadoop2.7.tar.gz /opt
RUN tar -zxvf /opt/spark-2.4.3-bin-hadoop2.7.tar.gz -C /opt

ENV HIVE_HOME=/opt/apache-hive-2.3.3-bin
ENV HIVE_CONF_DIR=/opt/apache-hive-2.3.3-bin/conf
ENV PATH=$PATH:$HIVE_HOME/bin

ENV SPARK_HOME=/opt/spark-2.4.3-bin-hadoop2.7
ENV PATH=$PATH:${SPARK_HOME}/bin:${SPARK_HOME}/sbin

WORKDIR /opt/spark-2.4.3-bin-hadoop2.7/

CMD ["/usr/sbin/sshd", "-D"]
