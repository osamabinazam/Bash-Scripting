#!/bin/bash
echo "Variables in Shell Scripting...."
integervalue=78
floatValue=67.88
stringValue="Hello!, This is a string value..."
booleanValue=true

echo "=========================================================="
echo "            Accessing variables using Dollar Sign         "
echo "=========================================================="


echo "This is the Value of Integer Variable : $integervalue"
echo "This is the Value of Float  Variable : $floatValue"
echo "This is the Value of String Variable : $stringValue"
echo "This is the Value of Boolean  Variable : $booleanValue"

echo "=========================================================="
echo "            Accessing variables using curly braces        "
echo "=========================================================="

echo "This is the Value of Integer Variable : ${integervalue}"
echo "This is the Value of Float  Variable : ${floatValue}"
echo "This is the Value of String Variable : ${stringValue}"
echo "This is the Value of Boolean  Variable : ${booleanValue}"

echo "=========================================================="
echo "      Assigning global variable to local variable         "
echo "=========================================================="

date=`date`
echo  "Date is : $date".com
