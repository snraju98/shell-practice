#!bin/bash

USERID=$(id -u)

#check root acces or not
if [ $USERID -ne 0 ]; then
   echo "please run this script with root access"
   exit 1
fi


#echo "I am continuing....."


echo "installing mysql"
dnf install mysqlgfdyytf -y

if [ $? -ne 0 ]; then
  echo "insatalling mysql is fail"
  exit 1
else
   echo "installing mysql is ....success"
fi

