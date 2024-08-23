#!/bin/bash

echo "# tests.sh"
echo "## Test the generated test suite"

echo "Copying Generated Test Cases into the project..."
cp -r evosuite-tests/* src/test/java/

echo "Running the mvn test phase..."
mvn test

echo "tests.sh process completed."
