FROM maven:3.8.4-openjdk-8-slim

# Install Python
RUN apt-get update && \
    apt-get install -y python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app/input
RUN mkdir -p /app/target

COPY pom.xml /app
COPY src /app/src
COPY evosuite-1.2.0.jar app/evosuite-1.2.0.jar
COPY evosuite-standalone-runtime-1.2.0.jar app/evosuite-standalone-runtime-1.2.0.jar
COPY scripts /app/scripts

VOLUME ["/app/input"]
VOLUME ["/app/evosuite-files"]
VOLUME ["/app/evosuite-report"]
VOLUME ["/app/evosuite-tests"]
VOLUME ["/app/scripts/gen_evosuite.sh"]

WORKDIR /app

# make .sh scripts executable
RUN chmod +x ./scripts/mvn_setup.sh
RUN chmod +x ./scripts/gen_evosuite.sh
RUN chmod +x ./scripts/tests.sh

CMD ["python3", "./scripts/help.py"]
