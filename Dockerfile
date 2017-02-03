FROM timperry1994/jenkins-slave

COPY ./target /opt/

WORKDIR /opt/

ENTRYPOINT ["./target/nexus-base-template-*/bin/nexus console"]
