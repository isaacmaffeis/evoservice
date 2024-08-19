#!/bin/bash

echo "# tests.sh"
echo "## Test the generated test suite"

echo "Installing evosuite-standalone-runtime-1.2.0.jar..."
mvn install:install-file -Dfile="evosuite-standalone-runtime-1.2.0.jar" -DgroupId="org.evosuite" -DartifactId="evosuite-standalone-runtime" -Dversion="1.2.0" -Dpackaging="jar"

echo "Copying Generated Test Cases into the project..."
cp -r evosuite-tests/* src/test/java/

echo "retrieve input..."
python3 ./scripts/retrieve_input.py
mvn compile

echo "Running the mvn test phase..."
mvn test

echo "tests.sh process completed."
