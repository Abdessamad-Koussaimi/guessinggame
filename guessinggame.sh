#!/usr/bin/env bash

count_files() {
    local count=0
    local file

    for file in *; do
        if [ -f "$file" ]; then
            count=$((count + 1))
        fi
    done

    echo "$count"
}

file_count=$(count_files)
echo "Guessing Game"
echo "How many non-hidden files are in the current directory?"

while true; do
    printf "Enter your guess: "
    if ! IFS= read -r guess; then
        echo
        exit 1
    fi

    if [[ ! "$guess" =~ ^[0-9]+$ ]]; then
        echo "Please enter a non-negative whole number."
    else
        guess=$((10#$guess))
        if (( guess < file_count )); then
            echo "Your guess is too low."
        elif (( guess > file_count )); then
            echo "Your guess is too high."
        else
            echo "Congratulations! You guessed correctly."
            break
        fi
    fi
done
