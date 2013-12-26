#!/bin/bash
# From a list of emails (emails only, no names) this script will send an email to each address, prompting for a message for each one.
# Also requires a message body file ('message.txt').
# Assumes a fully configured server with mutt installed. All pertinent files must be in the same directory.
IFS=$'\r\n' ADDRESSES=($(cat email-list.txt))
NUMBEROFLINES=`wc -l email-list.txt | awk {'print $1'}`
BODY=`cat message.txt`
X=0
while [ $X -lt $NUMBEROFLINES ] 
do
  echo "${ADDRESSES[$X]}"
  read LINE
  echo "$LINE $BODY" | mutt -e "set content_type=text/html" -s "Season's Greetings" ${ADDRESSES[$X]}
  let "X += 1"
done
