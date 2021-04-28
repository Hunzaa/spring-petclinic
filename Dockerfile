FROM openjdk:latest

COPY target/*.jar PetClinic.jar

ENTRYPOINT ["java", "-jar", "/PetClinic.jar"]
