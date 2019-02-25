FROM debian:8

#Add Repo
RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list

# Update repos and install JAVA JDK 
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -t jessie-backports -y --no-install-recommends openjdk-8-jre-headless ca-certificates-java openjdk-8-jdk-headless openjdk-8-jdk wget 

#Set Env for Java
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

#Install curl
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends net-tools curl netcat nano git nodejs

# Get Hadoop package and export it + delete download
#ENV HADOOP_VERSION 2.7.6
ENV HADOOP_VERSION 2.7.3
#ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
ENV HADOOP_URL https://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN mkdir -p /opt/tez/

ENV TEZ_VERSION 0.8.5
#ENV TEZ_URL http://apache.mirror.digionline.de/tez/0.8.5/apache-tez-0.8.5-bin.tar.gz
ENV TEZ_URL http://ftp.halifax.rwth-aachen.de/apache/tez/$TEZ_VERSION/apache-tez-$TEZ_VERSION-bin.tar.gz
RUN set -x \
    && curl -fSL "$TEZ_URL" -o /tmp/apache-tez-$TEZ_VERSION-bin.tar.gz \
    && tar -xvf /tmp/apache-tez-$TEZ_VERSION-bin.tar.gz -C /opt/tez/
    #&& rm /tmp/tez.tar.gz*

# Set Env    
ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH

ENV TEZ_HOME=/opt/tez/apache-tez-$TEZ_VERSION-bin
ENV TEZ_CONF_DIR=$TEZ_HOME/conf
ENV TEZ_JARS=$TEZ_HOME/*:$TEZ_HOME/lib/*
ENV HADOOP_CLASSPATH=${TEZ_CONF_DIR}:${TEZ_JARS}:$HADOOP_CLASSPATH

RUN cp $HADOOP_HOME/etc/hadoop/mapred-site.xml.template $HADOOP_HOME/etc/hadoop/mapred-site.xml

RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs
RUN mkdir /hadoop-data

#RUN mkdir -p /opt/tez/apache-tez-0.9.1-bin/conf
ADD tez-site.xml /opt/tez/apache-tez-$TEZ_VERSION-bin/conf
#ADD tez-site.xml $TEZ_CONF_DIR

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
