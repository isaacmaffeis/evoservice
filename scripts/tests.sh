#!/bin/bash

echo "# tests.sh"
echo "## Test the generated test suite"

echo "Copying Generated Test Cases into the project..."
cp -r evosuite-tests/* src/test/java/

echo "Running the mvn test phase..."
if mvn test; then
    echo "Tests passed. Exporting the tests..."
    mkdir -p ./output/
    cp -r evosuite-tests/* output/
else
    echo "Tests failed. Export aborted."
fi

echo "Cleaning the project"
python3 scripts/clean.py

echo "tests.sh process completed."
