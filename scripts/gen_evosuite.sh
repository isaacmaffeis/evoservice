#!/bin/bash
#gen_evosuite.sh

echo "# gen_evosuite.sh"
echo "## Generating test suite with EvoSuite"

evoservice_dir=${1:-"/app/src/main/java/org/evoservice/"}
shift
echo "evoservice_dir: $evoservice_dir"

readarray -d '' directories < <(find "$evoservice_dir" -mindepth 1 -maxdepth 1 -type d -print0)
[ ${#directories[@]} -ne 1 ] && { echo "Error: evoservice_dir is not composed correctly"; exit 1; }
package_dir=$(basename "${directories[0]}")
echo "package_dir: $package_dir"

readarray -d '' asm_files < <(find "$evoservice_dir"/"$package_dir" -maxdepth 1 -name "*_ASM.java" -type f -print0)
[ ${#asm_files[@]} -ne 1 ] && { echo "Error: $package_dir is not composed correctly"; exit 1; }
asm_file=$(basename "${asm_files[0]}")
echo "asm_file: $asm_file"
asm_file_no_extension="${asm_file%.java}"

echo "Running evosuite-1.0.6 on org.evoservice.$package_dir.$asm_file_no_extension"
echo "java -jar evosuite-1.0.6.jar -class org.evoservice.$package_dir.$asm_file_no_extension" $*
java -jar evosuite-1.0.6.jar -class org.evoservice."$package_dir"."$asm_file_no_extension" $*

echo "# gen_evosuite.sh completed"
exit 0
