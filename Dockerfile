FROM openjdk:21

WORKDIR /app

COPY app/target/app.jar /app

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
