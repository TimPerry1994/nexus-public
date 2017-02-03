FROM timperry1994/jenkins-slave:1.0

COPY ./target /opt/

WORKDIR /opt/

ENTRYPOINT ["./target/nexus-base-template-*/bin/nexus console"]
