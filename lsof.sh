#!/bin/bash

TMP1=$(mktemp)
TMP2=$(mktemp)
TMP3=$(mktemp)

pid=$(awk '{print $1}' /proc/[0-9]*/stat 2> /dev/null | sort -h)

echo "COMMAND" > $TMP1
echo "PID" > $TMP2
echo "NAME" > $TMP3

for i in $pid; 
    do 
        count1=$(ls -l /proc/$i/fd 2>/dev/null | awk '{print $11}' | tail -n +2 | tee -a $TMP3 | wc -l)
        count2=$(cat /proc/$i/maps 2> /dev/null | awk '{print $6}' | grep -v "^$\|^\[" | sort | uniq | tee -a $TMP3 | wc -l)
        [ "$count1" -gt 0 ] && printf "$i\n%.0s" $(seq "$count1") >> $TMP2 && printf "$(cat /proc/$i/status | grep -i "name" | awk '{print $2}')\n%.0s" $(seq "$count1") >> $TMP1
        [ "$count2" -gt 0 ] && printf "$i\n%.0s" $(seq "$count2") >> $TMP2 && printf "$(cat /proc/$i/status | grep -i "name" | awk '{print $2}')\n%.0s" $(seq "$count2") >> $TMP1
    done

paste $TMP1 $TMP2 $TMP3 

rm -f $TMP{1..3}