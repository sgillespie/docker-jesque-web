FROM maven:3-jdk-8-slim as builder
RUN apt-get update && \
    apt-get install -y git

WORKDIR /usr/src
RUN git clone git://github.com/gresrun/jesque-web.git /usr/src && \
    mvn clean package

FROM jetty:jre8-alpine
COPY --from=builder /usr/src/target/jesque-web-1.1.0-SNAPSHOT/ /var/lib/jetty/webapps/ROOT
