FROM base:0.0.8
MAINTAINER 7956214@qq.com
COPY setup/jdk1.8.0_301-amd64.tar.gz /opt/
RUN tar -xzvf /opt/jdk1.8.0_301-amd64.tar.gz -C /opt && rm -rf /opt/jdk1.8.0_301-amd64.tar.gz

FROM base:0.0.8
COPY --from=0 /opt/jdk1.8.0_301-amd64 /opt/jdk1.8.0_301-amd64
ENV JAVA_HOME /opt/jdk1.8.0_301-amd64
ENV JRE_HOME  /opt/jdk1.8.0_301-amd64/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH

CMD ["/usr/sbin/sshd", "-D"]
