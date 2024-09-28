#!/bin/bash
#clean.sh

echo "# clean.sh"
echo "## Cleaning folders"

delete_function() {
  dir_to_delete=$1
  shift
  files_to_keep=("$@")

  tmp_dir=$(mktemp -d) || { echo "Error: tmp dir not created"; exit 1; }

  for file in "${files_to_keep[@]}"; do
    if find "$dir_to_delete" -name "$file" -exec mv {} "$tmp_dir" \;; then
          echo "Found and moved: $file"
        else
          echo "Error: finding or moving $file"
          exit 1;
        fi
  done

  echo "Cleaning the folder: $dir_to_delete"
  rm -rf "${dir_to_delete:?}"/*

  for file in "${files_to_keep[@]}"; do
    if find "$tmp_dir" -name "$file" -exec mv {} "$dir_to_delete" \;; then
          echo "Restored: $file"
        else
          echo "Error: restoring $file failed"
          exit 1;
        fi
  done

  rmdir "$tmp_dir"

}

# Dir path to delete
input_dir="./input/"
target_dir="./target/"
main_dir="./src/main/java/org/evoservice/"
test_dir="./src/test/java/"
evosuite_tests_dir="./evosuite-tests/"
evosuite_report_dir="./evosuite-report/"

# File to keep
main_file="Main.java"
gitignore_file=".gitignore"

delete_function "$input_dir" "$gitignore_file"
delete_function "$target_dir"
delete_function "$main_dir" "$main_file"
delete_function "$test_dir" "$gitignore_file"
delete_function "$evosuite_tests_dir" "$gitignore_file"
delete_function "$evosuite_report_dir" "$gitignore_file"

echo "# clean.sh completed"
exit 0
