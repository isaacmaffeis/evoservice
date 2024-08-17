

def print_help():
    help_text = """
    EvoService:
    Junit test suite generator using EvoSuite

    To get started, please follow these steps:

    1. Place a Java File in the Input Directory

    2. Inject the Java Class into the Application:
       - To do this, run the retrieveInput.py script

    3. Select the Script to Execute:
       - Select one of the following scripts to execute:
         1. help.py: show this message.
         2. retrieveInput.py: retrieve the Java file and inject the class into
          the application for further processing.
         3. //TO-DO
    
    4. Setup Maven and Evosuite:
        - Install the Evosuite Runtime JAR: 
         'mvn install:install-file -Dfile="evosuite-standalone-runtime-1.2.0.jar" -DgroupId="org.evosuite" -DartifactId="evosuite-standalone-runtime" -Dversion="1.2.0" -Dpackaging="jar"'
        - Compile the Maven Project: 
         'mvn compile'
        - Copy Maven Dependencies:
         'mvn dependency:copy-dependencies -DincludeScope=runtime'
        - Setup Evosuite:
         'java -jar evosuite-standalone-runtime-1.2.0.jar -setup target/classes target/dependency/commons-collections-3.2.2.jar'
    
    5. Generate Test Cases:
        To generate test cases for a specific class, run the following command:
        'java -jar evosuite-standalone-runtime-1.2.0.jar -class <inputFile>'
        // TO-DO : add params
        
    6. Test the application
        - Copy Generated Test Cases into the project:
         'xcopy evosuite-tests\\* src\\test\\java /E /I /Y'
        - Run the Test suite:
         'mvn test'
         
    
    EvoService uses the EvoSuite services,
     see https://github.com/EvoSuite/evosuite for further information.
    """
    print(help_text)


if __name__ == "__main__":
    print_help()
