#!/bin/bash
echo "This is  script 2 in which we are going to get systeminfo "
echo "Username is : $USER"
echo -e "Today's Time and Date is : \c";date
#used pipeline
echo -e "No of Users: \c";who | wc -l
exit 0
