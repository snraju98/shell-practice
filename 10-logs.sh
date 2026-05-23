#!bin/bash

USERID=$(id -u)
LOGS_DIR=/home/ec2-user/shell-logs
LOGS_FILE="$LOGS_DIR/$0.log"

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
dnf list installed mysql  &>> $LOGS_FILE

if [ $? -eq 0 ]; then
   echo "mysql is already installed ..... skipping"
else
   echo "installing my sql"
   dnf install mysql -y
   VALIDATE mysql $?
fi       


dnf list installed nginx  &>> $LOGS_FILE

if [ $? -eq 0 ]; then
   echo "mysql is already installed ..... skipping"
else
   echo "installing nginx"
   dnf install nginx -y
   VALIDATE nginx $?
fi       