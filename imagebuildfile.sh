#!/bin/bash

export version=1.0.0
export hadoop_version=2.7.6

cd ~/repos/masterarbeit/docker-hadoop/base
docker build -t mfisser/hadoop-base:${version}-hadoop${hadoop_version}-java8 ./
docker push mfisser/hadoop-base:${version}-hadoop${hadoop_version}-java8

cd ~/repos/masterarbeit/docker-hadoop/namenode
docker build -t mfisser/hadoop-namenode:${version}-hadoop${hadoop_version}-java8 ./
docker push mfisser/hadoop-namenode:${version}-hadoop${hadoop_version}-java8

cd ~/repos/masterarbeit/docker-hadoop/datanode
docker build -t mfisser/hadoop-datanode:${version}-hadoop${hadoop_version}-java8 ./
docker push mfisser/hadoop-datanode:${version}-hadoop${hadoop_version}-java8

cd ~/repos/masterarbeit/docker-hadoop/historyserver
docker build -t mfisser/hadoop-historyserver:${version}-hadoop${hadoop_version}-java8 ./
docker push mfisser/hadoop-historyserver:${version}-hadoop${hadoop_version}-java8

cd ~/repos/masterarbeit/docker-hadoop/resourcemanager
docker build -t mfisser/hadoop-resourcemanager:${version}-hadoop${hadoop_version}-java8 ./
docker push mfisser/hadoop-resourcemanager:${version}-hadoop${hadoop_version}-java8

cd ~/repos/masterarbeit/docker-hadoop/nodemanager
docker build -t mfisser/hadoop-nodemanager:${version}-hadoop${hadoop_version}-java8 ./
docker push mfisser/hadoop-nodemanager:${version}-hadoop${hadoop_version}-java8
