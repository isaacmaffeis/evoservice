1. Run `mvn install:install-file -Dfile="evosuite-standalone-runtime-1.2.0.jar" -DgroupId="org.evosuite" -DartifactId="evosuite-standalone-runtime" -Dversion="1.2.0" -Dpackaging="jar"`
2. Run `mvn compile`
3. Run `mvn mvnependency:copy-dependencies -DincludeScope=runtime`
4. Run `java -jar evosuite-standalone-runtime-1.2.0.jar -setup target/classes target/dependency/commons-collections-3.2.2.jar`
5. Run `java -jar evosuite-standalone-runtime-1.2.0.jar -class <inputFile>`
6. Run `xcopy evosuite-tests\* src\test\java /E /I /Y`
7. Run `mvn test`