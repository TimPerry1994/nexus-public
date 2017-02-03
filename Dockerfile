
FROM centos:7
MAINTAINER Timothy Perry

RUN yum update -y && yum clean all

RUN yum install -y git && \
	yum install -y wget && \
	yum install -y openssh-server && \
	yum install -y sudo && \
	yum clean all

WORKDIR /opt

RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz"
RUN tar xzf jdk-8u121-linux-x64.tar.gz

RUN alternatives --install /usr/bin/java java /opt/jdk1.8.0_121/bin/java 2
RUN alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_121/bin/jar 2
#RUN alternatives --set jar /opt/jdk1.8.0_121/bin/jar
#RUN alternatives --set javac /opt/jdk1.8.0_121/bin/javac
ENV JAVA_HOME = /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.121-0.b13.el7_3.x86_64

EXPOSE 8081

RUN unzip -d target assemblies/nexus-base-template/target/nexus-base-template-*.zip
RUN ./target/nexus-base-template-*/bin/nexus console
