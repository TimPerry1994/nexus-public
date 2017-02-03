FROM timperry1994/jenkins-slave:1.0

ENV JAVA_HOME /opt/jdk1.8.0_121
COPY ./target /opt

WORKDIR /opt

ENTRYPOINT /opt/nexus-base-template-3.2.0-SNAPSHOT/bin/nexus console
