FROM openjdk:8-jdk-slim
FROM python:3.8-slim

# Install Maven
RUN apt-get update && apt-get install -y maven

RUN mkdir -p /app/input

COPY pom.xml /app
COPY src /app/src
COPY evosuite-1.2.0.jar app/evosuite-1.2.0.jar
COPY evosuite-standalone-runtime-1.2.0.jar app/evosuite-standalone-runtime-1.2.0.jar
COPY scripts /app/scripts

VOLUME ["/app/input"]
VOLUME ["/app/evosuite-files"]
VOLUME ["/app/evosuite-report"]
VOLUME ["/app/evosuite-tests"]

WORKDIR /app

CMD ["python", "./scripts/help.py"]
