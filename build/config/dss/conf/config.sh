### deploy user
deployUser=root

##微服务的�?大内存使用量
SERVER_HEAP_SIZE=128M


### The install home path of DSS，Must provided
DSS_INSTALL_HOME=/opt/dss

###  Linkis EUREKA  information.  # Microservices Service Registration Discovery Center
EUREKA_INSTALL_IP=linkis
EUREKA_PORT=20303

### Specifies the user workspace, which is used to store the user's script files and log files.
### Generally local directory
#WORKSPACE_USER_ROOT_PATH=file:///tmp/linkis/
#### Path to store job ResultSet：file or hdfs path
#RESULT_SET_ROOT_PATH=hdfs:///tmp/linkis

### Linkis Gateway  information
GATEWAY_INSTALL_IP=linkis
GATEWAY_PORT=9001

#for azkaban
WDS_SCHEDULER_PATH=file:///appcom/tmp/wds/scheduler

################### The install Configuration of all Micro-Services #####################
#
#    NOTICE:
#       1. If you just wanna try, the following micro-service configuration can be set without any settings.
#            These services will be installed by default on this machine.
#       2. In order to get the most complete enterprise-level features, we strongly recommend that you install
#          the following microservice parameters
#

### DSS_SERVER
### This service is used to provide dss-server capability.

### project-server
DSS_FRAMEWORK_PROJECT_SERVER_INSTALL_IP=
DSS_FRAMEWORK_PROJECT_SERVER_PORT=
### orchestrator-server
DSS_FRAMEWORK_ORCHESTRATOR_SERVER_INSTALL_IP=
DSS_FRAMEWORK_ORCHESTRATOR_SERVER_PORT=
### apiservice-server
DSS_APISERVICE_SERVER_INSTALL_IP=
DSS_APISERVICE_SERVER_PORT=
### dss-workflow-server
DSS_WORKFLOW_SERVER_INSTALL_IP=
DSS_WORKFLOW_SERVER_PORT=
### dss-flow-execution-server
DSS_FLOW_EXECUTION_SERVER_INSTALL_IP=
DSS_FLOW_EXECUTION_SERVER_PORT=
###dss-datapipe-server
DSS_DATAPIPE_SERVER_INSTALL_IP=
DSS_DATAPIPE_SERVER_PORT=

############## ############## dss_appconn_instance configuration   start   ############## ##############
EVENTCHECKER_JDBC_URL=jdbc:mysql://mysql:3306/dss?characterEncoding=UTF-8
EVENTCHECKER_JDBC_USERNAME=root
EVENTCHECKER_JDBC_PASSWORD=7956214

DATACHECKER_JOB_JDBC_URL=jdbc:mysql://mysql:3306/metastore?useUnicode=true
DATACHECKER_JOB_JDBC_USERNAME=root
DATACHECKER_JOB_JDBC_PASSWORD=7956214

DATACHECKER_BDP_JDBC_URL=jdbc:mysql://mysql:3306/metastore?useUnicode=true
DATACHECKER_BDP_JDBC_USERNAME=root
DATACHECKER_BDP_JDBC_PASSWORD=7956214

EMAIL_HOST=smtp.163.com
EMAIL_PORT=25
EMAIL_USERNAME=xxx@163.com
EMAIL_PASSWORD=xxxxx
EMAIL_PROTOCOL=smtp
############## ############## dss_appconn_instance configuration   end   ############## ##############

DSS_VERSION=1.0.0

DSS_FILE_NAME=dss-1.0.0
