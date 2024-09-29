#!/bin/bash
#main.sh

echo "
     _____                                _
    | ____|_   _____  ___  ___ _ ____   _(_) ___ ___
    |  _| \ \ / / _ \/ __|/ _ \ '__\ \ / / |/ __/ _ \\
    | |___ \ V / (_) \__ \  __/ |   \ V /| | (_|  __/
    |_____| \_/ \___/|___/\___|_|    \_/ |_|\___\___|
    "

execute_script() {
  local script_name=$1
  shift
  echo "Starting $script_name"
  ./scripts/"$script_name" "$@"
  exit_code=$?

  if [[ $exit_code -eq 0 ]]; then
    echo "$script_name completed with success"
  else
    echo "$script_name terminated with errors (exit code: $exit_code)"
    clean
    exit 1
  fi
  echo "####################################"
}

clean () {
  echo "Cleaning the folders..."
  ./scripts/clean.sh
  exit_code=$?
  if [[ exit_code -eq 0 ]]; then
    echo "clean.sh completed with success"
  else
    echo "clean.sh terminated with errors (exit code: $exit_code)"
    exit 1
  fi
}

execute_script "retrieve_input.sh"
execute_script "mvn_setup.sh"
execute_script "gen_evosuite.sh" "./src/main/java/org/evoservice/" "-criterion LINE:BRANCH" "-Dminimize=true" "-Dassertion_strategy=all"
execute_script "tests.sh"
clean
exit 0
