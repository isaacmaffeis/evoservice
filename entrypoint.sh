#!/bin/sh

INPUT_DIR="./input"
SCRIPT_DIR="./scripts"

python3 "$SCRIPT_DIR"/retrieveInput.py "$INPUT_DIR"

exec /bin/sh
