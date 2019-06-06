# Hadoop based on Docker-compose
This repository contains all the container related code for creating the container images and starting a multi node Apache Hadoop cluster. 

All container have been build by Docker and executed by Docker-compose. Each component of Hadoop has its own Docker image.

This repository is based on https://github.com/big-data-europe/docker-hadoop.

## Versions
- Hadoop: 2.7.6

## Subfolder and relevant files

The repository is divided into the following subfolder:

### base
Contains the definition for the creation of an Hadoop Docker base image.

### Datanode
Definition of the Docker image for Hadoop Datanode component. This definition is based on the previous defined base image.

### Namenode
Definition of the Docker image for Hadoop Namenode component. This definition is based on the previous defined base image.

### Historyserver
Definition of the Docker image for Hadoop Historyserver component. This definition is based on the previous defined base image.

### Nodemanager
Definition of the Docker image for Hadoop Nodemanager component. This definition is based on the previous defined base image.

### Resourcemanager
Definition of the Docker image for Hadoop Resourcemanager component. This definition is based on the previous defined base image.

### Docker-compose
This file contains the main definiton for the Hadoop cluster. The file contains all components that are relevant for starting the environment.

In order to start the cluster, Docker and Docker-compose have to be installed on the machine where the cluster should be started. If that is fullfilled navigate to the folder where the Docker-compose file is located. The following command has to be executed for starting all relevant components:

```console
docker-compose up
```

After execution of the Docker-compose file the following components will start:

1.  Hadoop Namenode (1x)
2.  Hadoop Datanode (3x)
3.  Hadoop Resourcemanager (1x)
4.  Historyserver (1x)
5.  Nodemanager (2x)

In order to shut down all components of the environment the following command needs to be executed:
```console
docker-compose stop
```

## Access to GUIs
Once all containers have been started the GUIs of the components can be accessed by the following URLs within a browser:

- Namenode: http://<docker_IP_address>:50070/dfshealth.html#tab-overview
- History server: http://<docker_IP_address>:8188/applicationhistory
- Datanode: http://<docker_IP_address>:50075/
- Nodemanager: http://<docker_IP_address>:8042/node
- Resource manager: http://<docker_IP_address>:8088/

In order to find the IP address that has been given to the component one can execute the following commands:
```console
docker network ls #In order to get the network name
docker network inspect <NETWORK NAME> #Exchange the network name with the identified name with the previous command.
```

## Access the container

### HDFS
Navigate into the Docker-compose directory and execute the following command:
```console
docker exec -it namenode bin/bash
```
For navigating within HDFS execute HDFS commands:
```console
hdfs dfs -ls /
```