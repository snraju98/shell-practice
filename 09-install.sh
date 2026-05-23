#!bin/bash

USERID=$(id -u)

#check root acces or not
if [ $USERID -ne 0 ]; then
   echo "please run this script with root access"
   exit 1
fi


#echo "I am continuing....."


echo "installing mtsql"
dnf install mysqlfhfnfj -y

echo "iam continuing...."

