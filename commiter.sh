#!/bin/bash

# Start Date
read -p "Enter start date: " start_date

# How many years
read -p "Enter number of years: " years
# End Date
current_date=$start_date
last_date=$start_date

#get total days by multiplying years with 365
total_days=$(($years*365))

# loop for 1 year
for (( i=0; i<total_days ; i++ )); do
#create file with current_date and subash
mv "${last_date}.txt" "$current_date.txt" || touch "$last_date.txt"
git add .
git commit -m "Added $current_date"

# Set the committer
git commit --amend --no-edit --date="$current_date 14:00:00"

#move to the next day
current_date=$(date -j -v+1d -f "%Y-%m-%d" "$current_date" +"%Y-%m-%d")
# last_date=$(date -j -v+1d -f "%Y-%m-%d" "$last_date" +"%Y-%m-%d")
done