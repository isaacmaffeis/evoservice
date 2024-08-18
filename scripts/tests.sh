#!/bin/bash

echo "# tests.sh"
echo "## Test the generated test suite"

echo "Copying Generated Test Cases into the project..."
xcopy evosuite-tests\\* src\\test\\java /E /I /Y

echo "Running the mvn test phase..."
mvn test

echo "tests.sh process completed."
