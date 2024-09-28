#!/bin/bash

echo "# tests.sh"
echo "## Test the generated test suite"

echo "Copying Generated Test Cases into the project..."
cp -r evosuite-tests/* src/test/java/ || { echo "Error: Copying filed"; exit 1; }

echo "Running the mvn test phase..."
if mvn test; then
    echo "Tests passed. Exporting the tests..."
    mkdir -p ./output/
    find evosuite-tests/ -type f -name "*_ASM_ESTest.java" -exec cp {} output/ \;
else
    echo "Tests failed. Export aborted."
    exit 1
fi

echo "tests.sh completed."
exit 0
