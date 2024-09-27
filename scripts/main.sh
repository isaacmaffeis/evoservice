#!/bin/bash
#main.sh

execute_script() {
  local script_name=$1
  shift

  echo "Starting $script_name"
  /app/scripts/"$script_name" "$@"
  exit_code=$?

  if [[ $exit_code -eq 0 ]]; then
    echo "$script_name completed with success"
  else
    echo "$script_name terminated with errors (exit code: $exit_code)"
    exit 1
  fi
}

execute_script "retrieve_input.sh"
execute_script "mvn_setup.sh"
execute_script "gen_evosuite.sh" "/app/src/main/java/org/evoservice/" "-criterion LINE:BRANCH" "-Dminimize=true" "-Dassertion_strategy=all"
execute_script "clean.sh"