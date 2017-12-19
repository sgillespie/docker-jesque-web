# Build the war
FROM maven:3-jdk-8-slim as builder
RUN apt-get update && \
    apt-get install -y git
WORKDIR /usr/src
RUN git clone git://github.com/gresrun/jesque-web.git /usr/src && \
    mvn clean package

# Deploy it to jetty
FROM jetty:jre8-alpine

USER root
RUN apk update && apk add gettext

COPY --from=builder /usr/src/target/jesque-web-1.1.0-SNAPSHOT/ /jesque-web.war
COPY redis.properties.tmpl /jesque-web.war/WEB-INF/classes/META-INF/spring/
RUN chown -R jetty:jetty /jesque-web.war

COPY jesque-web.xml.tmpl "${JETTY_BASE}/webapps/jesque-web.xml.tmpl"

USER jetty
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
