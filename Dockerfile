FROM openjdk:11
COPY api/target/api.jar /api.jar
CMD ["java", "-jar", "/api.jar"]