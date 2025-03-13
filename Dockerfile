FROM openjdk:11
COPY api.jar /api.jar
CMD ["java", "-jar", "/api.jar"]