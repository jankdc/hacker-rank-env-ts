#!/bin/bash

# Function to display help/usage
show_help() {
    echo "Usage: $0 [-h|--help]"
    echo
    echo "Options:"
    echo "  -h, --help    Show this help message and exit"
}

# Check for the --help, -h flag
for arg in "$@"; do
    case $arg in
        -h|--help)
        show_help
        exit 0
        ;;
        *)
        echo "Unknown option: $arg"
        show_help
        exit 1
        ;;
    esac
done

# Get the current directory
current_dir=$(pwd)

# Find the highest existing test case number
last_test_case=$(ls -d tests/test-case-* 2>/dev/null | sort | tail -n 1)

# Determine the next test case number
if [ -z "$last_test_case" ]; then
  next_test_case="tests/test-case-001"
else
  last_number=$(echo $last_test_case | grep -o '[0-9]*')
  next_number=$(printf "%03d" $((10#$last_number + 1)))
  next_test_case="tests/test-case-$next_number"
fi

# Create the new test case folder
mkdir -p "$next_test_case"

# Create empty description.txt, input.txt, and output.txt
touch "$next_test_case/input.txt"
touch "$next_test_case/output.txt"
echo "Created $next_test_case with empty input.txt, and output.txt"
