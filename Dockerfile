FROM anapsix/alpine-java
COPY /target/*.jar /spring-petclinic-2.4.2.jar
CMD ["java","-jar","/spring-petclinic-2.4.2.jar"]
