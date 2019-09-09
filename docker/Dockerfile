FROM psyking841/apache-ranger:2.0.0-SNAPSHOT as ranger-plugin

FROM openjdk:8u181-jre-stretch

WORKDIR /opt
ARG HADOOP_VERSION=3.1.2
ARG HIVE_VERSION=3.1.2
ARG RANGER_VERSION=2.0.0-SNAPSHOT
ARG AWS_JAVA_SDK=1.11.271

ENV HADOOP_HOME=/opt/hadoop
ENV HIVE_HOME=/opt/hive
ENV RANGE_HIVE_PLUGIN_DIR=/opt/ranger-hive-plugin
# Include additional jars
ENV HADOOP_CLASSPATH=$HADOOP_HOME/share/hadoop/tools/lib/aws-java-sdk-bundle-$AWS_JAVA_SDK.jar:$HADOOP_HOME/share/hadoop/tools/lib/hadoop-aws-$HADOOP_VERSION.jar
ENV ENABLE_RANGER_HIVE_PLUGIN=false

COPY --from=ranger-plugin /opt/ranger/target/ranger-${RANGER_VERSION}-hive-plugin.tar.gz /opt/ranger-${RANGER_VERSION}-hive-plugin.tar.gz
COPY entrypoint.sh /opt/entrypoint.sh

RUN apt-get update && \
    apt-get -y install procps sudo netcat && \
    curl -L https://www-us.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz | tar zxf - && \
    curl -L https://www-us.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-${HADOOP_VERSION}.tar.gz | tar zxf - && \
    mv /opt/apache-hive-${HIVE_VERSION}-bin /opt/hive && \
    mv /opt/hadoop-$HADOOP_VERSION /opt/hadoop
ADD hive-site.xml hive-log4j2.properties ${HIVE_HOME}/conf/
ADD https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.48/mysql-connector-java-5.1.48.jar ${HIVE_HOME}/lib

# Install ranger-hive-plugin
RUN tar zxvf ranger-${RANGER_VERSION}-hive-plugin.tar.gz && \
    mv /opt/ranger-${RANGER_VERSION}-hive-plugin /opt/ranger-hive-plugin
COPY ranger-hive-plugin/hive-plugin.install.properties ranger-hive-plugin/install.properties

EXPOSE 9083 10000 10002
# USER hive
ENTRYPOINT ["/opt/entrypoint.sh"]