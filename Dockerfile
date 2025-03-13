FROM openjdk:11
COPY api/target/api.jar /api.jar
WORKDIR /usr/app
EXPOSE 8080

ENTRYPOINT  ["java", "-jar", "/api.jar"]