FROM openjdk:11
COPY api/target/api.jar /api.jar
WORKDIR /usr/app
EXPOSE 8080
CMD ["java", "-jar", "/api.jar"]