#!/bin/bash

# Function to display help/usage
show_help() {
    echo "Usage: $0 [-e|--empty] [-h|--help]"
    echo
    echo "Options:"
    echo "  -e, --empty   Create empty test case files without prompting for input"
    echo "  -h, --help    Show this help message and exit"
}

# Check for the --help, -h, or -e flag
empty_mode=false
for arg in "$@"; do
    case $arg in
        -e|--empty)
        empty_mode=true
        shift
        ;;
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
last_test_case=$(ls -d test-case-* 2>/dev/null | sort | tail -n 1)

# Determine the next test case number
if [ -z "$last_test_case" ]; then
  next_test_case="tests/test-case-001"
else
  last_number=$(echo $last_test_case | grep -o '[0-9]*')
  next_number=$(printf "%03d" $((10#$last_number + 1)))
  next_test_case="tests/test-case-$next_number"
fi

# Check if quiet mode is enabled
if [ "$empty_mode" = true ]; then
  # Create the new test case folder
  mkdir -p "$next_test_case"

  # Create empty description.txt, input.txt, and output.txt
  touch "$next_test_case/description.txt"
  touch "$next_test_case/input.txt"
  touch "$next_test_case/output.txt"
  echo "Created $next_test_case with empty description.txt, input.txt, and output.txt"
else
  # Prompt the user for input to fill the files
  echo "Enter a description for the test case:"
  read -r description
  echo "Enter the input data for the program:"
  read -r input_data
  echo "Enter the expected output:"
  read -r expected_output

  # Create the new test case folder
  mkdir -p "$next_test_case"

  # Create description.txt, input.txt, and output.txt with the user's input
  echo "$description" > "$next_test_case/description.txt"
  echo "$input_data" > "$next_test_case/input.txt"
  echo "$expected_output" > "$next_test_case/output.txt"

  echo "Created $next_test_case with description.txt, input.txt, and output.txt"
fi
