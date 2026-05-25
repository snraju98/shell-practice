#!bin/bash



USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
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


for package in $@
do
   echo "Installing $pacakage"
done

