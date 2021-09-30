FROM hadoop:0.0.8
MAINTAINER 7956214@qq.com

COPY setup/apache-hive-2.3.3-bin.tar.gz /opt
RUN tar -zxvf /opt/apache-hive-2.3.3-bin.tar.gz -C /opt

ENV HIVE_HOME=/opt/apache-hive-2.3.3-bin
ENV HIVE_CONF_DIR=/opt/apache-hive-2.3.3-bin/conf
ENV PATH=$PATH:$HIVE_HOME/bin
WORKDIR /opt/apache-hive-2.3.3-bin/
CMD ["bin/hive","--service","metastore"]
