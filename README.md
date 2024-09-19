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
1. Open PowerShell or your preferred terminal and clone the repository:
    ```shell
    git clone https://github.com/isaacmaffeis/asmetal2java.git
    ```

2. Navigate into the project directory:
    ```shell
    cd ./evoservice
    ```
### Start the application
3. Place a Java File in the Input Directory

4. Inject the Java Class into the Application:
   - To do this, run the retrieve_input.py script
     ```shell
     python3 ./scripts/retrieve_input.py
     ```
     
3. Setup Maven and Evosuite:
    - You can do it manually with the following steps:
        - Compile the Maven Project: 
          ```shell
          mvn compile
          ```
        - Copy Maven Dependencies:
          ```shell
          mvn dependency:copy-dependencies -DincludeScope=runtime
          ```
        - Setup Evosuite:
          ```shell
          java -jar evosuite-standalone-runtime-1.0.6.jar -setup target/classes target/dependency/commons-collections-3.2.2.jar
          ```
    - Or simply run the mvn_setup shell script:
      ```shell
      ./scripts/mvn_setup.sh
      ```

4. Generate Test Cases:
    - To generate test cases for a specific class, run the following command:
      ```shell
      java -jar evosuite-standalone-runtime-1.0.6.jar -class <inputFile>' -<params>
      ```
    - Or run the python script gen_evosuite_sh.py to generate the shell 
      script with the desired command:
       ```shell
       python3 gen_evosuite_sh.py -<params>
       ```
       and then proceed to execute it with:
       ```shell
       ./scripts/gen_evosuite.sh
       ```
    - run evosuite app help to see all the available options and params
      ```shell
      java -jar evosuite-1.0.6.jar -help
      ```
    
5. Test the application
    - Copy Generated Test Cases into the project:
       ```shell
       cp -r evosuite-tests/* src/test/java/
       ```
      and then Run the Test suite:
      ```shell
      mvn test
      ```
    - Or run the tests.sh script with: 
      ```shell
      ./scripts/tests.sh
      ```
     
EvoService uses the EvoSuite services,
 see https://github.com/EvoSuite/evosuite for further information.
 
If you want to read this message run the help.py script with:
  ```shell
  python3 ./scripts/help.py
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
      - ./evoservice/scripts/gen_evosuite.sh:/app/scripts/gen_evosuite.sh
      - ./evoservice/src:/app/src
      - ./evoservice/m2:/root/.m2
      - ./evoservice/input:/app/input
      - ./evoservice/output:/app/output
```

### Running the Container
You can execute the following commands to run the various scripts within the container:
- Inject the Java class:
  ```shell
  docker compose run --rm evoservice python3 ./scripts/retrieve_input.py
  ```
- Set up Maven and EvoSuite:
  ```shell
  docker compose run --rm evoservice ./scripts/mvn_setup.sh
  ```
- Generate the EvoSuite shell script:
  ```shell
  docker compose run --rm evoservice python3 scripts/gen_evosuite_sh.py -criterion LINE:BRANCH -Dminimize=true -Dassertion_strategy=all
  ```
- Execute the generated script:
  ```shell
  docker compose run --rm evoservice ./scripts/gen_evosuite.sh
  ```
- Run the test suite:
  ```shell
  docker compose run --rm evoservice ./scripts/tests.sh
  ```
