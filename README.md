# EvoService
[![Java CI with Maven](https://github.com/isaacmaffeis/evoservice/actions/workflows/maven.yml/badge.svg)](https://github.com/isaacmaffeis/evoservice/actions/workflows/maven.yml)
[![Docker Image CI](https://github.com/isaacmaffeis/evoservice/actions/workflows/docker-image.yml/badge.svg)](https://github.com/isaacmaffeis/evoservice/actions/workflows/docker-image.yml)

EvoService is a test suite generator for Java applications, utilizing the powerful EvoSuite tool to automatically generate JUnit test cases. 
This project streamlines the process of setting up and using EvoSuite, allowing for easy test case generation and management within a Maven-based Java project.

## Prerequisites 
Before you begin, ensure you have the following installed on your system:
- java 8
- maven
- python 3

## How to start
To get started, please follow these steps:

### Cloning the Repository
1. Open GitBash and clone the repository:
    ```bash
    git clone https://github.com/isaacmaffeis/evoservice.git
    ```

2. Navigate into the project directory:
    ```bash
    cd ./evoservice
    ```
### Start the application
3. Place a Java File in the Input Directory

4. Run the application with:
    ```bash
   ./scripts/main.sh
     ```
The script is already designed to integrate with an Abstract State Machine (ASM).

### Breakdown of the Script Workflow:
1. retrieve_input.sh : Inject the Java Class into the Application.
2. mvn_setup.sh : Setup Maven and Evosuite.
3. gen_evosuite.sh : Generate Test Cases.
4. tests.sh : Test the application.
5. clean.sh : Clean the folders.
   
EvoService uses the EvoSuite services,
 see https://github.com/EvoSuite/evosuite for further information.
 
If you want to read this message run the help.sh script with:
  ```bash
  ./scripts/help.sh
  ```

## Docker Support
EvoService also provides a Docker image, making it easy to integrate into containerized environments.

### Using the Docker Image
To use EvoService within a Docker container, add the following configuration to your docker-compose.yml file:

```yml
services:
  evoservice:
    build:
      context: .
      dockerfile: Dockerfile
    image: isaacmaffeis/evoservice:latest
    volumes:
      - ./evoservice/evosuite-files:/app/evosuite-files
      - ./evoservice/evosuite-report:/app/evosuite-report
      - ./evoservice/evosuite-tests:/app/evosuite-tests
      - ./evoservice/target:/app/target
      - ./evoservice/src:/app/src
      - ./evoservice/m2:/root/.m2
      - ./evoservice/input:/app/input
      - ./evoservice/output:/app/output
```

### Running the Container
You can execute the following commands to run the various scripts within the container:
- Run the application:
  ```shell
  docker compose run --rm evoservice ./scripts/main.sh
  ```
