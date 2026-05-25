#!bin/bash


set -e
USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

trap 'echo "error at $LINENO", command: $BASH_COMMAND" ' ERR

#check root acces or not
if [ $USERID -ne 0 ]; then
   echo "please run this script with root access"
   exit 1
fi



for package in $@
do
   echo "$TIMESTAMP [INFO] Installing $pacakage"
   dnf list installed $pacakage  &>> $LOGS_FILE
   if [ $? -ne 0 ]; then
      dnf install $pacakage -y &>> $LOGS_FILE
      
    else
     echo -e "$TIMESTAMP [INFO] $pacakage already installed ... $Y SKIPPING $N"
   fi
done