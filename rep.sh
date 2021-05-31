#!/bin/bash
if [ ! "$1" ]||[ ! "$2" ]; then
  echo "enter text file you need to scan first and then ouput directory"
  # Do something when var is zero-length
fi

input="$1"
output="$2"
redirect="redirect.txt"
usefull="usefull.txt"


if [ ! -d $output ] ; then
  mkdir $output
fi

while IFS= read -r line
do
  line=""https://"$line"
  status=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' $line)
  if [ "$status" != "200" ] ; then
    if [ "$status" == "000" ] || [ "$status" == "404" ] ; then 
      echo "$status" "$line" "not available to try"
    else
      red=$(curl -Ls -o /dev/null -w %{url_effective} $line)
      stred="$output$redirect"
      echo $status "    " $line "     " $red | tee -a $stred
    fi
  else
    strf="$output$usefull"
    echo "    >>" "   " $line| tee -a $strf
  fi

done < "$input"