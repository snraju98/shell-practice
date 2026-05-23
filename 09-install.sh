#!bin/bash

USERID=$(id -u)

#check root acces or not
if [ $USERID -ne 0 ]; then
   echo "please run this script with root access"
fi

echo "I am continuing....."