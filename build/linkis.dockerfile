FROM spark:0.0.8
MAINTAINER 7956214@qq.com	

COPY setup/linkis.tar.gz /opt
RUN tar -zxvf /opt/linkis.tar.gz -C /opt
RUN mkdir -p /appcom/tmp && mkdir -p /tmp/linkis/ 
COPY setup/entrypoint_linkis.sh /
WORKDIR /opt/linkis/

CMD ["/entrypoint_linkis.sh"]
