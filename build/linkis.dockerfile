FROM spark:0.0.8
MAINTAINER 7956214@qq.com	
RUN echo -e '\n\
export JAVA_HOME=/opt/jdk1.8.0_301-amd64\n\
export JRE_HOME=${JAVA_HOME}/jre\n\
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib\n\
export PATH=${JAVA_HOME}/bin:$PATH\n\
' >> ~/.bashrc
COPY setup/linkis.tar.gz /opt
RUN tar -zxvf /opt/linkis.tar.gz -C /opt
RUN mkdir -p /appcom/tmp && mkdir -p /tmp/linkis/root
COPY setup/entrypoint_linkis.sh /
WORKDIR /opt/linkis/

CMD ["/entrypoint_linkis.sh"]
