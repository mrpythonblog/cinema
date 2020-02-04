#!/bin/bash
file="status.txt";
truncate -s 0 $file
read -p "Download Link : " url
read -p "Time  : " time  
echo "wget \"$url\" && echo \"Finish\" > $file" | at $time
status=$(cat $file)
while [ "$status" != "Finish" ]
do
    sleep 2;
    status=$(cat $file);
done
shutdown -h now
