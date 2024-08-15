FROM maven:3.8.5-openjdk-8
FROM python:3.8-slim

RUN mkdir -p /app/input

COPY pom.xml /app
COPY src /app/src
COPY evosuite-1.2.0.jar app/evosuite-1.2.0.jar
COPY evosuite-standalone-runtime-1.2.0.jar app/evosuite-standalone-runtime-1.2.0.jar
COPY scripts app/scripts
COPY entrypoint.sh app/script.sh

VOLUME ["/app/input"]
VOLUME ["/app/evosuite-files"]
VOLUME ["/app/evosuite-report"]
VOLUME ["/app/evosuite-tests"]

WORKDIR /app

# Make the .sh script executable
RUN chmod +x script.sh

# Set shell as the default startup command
#CMD ["/bin/sh"]

ENTRYPOINT ["./script.sh"]
