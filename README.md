1. Run `mvn compile`
2. Run `mvn dependency:copy-dependencies -DincludeScope=runtime`
3. Run `docker compose up`
4. Run `docker compose run --rm evosuite -setup target/classes target/dependency/commons-collections-3.2.2.jar`
5. Run `docker compose run --rm evosuite -class <inputFile>`
6. Run `xcopy evosuite-tests\* src\test\java /E /I /Y`
7. Run `mvn test`