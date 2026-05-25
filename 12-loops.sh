#!bin/bash



USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

#check root acces or not
if [ $USERID -ne 0 ]; then
   echo "please run this script with root access"
   exit 1
fi

#first arg  > what are you trying to install
#second arg > exit code
VALIDATE(){
    if [ $2 -ne 0 ]; then 
       echo $TIMESTAMP [ERROR] "installing $1 is ....failed" | tee -a $LOGS_FILE
       exit 1
    else
       echo $TIMESTAMP [INFO] "installing $1 is ...succes"   | tee -a $LOGS_FILE
    fi
}


for package in $@
do
   echo "Installing $pacakage"
   dnf list installed $pacakage  &>> $LOGS_FILE
   if [ $? -ne 0 ]; then
      dnf install $pacakage -y &>> $LOGS_FILE
      VALIDATE "Installing $pacakage" $?
    else
     echo "$TIMESTAMP [INFO] $pacakage already installed ... skipping"
   fi
done


