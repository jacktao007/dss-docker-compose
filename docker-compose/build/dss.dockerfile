FROM hive:0.0.8
MAINTAINER 7956214@qq.com
RUN mkdir -p /appcom/tmp/dss
RUN mkdir -p /appcom/tmp/wds/scheduler
RUN mkdir -p /tmp/linkis
COPY setup/dss.tar.gz /opt/
RUN tar -xzvf /opt/dss.tar.gz -C /opt
RUN yum -y install iproute zip
WORKDIR /opt/dss/
COPY setup/entrypoint_dss.sh /
CMD ["/entrypoint_dss.sh"]
