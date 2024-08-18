#!/bin/bash

JAR_EVOSUITE="evosuite-1.2.0.jar"
JAR_EVOSUITE_RUNTIME="evosuite-standalone-runtime-1.2.0.jar"
GROUP_ID="org.evosuite"
ARTIFACT_ID="evosuite-standalone-runtime"
VERSION="1.2.0"
PACKAGING="jar"
DEPENDENCY_JAR="target/dependency/commons-collections-3.2.2.jar"
TARGET_CLASSES_PATH="target/classes"

echo "Maven and Evosuite setup"

echo "Running mvn install:install-file..."
mvn install:install-file \
  -Dfile="$JAR_EVOSUITE_RUNTIME" \
  -DgroupId="$GROUP_ID" \
  -DartifactId="$ARTIFACT_ID" \
  -Dversion="$VERSION" \
  -Dpackaging="$PACKAGING"

echo "Running mvn compile..."
mvn compile

echo "Running mvn dependency:copy-dependencies..."
mvn dependency:copy-dependencies -DincludeScope=runtime

echo "Running java -jar with Evosuite..."
java -jar "$JAR_EVOSUITE" -setup "$TARGET_CLASSES_PATH" "$DEPENDENCY_JAR"

echo "Process completed."
