#!/bin/bash

#  TASK 1
# Ask the user for their name
echo "TASK 1"
echo "What is your name?"
read name cf 

# Ask the user for their age
echo "What is your age?"
read age

# Calculate the year the user was born
current_year=$(date +%Y)
birth_year=$((current_year - age))

# Output a message with the user's name and birth year
echo "Hello, $name! You were born in $birth_year."

#  TASK 2
# Create a directory with the user's name
echo "TASK 2"
mkdir $name

# Navigate into the directory
cd $name

#  TASK 3
# List all files in the current directory, sorted by file size.
echo "TASK 3"
ls -l | sort -n -k 5

#  TASK 4
# Count the number of files in the current directory and output the result.
echo "TASK 4"
# Initialize a counter variable
count=0

# Loop through each file in the current directory
for file in *
do
    # If the file is a regular file (i.e., not a directory or special file), increment the counter
    if [ -f "$file" ]
    then
        count=$((count + 1))
    fi
done

# Output the number of files
echo "The number of files in the current directory is: $count"


# TASK 5
#  Take a list of numbers as input from the user and output the sum of those numbers
echo "TASK 5"
sum=0

echo "Enter a list of numbers separated by spaces:"
read numbers

for num in $numbers
do
    sum=$((sum + num))
done

echo "The sum of the numbers is: $sum"

#  TASK 6
# Output a random number between 1 and 100
echo "TASK 6"
echo "$((1 + RANDOM % 100)) is a random number between 1 and 100"

# TASK 7
# Create a backup of a specified file by copying it to a backup directory with a timestamp in the filename.
echo "TASK 7"
# Get the filename from the user
echo "Enter the filename to backup:"
read filename

# Create the backup directory if it doesn't exist
backup_dir="backups"
mkdir -p $backup_dir

# Get the current timestamp in YYYYMMDDHHMMSS format
timestamp=$(date +%Y%m%d%H%M%S)

# Create the backup filename with the timestamp
backup_filename="$backup_dir/${filename}_${timestamp}.bak"

# Copy the file to the backup filename
cp $filename $backup_filename

echo "Backup created: $backup_filename"

#  TASK 8
# Check if a website is online and output a message indicating whether it is up or down.
echo "TASK 8"
# Get the website URL from the user
echo "Enter the website URL to check:"
read website_url

# Use the curl command to check if the website is online
curl -sSf $website_url > /dev/null

# Check the exit code of the curl command to determine if the website is up or down
if [ $? -eq 0 ]
then
    echo "Website is up"
else
    echo "Website is down"
fi

#  TASK 9
#  Convert a temperature in Celsius to Fahrenheit, using input from the user.
echo "TASK 9"
# Get the temperature in Celsius from the user
echo "Enter the temperature in Celsius:"
read celsius

# Convert Celsius to Fahrenheit
fahrenheit=$(awk "BEGIN {printf \"%.2f\", (($celsius * 9) / 5) + 32}")

# Output the result
echo "$celsius Celsius is equal to $fahrenheit Fahrenheit"

#  TASK 10
# Ask the user for a sentence, then output the sentence in reverse order. For example, if the user enters “Hello, world!”, the script should output “!dlrow ,olleH”.
echo "TASK 10"
# Prompt the user to enter a sentence
read -p "Enter a sentence: " sentence

# Reverse the sentence
length=${#sentence}
for ((i=$length-1;i>=0;i--)); do
  reverse="$reverse${sentence:$i:1}"
done

# Output the reversed sentence
echo "Reversed sentence: $reverse"