#!/bin/bash

#Taking input from user
echo "Please Enter your name: "
read name
echo "Please Enter your age: "
read age
echo "Please Enter your Gender: "
read gender

echo "Name: $name"
echo "Age: $age"
echo "Gender: $gender"

#Taking Input as well as printing message
# -p -> Used to provide a helping message
# -s -> Used to get invisible input from user such as password
# -t -> Used to set time in seconds for taking input data
# -n -> Used to set the limit of characters

read -p "Enter the name of your Operating System: " osname
read -p "Enter the model of your laptop: " laptop

#Taking Confidential info
read -p "Enter Username: " username
read -sp "Enter password: " password

echo -e " \nUsername : $username"
echo "Password : $password"

#Taking Multiple Input in single Line

read -p "Enter Your Favorite programming languages : " p1 p2 p3 p4 p5
echo "$p1 $p2 $p3 $p4 $p5"
