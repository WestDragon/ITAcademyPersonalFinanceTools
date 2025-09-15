FROM maven:3.9.11-amazoncorretto-24-alpine as build
ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME
RUN --mount=type=cache,target=/root/.m2 mvn -f $HOME/pom.xml clean package

FROM eclipse-temurin:19-jre-focal
ARG JAR_FILE=/usr/app/target/*-service.jar
COPY --from=build $JAR_FILE /app/runner.jar
EXPOSE 8080 8089
ENTRYPOINT java -jar /app/runner.jar