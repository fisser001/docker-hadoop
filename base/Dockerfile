FROM debian:8

#Add Repo
RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list

# Update repos and install JAVA JDK 
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -t jessie-backports -y --no-install-recommends openjdk-8-jre-headless ca-certificates-java openjdk-8-jdk-headless openjdk-8-jdk wget 

#Set Env for Java
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

#Install curl
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends net-tools curl netcat nano

# Get Hadoop package and export it + delete download
ENV HADOOP_VERSION 2.7.6
#ENV HADOOP_VERSION 2.7.3
#ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
ENV HADOOP_URL https://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN mkdir -p /opt/tez/

ENV TEZ_VERSION 0.9.0
#ENV TEZ_URL http://apache.mirror.digionline.de/tez/0.8.5/apache-tez-0.8.5-bin.tar.gz
#ENV TEZ_URL http://ftp.halifax.rwth-aachen.de/apache/tez/$TEZ_VERSION/apache-tez-$TEZ_VERSION-bin.tar.gz
COPY tez-$TEZ_VERSION-minimal.tar.gz /tmp/
RUN set -x \
  #  && curl -fSL "$TEZ_URL" -o /tmp/apache-tez-$TEZ_VERSION-bin.tar.gz \
    && tar -xvf /tmp/tez-$TEZ_VERSION-minimal.tar.gz -C /opt/tez/
    #&& rm /tmp/tez.tar.gz*

# Set Env    
ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH

ENV TEZ_HOME=/opt/tez/tez-$TEZ_VERSION-minimal
ENV TEZ_CONF_DIR=$TEZ_HOME/conf
ENV TEZ_JARS=$TEZ_HOME/*:$TEZ_HOME/lib/*
#ENV HADOOP_CLASSPATH=${TEZ_CONF_DIR}:${TEZ_JARS}:$HADOOP_CLASSPATH
ENV HADOOP_CLASSPATH=$TEZ_CONF_DIR
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/hadoop-shim-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/hadoop-shim-2.6-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/tez-api-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/tez-common-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/tez-dag-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/tez-examples-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/tez-ext-service-tests-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/tez-history-parser-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/tez-javadoc-tools-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/tez-job-analyzer-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/tez-mapreduce-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/tez-runtime-internals-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/tez-runtime-library-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/tez-tests-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/tez-yarn-timeline-history-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/tez-yarn-timeline-history-with-acls-0.9.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/RoaringBitmap-0.4.9.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/async-http-client-1.8.16.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/commons-cli-1.2.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/commons-codec-1.4.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/commons-collections-3.2.2.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/commons-collections4-4.1.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/commons-io-2.4.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/commons-lang-2.6.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/commons-math3-3.1.1.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/guava-11.0.2.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/hadoop-mapreduce-client-common-2.6.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/hadoop-mapreduce-client-core-2.6.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/jersey-client-1.9.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/jersey-json-1.9.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/jettison-1.3.4.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/jetty-6.1.26.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/jetty-util-6.1.26.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/jsr305-3.0.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/metrics-core-3.1.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/protobuf-java-2.5.0.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/servlet-api-2.5.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/slf4j-api-1.7.10.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/tez/lib/slf4j-log4j12-1.7.10.jar


RUN cp $HADOOP_HOME/etc/hadoop/mapred-site.xml.template $HADOOP_HOME/etc/hadoop/mapred-site.xml
ADD yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml
#ADD hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh

RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs
RUN mkdir /hadoop-data

RUN mkdir -p /opt/tez/conf
ADD tez-site.xml /opt/tez/conf
#ADD tez-site.xml $TEZ_CONF_DIR

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
