#!bin/bash

USERID=$(id -u)

#check root acces or not
if [ $USERID -ne 0 ]; then
   echo "please run this script with root access"
   exit 1
fi

#first arg  > what are you trying to install
#second arg > exit code
VALIDATE(){
     if [ $2 -ne 0 ]; then
      echo "installing mysql is ....failed"
      exit 1
   else
      echo "installing my sql is ...succes"
   fi
}


#echo "I am continuing....."
dnf list installed mysql

if [ $? -eq 0 ]; then
   echo "mysql is already installed ..... skipping"
else
   echo "installing my sql"
   dnf install mysql -y
   VALIDATE mysql $?
fi       


dnf list installed nginx

if [ $? -eq 0 ]; then
   echo "mysql is already installed ..... skipping"
else
   echo "installing nginx"
   dnf install nginx -y
   VALIDATE nginx $?
fi       