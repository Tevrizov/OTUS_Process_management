#!/bin/bash
#!!!!!!

TMP1=$(mktemp)
TMP2=$(mktemp)
TMP3=$(mktemp)

echo "PID" > $TMP1
echo "STAT          " > $TMP2
echo "NAME" > $TMP3

cat /proc/[0-9]*/status | grep -i "^pid" | awk '{print $2}' >> $TMP1
cat /proc/[0-9]*/status | grep -i "^state" | awk '{print $2, $3}' >> $TMP2
cat /proc/[0-9]*/status | grep -i "name" | awk '{print $2}' >> $TMP3

paste $TMP1 $TMP2 $TMP3 | sort -g
rm -f $TMP{1..3}
