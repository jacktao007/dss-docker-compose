#!/bin/bash

#
# Copyright 2019 WeBank
#
# Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# description:  Starts and stops Server
#
# @name:        linkis-env
#
# Modified for Linkis 1.0.0

# SSH_PORT=22

### deploy user
deployUser=root

##Linkis_SERVER_VERSION
LINKIS_SERVER_VERSION=v1

### Specifies the user workspace, which is used to store the user's script files and log files.
### Generally local directory
WORKSPACE_USER_ROOT_PATH=file:///tmp/linkis/
### User's root hdfs path
HDFS_USER_ROOT_PATH=hdfs:///tmp/linkis



### Path to store started engines and engine logs, must be local
ENGINECONN_ROOT_PATH=/appcom/tmp

#ENTRANCE_CONFIG_LOG_PATH=hdfs:///tmp/linkis/

### Path to store job ResultSet:file or hdfs path
#RESULT_SET_ROOT_PATH=hdfs:///tmp/linkis ##hdfs:// required

### Provide the DB information of Hive metadata database.
### Attention! If there are special characters like "&", they need to be enclosed in quotation marks.
HIVE_META_URL=jdbc:mysql://mysql:3306/metastore?useUnicode=true
HIVE_META_USER=root
HIVE_META_PASSWORD=7956214

##YARN REST URL  spark engine required
YARN_RESTFUL_URL=http://hadoop:8089

###HADOOP CONF DIR
HADOOP_CONF_DIR=/opt/hadoop-2.7.2/etc/hadoop

###HIVE CONF DIR
HIVE_CONF_DIR=/opt/apache-hive-2.3.3-bin/conf

###SPARK CONF DIR
SPARK_CONF_DIR=/opt/spark-2.4.3-bin-hadoop2.7/conf

## Engine version conf
#SPARK_VERSION
#SPARK_VERSION=2.4.3
##HIVE_VERSION
#HIVE_VERSION=1.2.1
#PYTHON_VERSION=python2

################### The install Configuration of all Micro-Services #####################
#
#    NOTICE:
#       1. If you just wanna try, the following micro-service configuration can be set without any settings.
#            These services will be installed by default on this machine.
#       2. In order to get the most complete enterprise-level features, we strongly recommend that you install
#            Linkis in a distributed manner and set the following microservice parameters
#

###  EUREKA install information
###  You can access it in your browser at the address below:http://${EUREKA_INSTALL_IP}:${EUREKA_PORT}
EUREKA_INSTALL_IP=linkis
EUREKA_PORT=20303
export EUREKA_PREFER_IP=false

###  Gateway install information
GATEWAY_INSTALL_IP=linkis
GATEWAY_PORT=9001

### ApplicationManager
MANAGER_INSTALL_IP=linkis
MANAGER_PORT=9101

### EngineManager
ENGINECONNMANAGER_INSTALL_IP=linkis
ENGINECONNMANAGER_PORT=9102



### EnginePluginServer
ENGINECONN_PLUGIN_SERVER_INSTALL_IP=linkis
ENGINECONN_PLUGIN_SERVER_PORT=9103

### LinkisEntrance
ENTRANCE_INSTALL_IP=linkis
ENTRANCE_PORT=9104

###  publicservice
PUBLICSERVICE_INSTALL_IP=linkis
PUBLICSERVICE_PORT=9105

### cs
#CS_INSTALL_IP=linkis
CS_PORT=9108

########################################################################################

## LDAP is for enterprise authorization, if you just want to have a try, ignore it.
#LDAP_URL=ldap://localhost:1389/
#LDAP_BASEDN=dc=webank,dc=com
#LDAP_USER_NAME_FORMAT=cn=%s@xxx.com,OU=xxx,DC=xxx,DC=com

## java application default jvm memory
export SERVER_HEAP_SIZE=128M

##The decompression directory and the installation directory need to be inconsistent
LINKIS_HOME=/opt/linkis

LINKIS_VERSION=1.0.2

# for install
LINKIS_PUBLIC_MODULE=lib/linkis-commons/public-module
