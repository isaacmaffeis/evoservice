#!/bin/bash
#help.sh

echo "
     _____                                _
    | ____|_   _____  ___  ___ _ ____   _(_) ___ ___
    |  _| \ \ / / _ \/ __|/ _ \ '__\ \ / / |/ __/ _ \
    | |___ \ V / (_) \__ \  __/ |   \ V /| | (_|  __/
    |_____| \_/ \___/|___/\___|_|    \_/ |_|\___\___|

    EvoService:
    Junit test suite generator using EvoSuite

    To get started, please follow these steps:

    1. Place a Java File in the Input Directory

    2. Run the main.sh script with:
        './scripts/main.sh'

    The script is already designed to integrate with an Abstract State Machine (ASM)

    Breakdown of the Script Workflow:
    1. retrieve_input.sh : Inject the Java Class into the Application.
    2. mvn_setup.sh : Setup Maven and Evosuite.
    3. gen_evosuite.sh : Generate Test Cases.
    4. tests.sh : Test the application.
    5. clean.sh : Clean the folders.

    EvoService uses the EvoSuite services,
     see https://github.com/EvoSuite/evosuite for further information.

    If you want to read this message again run the help.sh script with:
      './scripts/help.sh'

    "