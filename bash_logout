#!/bin/bash
# ~/.bash_logout

/usr/bin/clear

pts=pts/`tty | grep -o '[0-9]*$'`
#mother=`who | grep $USER | grep $pts | awk '{print $5}' | sed 's,[()],,g'`
mother=`who | sed 's,.* (\(.*\)),\1,g'`
export short_mother=`echo $mother | grep -io '^[a-zA-Z0-9_]*'`
if [ "$short_mother" == "master" ]; then
    export short_mother='tier3-uta'
fi

if [ $TTY == 0 ]; then
    winname $short_mother
    tabname $short_mother
fi
