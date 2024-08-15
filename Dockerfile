FROM maven:3.8.5-openjdk-8

WORKDIR /app

COPY pom.xml /app
COPY src /app/src
COPY target/evoservice-1.0-SNAPSHOT-jar-with-dependencies.jar app/target/evoservice-1.0-SNAPSHOT-jar-with-dependencies.jar
COPY evosuite-1.2.0.jar app/evosuite-1.2.0.jar
COPY evosuite-standalone-runtime-1.2.0.jar app/evosuite-standalone-runtime-1.2.0.jar

VOLUME["/app/input"]
VOLUME["/app/evosuite-files"]
VOLUME["/app/evosuite-report"]
VOLUME["/app/evosuite-tests"]

# Set shell as the default startup command
CMD ["/bin/sh"]
