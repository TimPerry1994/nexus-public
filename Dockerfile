FROM timperry1994/jenkins-slave

COPY ./* /opt/

RUN mvnw clean install -Dmaven.test.skip=true
RUN unzip -d target assemblies/nexus-base-template/target/nexus-base-template-*.zip

ENTRYPOINT ["./target/nexus-base-template-*/bin/nexus console"]
