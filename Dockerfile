FROM maven:3.8.6-openjdk-18 as exec

WORKDIR /root/message

ADD message.tar /root/

RUN mvn clean package 

FROM openjdk:17-alpine

WORKDIR /root/

COPY --from=exec /root/message/target/*.jar interview.jar

ENTRYPOINT ["java", "-jar", "/root/interview.jar"]
