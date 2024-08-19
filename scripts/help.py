

def print_help():
    help_text = """
    EvoService:
    Junit test suite generator using EvoSuite

    To get started, please follow these steps:

    1. Place a Java File in the Input Directory

    2. Inject the Java Class into the Application:
       - To do this, run the retrieve_input.py script
         'python3 ./scripts/retrieve_input.py'

    3. Select the Script to Execute:
         //TO-DO
    
    4. Setup Maven and Evosuite:
        - You can do it manually with the following steps:
            - Install the Evosuite Runtime JAR: 
              'mvn install:install-file -Dfile="evosuite-standalone-runtime-1.2.0.jar" -DgroupId="org.evosuite" -DartifactId="evosuite-standalone-runtime" -Dversion="1.2.0" -Dpackaging="jar"'
            - Compile the Maven Project: 
              'mvn compile'
            - Copy Maven Dependencies:
              'mvn dependency:copy-dependencies -DincludeScope=runtime'
            - Setup Evosuite:
              'java -jar evosuite-standalone-runtime-1.2.0.jar -setup target/classes target/dependency/commons-collections-3.2.2.jar'
        - Or simply run the mvn_setup shell script:
          './scripts/mvn_setup.sh'
    
    5. Generate Test Cases:
        - To generate test cases for a specific class, run the following command:
          'java -jar evosuite-standalone-runtime-1.2.0.jar -class <inputFile>' -<params>
        - Or run the python script gen_evosuite_sh.py to generate the shell 
          script with the desired command:
           'python3 gen_evosuite_sh.py -<params>'
           and then proceed to execute it with:
           './scripts/gen_evosuite.sh'
        - run evosuite app help to see all the available options and params
          'java -jar evosuite-1.2.0.jar -help'
        
    6. Test the application
        - Copy Generated Test Cases into the project:
          'xcopy evosuite-tests\\* src\\test\\java /E /I /Y'
          and then run the Test suite:
          'mvn test'
         
    
    EvoService uses the EvoSuite services,
     see https://github.com/EvoSuite/evosuite for further information.
     
    If you want to read this message again run the help.py script with:
      'python3 ./scripts/help.py'

    """
    print(help_text)


if __name__ == "__main__":
    print_help()
