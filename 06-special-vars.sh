#!bin/bash/bash

echo "all variables passed to script : $@"
echo "Number of variables passed: $#"
echo "first variable: $1"
echo "script name: $0"
echo "who is running this: $USER"
echo "which directory: $pwd"
echo "user home directory: $HOME"
echo "pid of the current script: $$"
sleep 5 &
echo "pid of background command running just now: $!"
wait $!
echo "line number: $LINENO"
echo "script executed in $SECONDS seconds"