#!/usr/bin/env bash

# Guessing Game Project

# Function to count files in current directory
function count_files {
    find . -maxdepth 1 -type f | wc -l
}

# Store the correct number of files
correct_answer=$(count_files)

# Function to check the user's guess
function check_guess {
    if [[ $1 -lt $correct_answer ]]
    then
        echo "Your guess is too low. Try again!"
    elif [[ $1 -gt $correct_answer ]]
    then
        echo "Your guess is too high. Try again!"
    else
        echo "Congratulations! You guessed correctly!"
        return 0
    fi
    return 1
}

# Welcome message
echo "Welcome to the Guessing Game!"
echo "How many files are in the current directory?"

# Loop until the correct answer is provided
while true
do
    read -p "Enter your guess: " guess

    if ! [[ "$guess" =~ ^[0-9]+$ ]]
    then
        echo "Please enter a valid positive number."
    elif check_guess "$guess"
    then
        break
    fi
done

echo "Thank you for playing!"
