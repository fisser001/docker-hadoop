# Hadoop Docker
This repository contains a multi node hadoop cluster docker setup and is based of https://github.com/big-data-europe/docker-hadoop

## Supported Hadoop Versions
* 2.7.6 with OpenJDK 8

## Quick Start

### Deploy the HDFS cluster by executing the following command:

1. Navigate to the main folder where docker-compose.yml is stored
2. Exectue "docker-compose up" (Docker compose need to be installed --> see Docker compose documentation)

### Get network properties
Explore which IP Adresses have been given for the services:

1. Execute: docker network list
2. Identify your network (e.g. docker-hadoop_default)
3. Execute docker network inspect docker

Access these interfaces with the following URLs:

* Namenode: http://<dockerhadoop_IP_address>:50070/
* History server: http://<dockerhadoop_IP_address>:8188/applicationhistory
* Datanode: http://<dockerhadoop_IP_address>:50075/
* Nodemanager: http://<dockerhadoop_IP_address>:8042/node
* Resource manager: http://<dockerhadoop_IP_address>:8088/

### Navigate within HDFS
For navigating within HDFS without a extra HDFS Client you can connect e.g. to the namenode and execute HDFS commands:

1. docker exec -it namenode bin/bash
2. hdfs dfs -ls /
