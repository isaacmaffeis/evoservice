#!/bin/sh

INPUT_DIR="./input"
SCRIPT_DIR="./scripts"

python3 "$SCRIPT_DIR"/file_manager.py "$INPUT_DIR"

exec /bin/sh
