FROM openjdk:11
COPY target/api.jar /api.jar
CMD ["java", "-jar", "/api.jar"]