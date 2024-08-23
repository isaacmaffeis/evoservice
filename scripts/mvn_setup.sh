#!/bin/bash

JAR_EVOSUITE="evosuite-1.0.6.jar"
DEPENDENCY_JAR="target/dependency/commons-collections-3.2.2.jar"
TARGET_CLASSES_PATH="target/classes"

echo "# mvn_setup.sh"
echo "## Maven and Evosuite setup"

echo "Running mvn compile..."
mvn compile

echo "Copying the runtime dependencies inside target..."
mvn dependency:copy-dependencies -DincludeScope=runtime

echo "Generating the evosuite.properties file in ./evosuite-files..."
java -jar "$JAR_EVOSUITE" -setup "$TARGET_CLASSES_PATH" "$DEPENDENCY_JAR"

echo "mvn_setup.sh process completed."
