

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
         3. **Script 3**: Description...

    EvoService uses the EvoSuite services,
     see https://github.com/EvoSuite/evosuite for further information.
    """
    print(help_text)


if __name__ == "__main__":
    print_help()
