#!/bin/bash
#retrieve_input.sh

echo "# retrieve_input.sh"

[ $# -gt 2 ] && { echo "Error: wrong number of arguments, max is 2"; exit 1; }

input_dir=${1:-"/app/input"}
output_dir=${2:-"/app/src/main/java/org/evoservice"}

[ ! -d "$input_dir" ] && { echo "Error: $input_dir not found."; exit 1; }

[ ! -d "$output_dir" ] && { echo "Warning: $output_dir not found";}

file_count=$(find "${input_dir}" -name "*.java" | wc -l)

[ "$file_count" -lt 2 ] && { echo "Error: Less than 2 .java files found."; exit 1; }

echo "$file_count java files found"

readarray -d '' java_files < <(find "$input_dir" -name "*.java" -print0)

for java_file in "${java_files[@]}"; do
  java_file_name=$(basename "$java_file")
  java_file_name_no_extension="${java_file_name%.java}"

  echo "Processing $java_file_name in the $input_dir directory..."
  echo "File name: $java_file_name_no_extension"

  if [[ "$java_file_name_no_extension" =~ _Exe$ ]]; then
    rm "$java_file" || { echo "Error: deleting $java_file operation failed"; exit 1; }
    echo "File $java_file_name deleted."
    continue
  fi

  package_dir_name=${java_file_name_no_extension%_ASM}
  package_dir_name_lower=$(echo "$package_dir_name" | tr '[:upper:]' '[:lower:]')
  echo "Package name: $package_dir_name_lower"

  mkdir -p "$output_dir/$package_dir_name_lower"

  echo "Moving $java_file_name into $output_dir/$package_dir_name_lower/"
  mv "$java_file" "$output_dir/$package_dir_name_lower/"

  echo "Adding package name: $package_dir_name_lower to file header."
  sed -i "1i package org.evoservice.$package_dir_name_lower;" "$output_dir/$package_dir_name_lower/$java_file_name"

  echo "$java_file processed."

done

echo "# retrieve_input.sh completed"
exit 0
