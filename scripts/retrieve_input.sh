#!/bin/bash

# retrieve the input

echo "retrieving the input file..."

[ $# -gt 2 ] && { echo "Error - wrong number of arguments, max is 2"; exit 1;}

input_dir=${1:-"/app/input"}
output_dir=${2:-"/app/src/main/java/org/evoservice"}

if [ ! -d "$input_dir" ]
then
   echo "Error: $input_dir not found."
   exit 1
fi

if [ ! -d "$output_dir" ]
then
   echo "$output_dir not found, creating the folder..."
   mkdir -p output_dir
fi
