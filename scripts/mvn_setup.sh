#!/bin/bash

JAR_EVOSUITE="evosuite-1.2.0.jar"
JAR_EVOSUITE_RUNTIME="evosuite-standalone-runtime-1.2.0.jar"
GROUP_ID="org.evosuite"
ARTIFACT_ID="evosuite-standalone-runtime"
VERSION="1.2.0"
PACKAGING="jar"
DEPENDENCY_JAR="target/dependency/commons-collections-3.2.2.jar"
TARGET_CLASSES_PATH="target/classes"

echo "# mvn_setup.sh"
echo "## Maven and Evosuite setup"

echo "Installing evosuite-standalone-runtime-1.2.0.jar..."
mvn install:install-file \
  -Dfile="$JAR_EVOSUITE_RUNTIME" \
  -DgroupId="$GROUP_ID" \
  -DartifactId="$ARTIFACT_ID" \
  -Dversion="$VERSION" \
  -Dpackaging="$PACKAGING"

echo "Running mvn compile..."
mvn clean compile

echo "Copying the runtime dependencies inside target..."
mvn dependency:copy-dependencies -DincludeScope=runtime

echo "Generating the evosuite.properties file in ./evosuite-files..."
java -jar "$JAR_EVOSUITE" -setup "$TARGET_CLASSES_PATH" "$DEPENDENCY_JAR"

echo "mvn_setup.sh process completed."
