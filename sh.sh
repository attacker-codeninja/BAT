#!/bin/bash
if [ ! "$1" ]; then
  echo "enter domain"
  # Do something when var is zero-length
fi



subfinder -d $1 -o findf.txt> /dev/null													#use subfinder for domain enum

sublist3r -d $1 -o listf.txt> /dev/null													#use sublist3r for domain enum

cat findf.txt listf.txt > combined.txt													#combine all domains

./trace /home/kali/bat/findf.txt |tee -a filtered.txt 									#remove duplicate to save resources

cat filtered.txt |./httprobe |tee -a httpf.txt											#check which domains are with port 80 or 443 open

cat httpf.txt |grep "https" |tee -a httpxf.txt

sort httpxf.txt >httprobe.txt

./go httprobe.txt| tee -a statf.txt 													#used to detect status code

cat statf.txt|grep "200" |awk '{print $4}'| tee -a usefull.txt							#list all url with "200" to usefull.txt

cat statf.txt|grep "302" |awk '{print $4}'| tee -a usefull.txt							#list all url with "302" to usefull.txt

gospider -o output -S usefull.txt														#spider all domains.


