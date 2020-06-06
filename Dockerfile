FROM openjdk:14-alpine AS build-stage
WORKDIR /build

#RUN /opt/openjdk-14/bin/jlink --compress=2 --output ./custom-jre --add-modules java.base,java.compiler,java.desktop,java.management,java.naming,java.rmi,java.scripting,java.sql,jdk.sctp,jdk.unsupported,jdk.zipfs,java.security.jgss,java.instrument
RUN /opt/openjdk-14/bin/jlink --compress=2 --output ./custom-jre --add-modules java.base,java.logging,java.naming,java.management,java.instrument,java.desktop,java.security.jgss,

FROM alpine
WORKDIR micro
ADD ./target/micro.jar /micro/micro.jar

COPY --from=build-stage /build/custom-jre /micro/custom-jre

CMD /micro/custom-jre/bin/java -jar /micro/micro.jar
